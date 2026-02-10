require('dotenv').config();
const express = require('express');
const cors = require('cors');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const { sequelize, User, Test, Question, Attempt, QuestionTime, Class, Batch, Mistake, initDB } = require('./database');
const { Op } = require('sequelize');

const app = express();
const PORT = process.env.PORT || 5005;
const SECRET_KEY = process.env.JWT_SECRET || 'super_secret_jwt_key_should_be_in_env'; // Fallback for dev only

const allowedOrigins = [
    'http://localhost:5173', // Vite default
    'http://localhost:5174', // Vite default alternative
    process.env.CLIENT_URL // Production URL
].filter(Boolean);

app.use(cors({
    origin: function (origin, callback) {
        if (!origin || allowedOrigins.indexOf(origin) !== -1) {
            callback(null, true);
        } else {
            // Build this to be permissive in dev if origin is undefined (e.g. Postman), but strict in prod
            callback(new Error('Not allowed by CORS'));
        }
    },
    credentials: true
}));
app.use(express.json());

// Middleware to verify Token
const authenticateToken = (req, res, next) => {
    const authHeader = req.headers['authorization'];
    const token = authHeader && authHeader.split(' ')[1];
    if (!token) return res.sendStatus(401);

    jwt.verify(token, SECRET_KEY, (err, user) => {
        if (err) return res.sendStatus(403);
        req.user = user;
        next();
    });
};

const isAdmin = (req, res, next) => {
    if (req.user.role !== 'admin') return res.status(403).json({ message: 'Admin access required' });
    next();
};

// --- AUTH ROUTES ---

app.post('/api/login', async (req, res) => {
    const { email, password } = req.body;
    try {
        const user = await User.findOne({ where: { email } });
        if (!user) return res.status(400).json({ message: 'User not found' });

        const validPassword = await bcrypt.compare(password, user.password);
        if (!validPassword) return res.status(400).json({ message: 'Invalid password' });

        const token = jwt.sign({ id: user.id, role: user.role, name: user.name }, SECRET_KEY, { expiresIn: '4h' });
        res.json({ token, user: { id: user.id, name: user.name, role: user.role } });
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

app.post('/api/register', async (req, res) => {
    // Simple registration for students
    const { name, email, password, class_id, batch_id } = req.body;
    try {
        const hashedPassword = await bcrypt.hash(password, 10);
        const newUser = await User.create({ name, email, password: hashedPassword, role: 'student', class_id, batch_id });
        res.status(201).json({ message: 'User registered successfully' });
    } catch (err) {
        res.status(400).json({ error: 'Email likely already exists' });
    }
});

// --- CLASS ROUTES ---

// Get All Classes (Public for Registration)
app.get('/api/public/classes', async (req, res) => {
    try {
        const classes = await Class.findAll({
            include: [{ model: Batch }]
        });
        res.json(classes);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

// Get All Classes with Batches (protected)
app.get('/api/classes', authenticateToken, async (req, res) => {
    try {
        const classes = await Class.findAll({
            include: [{ model: Batch }]
        });
        res.json(classes);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

// Create Batch
app.post('/api/batches', authenticateToken, isAdmin, async (req, res) => {
    try {
        const { name, class_id } = req.body;
        const newBatch = await Batch.create({ name, class_id });
        res.status(201).json(newBatch);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

// Delete Batch
app.delete('/api/batches/:id', authenticateToken, isAdmin, async (req, res) => {
    try {
        await Batch.destroy({ where: { id: req.params.id } });
        res.sendStatus(204);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

// Create Class
app.post('/api/classes', authenticateToken, isAdmin, async (req, res) => {
    try {
        const newClass = await Class.create(req.body);
        res.status(201).json(newClass);
    } catch (err) {
        res.status(400).json({ error: 'Class name likely already exists' });
    }
});

// Delete Class
app.delete('/api/classes/:id', authenticateToken, isAdmin, async (req, res) => {
    try {
        await Class.destroy({ where: { id: req.params.id } });
        res.sendStatus(204);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

// Get All Students (for Admin to assign classes)
app.get('/api/admin/students', authenticateToken, isAdmin, async (req, res) => {
    try {
        const students = await User.findAll({
            where: { role: 'student' },
            include: [
                { model: Class, attributes: ['id', 'name'] },
                { model: Batch, attributes: ['id', 'name'] }
            ],
            attributes: ['id', 'name', 'email', 'class_id', 'batch_id']
        });
        res.json(students);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

// Assign Class and Batch to Student
app.put('/api/admin/students/:id/class', authenticateToken, isAdmin, async (req, res) => {
    try {
        const { class_id, batch_id } = req.body;
        await User.update({ class_id, batch_id }, { where: { id: req.params.id } });
        res.json({ message: 'Class and Batch assigned successfully' });
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});


// --- ADMIN ROUTES ---

// Create Test (with Class Assignment)
app.post('/api/tests', authenticateToken, isAdmin, async (req, res) => {
    try {
        const { classIds, batchIds, ...testData } = req.body;
        const test = await Test.create({ ...testData, created_by: req.user.id });

        if (classIds && classIds.length > 0) {
            await test.setClasses(classIds);
        }
        if (batchIds && batchIds.length > 0) {
            await test.setBatches(batchIds);
        }

        res.status(201).json(test);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

// Get All Tests (for Admin)
app.get('/api/admin/tests', authenticateToken, isAdmin, async (req, res) => {
    try {
        const tests = await Test.findAll({
            include: [
                { model: Class, attributes: ['id', 'name'] },
                { model: Batch, attributes: ['id', 'name'] }
            ]
        });
        res.json(tests);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

// Update Test (with Class Assignment)
app.put('/api/tests/:id', authenticateToken, isAdmin, async (req, res) => {
    try {
        const { classIds, batchIds, ...testData } = req.body;
        const test = await Test.findByPk(req.params.id);
        if (!test) return res.status(404).json({ message: 'Test not found' });

        await test.update(testData);
        if (classIds) {
            await test.setClasses(classIds);
        }
        if (batchIds) {
            await test.setBatches(batchIds);
        }

        res.json(test);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

// Get Single Test (with questions for editing)
app.get('/api/tests/:id', authenticateToken, async (req, res) => {
    try {
        const includeQuestions = req.user.role === 'admin';
        // Students normally shouldn't fetch all questions with answers immediately if secure, 
        // but typically we send questions without 'correct_option' to student.

        // However, for simplicity, we fetch them here. 
        // If student, we should sanitize.

        const test = await Test.findByPk(req.params.id, {
            include: [
                ...(includeQuestions ? [Question] : []),
                { model: Class, attributes: ['id', 'name'] },
                { model: Batch, attributes: ['id', 'name'] }
            ]
        });

        if (!test) return res.status(404).json({ message: 'Test not found' });
        res.json(test);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

// Add Question
app.post('/api/questions', authenticateToken, isAdmin, async (req, res) => {
    try {
        const question = await Question.create(req.body);
        res.status(201).json(question);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

// Delete Question
app.delete('/api/questions/:id', authenticateToken, isAdmin, async (req, res) => {
    try {
        await Question.destroy({ where: { id: req.params.id } });
        res.sendStatus(204);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

// Get All Reports (Admin)
app.get('/api/admin/reports', authenticateToken, isAdmin, async (req, res) => {
    try {
        const attempts = await Attempt.findAll({
            include: [
                { model: User, attributes: ['name', 'email'] },
                { model: Test, attributes: ['title'] }
            ],
            order: [['createdAt', 'DESC']]
        });
        res.json(attempts);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

// --- STUDENT ROUTES ---

// Get My Profile (with Class)
app.get('/api/student/me', authenticateToken, async (req, res) => {
    try {
        const user = await User.findByPk(req.user.id, {
            include: [
                { model: Class, attributes: ['id', 'name'] },
                { model: Batch, attributes: ['id', 'name'] }
            ],
            attributes: ['id', 'name', 'email', 'role', 'class_id', 'batch_id']
        });
        res.json(user);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

// Get Available Tests (Filtered by Student's Class)
app.get('/api/student/tests', authenticateToken, async (req, res) => {
    try {
        const user = await User.findByPk(req.user.id);
        if (!user) return res.json([]);

        // Fetch tests assigned to user's class OR user's batch
        const tests = await Test.findAll({
            include: [
                {
                    model: Class,
                    attributes: [],
                    through: { attributes: [] }
                },
                {
                    model: Batch,
                    attributes: [],
                    through: { attributes: [] }
                }
            ],
            where: {
                [Op.or]: [
                    { '$Classes.id$': user.class_id },
                    { '$Batches.id$': user.batch_id }
                ]
            },
            attributes: ['id', 'title', 'description', 'duration_minutes', 'start_time', 'end_time']
        });
        res.json(tests);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

// Start Test (Get Questions without Answers)
app.get('/api/student/test/:id/questions', authenticateToken, async (req, res) => {
    try {
        const test = await Test.findByPk(req.params.id, {
            include: [{
                model: Question,
                attributes: ['id', 'text', 'option_a', 'option_b', 'option_c', 'option_d', 'marks', 'explanation'] // Exclude correct_option and explanation for security during test
            }]
        });

        // Check timing logic here if needed (e.g., is it too early/late?)

        if (!test) return res.status(404).json({ message: 'Test not found' });
        res.json(test);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

// Submit Test
app.post('/api/student/submit', authenticateToken, async (req, res) => {
    const { test_id, answers, timeSpentPerQuestion } = req.body; // answers: { id: 'A' }, timeSpentPerQuestion: { id: seconds }

    try {
        // 1. Fetch real questions
        const questions = await Question.findAll({ where: { test_id } });

        let score = 0;
        let correct = 0;
        let wrong = 0;
        let totalQuestions = questions.length;

        // 2. Calculate Score
        questions.forEach(q => {
            const userAns = answers[q.id];
            if (userAns === q.correct_option) {
                score += q.marks;
                correct++;
            } else if (userAns) {
                wrong++;
            }
        });

        // 3. Save Attempt
        const user = await User.findByPk(req.user.id);
        let totalTime = 0;
        if (timeSpentPerQuestion) {
            totalTime = Object.values(timeSpentPerQuestion).reduce((a, b) => a + b, 0);
        }

        const attempt = await Attempt.create({
            user_id: req.user.id,
            test_id,
            score,
            total_questions: totalQuestions,
            correct_answers: correct,
            wrong_answers: wrong,
            answers_json: JSON.stringify(answers),
            class_id: user.class_id,
            batch_id: user.batch_id,
            total_time: totalTime
        });

        // 4. Save Time and Handle Mistakes
        if (timeSpentPerQuestion) {
            // Fetch historical average times (before this attempt)
            const avgTimes = await QuestionTime.findAll({
                attributes: ['question_id', [sequelize.fn('AVG', sequelize.col('time_spent')), 'avg_time']],
                where: { test_id },
                group: ['question_id'],
                raw: true
            });
            const avgTimeMap = {};
            avgTimes.forEach(t => avgTimeMap[t.question_id] = parseFloat(t.avg_time));

            const timeRecords = [];
            const mistakePromises = questions.map(async (q) => {
                const timeSpent = timeSpentPerQuestion[q.id] || 0;
                timeRecords.push({
                    attempt_id: attempt.id,
                    question_id: q.id,
                    time_spent: timeSpent,
                    user_id: req.user.id,
                    test_id: test_id
                });

                // Mistake Logic
                const userAns = answers[q.id];
                const isIncorrect = userAns && userAns !== q.correct_option;
                const avgTime = avgTimeMap[q.id] || 0;
                const isSlow = avgTime > 0 && timeSpent > avgTime; // Only if avg exists

                if (isIncorrect || isSlow) {
                    const [mistake, created] = await Mistake.findOrCreate({
                        where: { user_id: req.user.id, question_id: q.id, test_id },
                        defaults: {
                            is_incorrect: isIncorrect,
                            is_slow: isSlow,
                            status: 'active',
                            retry_count: 0,
                            consecutive_correct_retries: 0
                        }
                    });

                    if (!created) {
                        if (isIncorrect) mistake.is_incorrect = true;
                        if (isSlow) mistake.is_slow = true;

                        // Reset progress if incorrect again
                        if (isIncorrect) {
                            mistake.consecutive_correct_retries = 0;
                            mistake.status = 'active';
                        }
                        await mistake.save();
                    }
                }
            });

            await QuestionTime.bulkCreate(timeRecords);
            await Promise.all(mistakePromises);
        }

        res.json({ success: true, attempt_id: attempt.id });
    } catch (err) {
        console.error(err);
        res.status(500).json({ error: err.message });
    }
});

// Get My Results
app.get('/api/student/results', authenticateToken, async (req, res) => {
    try {
        const attempts = await Attempt.findAll({
            where: { user_id: req.user.id },
            include: [{ model: Test, attributes: ['title'] }],
            order: [['createdAt', 'DESC']]
        });
        res.json(attempts);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

// Get Specific Result Details (Review)
app.get('/api/student/result/:id', authenticateToken, async (req, res) => {
    try {
        const attempt = await Attempt.findByPk(req.params.id, {
            include: [
                {
                    model: Test,
                    include: [Question]
                },
                {
                    model: QuestionTime
                }
            ]
        });

        if (!attempt) return res.status(404).json({ message: 'Result not found' });

        if (attempt.user_id !== req.user.id && req.user.role !== 'admin') {
            return res.status(403).json({ message: 'Unauthorized' });
        }

        res.json(attempt);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

// Admin Analytics: Get difficult questions based on average time and accuracy
app.get('/api/admin/analytics/questions/:testId', authenticateToken, isAdmin, async (req, res) => {
    try {
        const testId = req.params.testId;
        const questions = await Question.findAll({ where: { test_id: testId } });
        const timeData = await QuestionTime.findAll({ where: { test_id: testId } });
        const attempts = await Attempt.findAll({ where: { test_id: testId } });

        const analytics = questions.map(q => {
            const qTimes = timeData.filter(t => t.question_id === q.id);
            const avgTime = qTimes.length > 0 ? (qTimes.reduce((acc, curr) => acc + curr.time_spent, 0) / qTimes.length).toFixed(2) : 0;

            let correctCount = 0;
            let attemptCount = 0;

            attempts.forEach(att => {
                const answers = JSON.parse(att.answers_json || '{}');
                if (answers[q.id]) {
                    attemptCount++;
                    if (answers[q.id] === q.correct_option) {
                        correctCount++;
                    }
                }
            });

            const accuracy = attemptCount > 0 ? ((correctCount / attemptCount) * 100).toFixed(2) : 0;

            return {
                id: q.id,
                text: q.text,
                topic: q.topic,
                avgTimeSpent: parseFloat(avgTime),
                accuracy: parseFloat(accuracy),
                totalAttempts: attemptCount
            };
        });

        res.json(analytics);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

app.get('/api/student/performance', authenticateToken, async (req, res) => {
    try {
        const attempts = await Attempt.findAll({
            where: { user_id: req.user.id },
            include: [{ model: Test, attributes: ['title'] }],
            order: [['createdAt', 'DESC']]
        });

        const totalTests = attempts.length;
        const totalScore = attempts.reduce((acc, curr) => acc + curr.score, 0);
        const avgScore = totalTests > 0 ? (totalScore / totalTests).toFixed(2) : 0;

        res.json({
            attempts,
            stats: {
                totalTests,
                avgScore,
                totalScore
            }
        });
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});


// --- RANKING / LEADERBOARD ---

app.get('/api/rankings/:testId', authenticateToken, async (req, res) => {
    try {
        const testId = req.params.testId;
        const userId = req.user.id;
        const user = await User.findByPk(userId);

        // Fetch all attempts for this test
        const attempts = await Attempt.findAll({
            where: { test_id: testId },
            include: [{ model: User, attributes: ['id', 'name', 'batch_id', 'class_id'] }]
        });

        // Helper to calculate accuracy
        const getAccuracy = (att) => {
            const attempted = att.correct_answers + att.wrong_answers;
            return attempted > 0 ? (att.correct_answers / attempted) : 0;
        };

        // Sort logic: 
        // 1. Higher correct answers
        // 2. Higher accuracy
        // 3. Lower total_time
        const sortedAttempts = attempts.sort((a, b) => {
            if (b.correct_answers !== a.correct_answers) {
                return b.correct_answers - a.correct_answers;
            }
            const accA = getAccuracy(a);
            const accB = getAccuracy(b);
            if (accB !== accA) {
                return accB - accA;
            }
            return a.total_time - b.total_time;
        });

        // Assign Ranks
        const globalRankings = sortedAttempts.map((att, index) => ({
            rank: index + 1,
            user_id: att.user_id,
            name: att.User ? att.User.name : 'Unknown',
            score: att.score,
            correct_answers: att.correct_answers,
            accuracy: (getAccuracy(att) * 100).toFixed(2),
            time_taken: att.total_time,
            class_id: att.class_id,
            batch_id: att.batch_id
        }));

        // Filter for specific views
        const getMyRank = (list) => {
            const found = list.find(r => r.user_id === userId);
            return found ? found.rank : '-';
        };

        const overallRank = getMyRank(globalRankings);

        const classRankings = globalRankings.filter(r => r.class_id === user.class_id);
        const classRank = getMyRank(classRankings);

        const batchRankings = globalRankings.filter(r => r.batch_id === user.batch_id);
        const batchRank = getMyRank(batchRankings);

        // Top 10 lists
        res.json({
            myRanks: {
                overall: overallRank,
                class: classRank,
                batch: batchRank
            },
            leaderboard: globalRankings.slice(0, 10), // Top 10 Overall
            stats: {
                correct: globalRankings.find(r => r.user_id === userId)?.correct_answers || 0,
                accuracy: globalRankings.find(r => r.user_id === userId)?.accuracy || 0,
                time: globalRankings.find(r => r.user_id === userId)?.time_taken || 0
            }
        });

    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

// Start
// --- MISTAKE BOOK ROUTES ---

// Get Mistakes
app.get('/api/student/mistakes', authenticateToken, async (req, res) => {
    try {
        const { test_id, status } = req.query;
        const whereClause = { user_id: req.user.id };
        if (test_id) whereClause.test_id = test_id;
        if (status) whereClause.status = status;

        const mistakes = await Mistake.findAll({
            where: whereClause,
            include: [
                {
                    model: Question,
                    attributes: ['id', 'text', 'option_a', 'option_b', 'option_c', 'option_d', 'correct_option', 'explanation', 'topic', 'test_id']
                },
                {
                    model: Test,
                    attributes: ['id', 'title']
                }
            ],
            order: [['updatedAt', 'DESC']]
        });

        res.json(mistakes);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

// Bookmark Mistake (Toggle)
app.post('/api/student/mistakes/:questionId/bookmark', authenticateToken, async (req, res) => {
    try {
        const { questionId } = req.params;
        const { test_id } = req.body;

        // Ensure we handle case where user manually bookmarks a question that wasn't a mistake yet
        const [mistake, created] = await Mistake.findOrCreate({
            where: { user_id: req.user.id, question_id: questionId, test_id },
            defaults: {
                is_bookmarked: true,
                status: 'active'
            }
        });

        if (!created) {
            mistake.is_bookmarked = !mistake.is_bookmarked;
            await mistake.save();
        }

        res.json(mistake);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

// Retry Mistake
app.post('/api/student/mistakes/:id/retry', authenticateToken, async (req, res) => {
    try {
        const { answer } = req.body;
        const mistake = await Mistake.findByPk(req.params.id, {
            include: [Question]
        });

        if (!mistake) return res.status(404).json({ message: 'Mistake not found' });
        if (mistake.user_id !== req.user.id) return res.status(403).json({ message: 'Unauthorized' });

        const isCorrect = answer === mistake.Question.correct_option;

        if (isCorrect) {
            mistake.consecutive_correct_retries += 1;
            if (mistake.consecutive_correct_retries >= 2) {
                mistake.status = 'improved';
            }
        } else {
            mistake.consecutive_correct_retries = 0;
            mistake.status = 'active';
        }

        mistake.retry_count += 1;
        await mistake.save();

        res.json({
            success: true,
            isCorrect,
            correctOption: mistake.Question.correct_option,
            explanation: mistake.Question.explanation,
            status: mistake.status
        });
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

// Mark Revised
app.put('/api/student/mistakes/:id/revise', authenticateToken, async (req, res) => {
    try {
        const mistake = await Mistake.findByPk(req.params.id);
        if (!mistake) return res.status(404).json({ message: 'Mistake not found' });
        if (mistake.user_id !== req.user.id) return res.status(403).json({ message: 'Unauthorized' });

        mistake.status = 'revised';
        await mistake.save();
        res.json(mistake);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

// --- ADMIN MISTAKE ROUTES ---

// Admin: Get Analytics (Most Common Mistakes & Batch Weakness)
app.get('/api/admin/mistakes/analytics', authenticateToken, isAdmin, async (req, res) => {
    try {
        // 1. Top Common Mistakes (Questions)
        const commonMistakes = await Mistake.findAll({
            attributes: [
                'question_id',
                [sequelize.fn('COUNT', sequelize.col('Mistake.id')), 'count']
            ],
            include: [{ model: Question, attributes: ['text', 'topic'] }],
            group: ['question_id', 'Question.id'],
            order: [[sequelize.col('count'), 'DESC']],
            limit: 10
        });

        // 2. Weakness by Batch (Count of active mistakes per batch)
        const batchWeakness = await Mistake.findAll({
            where: { status: 'active' },
            include: [{
                model: User,
                attributes: ['batch_id'],
                include: [{ model: Batch, attributes: ['name'] }]
            }],
            attributes: [
                [sequelize.col('User.batch_id'), 'batch_id'],
                [sequelize.fn('COUNT', sequelize.col('Mistake.id')), 'mistake_count']
            ],
            group: ['User.batch_id', 'User.Batch.id']
        });

        res.json({
            commonQuestions: commonMistakes,
            batchWeakness: batchWeakness
        });
    } catch (err) {
        console.error(err);
        res.status(500).json({ error: err.message });
    }
});

// Admin: Get Student Mistake Book
app.get('/api/admin/mistakes/student/:studentId', authenticateToken, isAdmin, async (req, res) => {
    try {
        const mistakes = await Mistake.findAll({
            where: { user_id: req.params.studentId },
            include: [
                {
                    model: Question,
                    attributes: ['id', 'text', 'option_a', 'option_b', 'option_c', 'option_d', 'correct_option', 'explanation', 'topic', 'test_id']
                },
                {
                    model: Test,
                    attributes: ['id', 'title']
                }
            ],
            order: [['updatedAt', 'DESC']]
        });
        res.json(mistakes);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});
 
initDB()
.then(() => {
    app.listen(PORT, '0.0.0.0', () => {
        console.log(`Server running on port ${PORT}`);
    });
})
.catch(err => {
    console.error('Database init failed:', err);
    process.exit(1);
});