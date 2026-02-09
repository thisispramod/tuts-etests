import React, { useEffect, useState, useRef } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import api from '../../api';
import { Timer, ChevronLeft, ChevronRight, CheckCircle } from 'lucide-react';

const TakeTest = () => {
    const { id } = useParams();
    const navigate = useNavigate();

    const [test, setTest] = useState(null);
    const [questions, setQuestions] = useState([]);
    const [currentQ, setCurrentQ] = useState(0);
    const [answers, setAnswers] = useState(() => {
        const saved = localStorage.getItem(`test_answers_${id}`);
        return saved ? JSON.parse(saved) : {};
    });
    const [timeSpentPerQuestion, setTimeSpentPerQuestion] = useState(() => {
        const saved = localStorage.getItem(`test_time_${id}`);
        return saved ? JSON.parse(saved) : {};
    });
    const [timeLeft, setTimeLeft] = useState(0);
    const [loading, setLoading] = useState(true);
    const [submitting, setSubmitting] = useState(false);

    const timerRef = useRef(null);
    const lastEntryTimeRef = useRef(Date.now());

    useEffect(() => {
        const fetchTestData = async () => {
            try {
                const res = await api.get(`/student/test/${id}/questions`);
                setTest(res.data);
                setQuestions(res.data.Questions || []);

                // Calculate time left based on start time if we want to be strict,
                // but for now, we'll just use the duration.
                // To support recovery of timer:
                const savedTimeLeft = localStorage.getItem(`test_timer_${id}`);
                if (savedTimeLeft) {
                    setTimeLeft(parseInt(savedTimeLeft));
                } else {
                    setTimeLeft(res.data.duration_minutes * 60);
                }

                setLoading(false);
            } catch (err) {
                alert('Error loading test data.');
                navigate('/dashboard');
            }
        };
        fetchTestData();

        const preventRefresh = (e) => {
            e.preventDefault();
            e.returnValue = '';
        };
        window.addEventListener('beforeunload', preventRefresh);

        return () => {
            window.removeEventListener('beforeunload', preventRefresh);
            if (timerRef.current) clearInterval(timerRef.current);
        };
    }, [id, navigate]);

    // Timer and Auto-save
    useEffect(() => {
        if (!loading && timeLeft > 0 && !submitting) {
            timerRef.current = setInterval(() => {
                setTimeLeft(prev => {
                    const newTime = prev - 1;
                    localStorage.setItem(`test_timer_${id}`, newTime.toString());
                    if (newTime <= 0) {
                        clearInterval(timerRef.current);
                        autoSubmit();
                        return 0;
                    }
                    return newTime;
                });
            }, 1000);
            return () => clearInterval(timerRef.current);
        }
    }, [loading, timeLeft, submitting, id]);

    // Track time spent per question when switching
    useEffect(() => {
        if (questions.length > 0 && !loading) {
            // When currentQ changes, update time for the PREVIOUS question
            // But how do we know the previous question?
            // Actually, it's easier to update the current question's time every second or when leaving.

            // Let's use a ref to keep track of when we entered the currently active question
            lastEntryTimeRef.current = Date.now();
        }
    }, [currentQ, loading, questions.length]);

    // Update time spent for the currently active question
    const updateTimeForCurrentQuestion = () => {
        if (!questions[currentQ]) return;
        const qId = questions[currentQ].id;
        const now = Date.now();
        const deltaSeconds = Math.floor((now - lastEntryTimeRef.current) / 1000);

        if (deltaSeconds > 0) {
            setTimeSpentPerQuestion(prev => {
                const updated = {
                    ...prev,
                    [qId]: (prev[qId] || 0) + deltaSeconds
                };
                localStorage.setItem(`test_time_${id}`, JSON.stringify(updated));
                return updated;
            });
            lastEntryTimeRef.current = now; // Reset entry time to now
        }
    };

    // Auto-save answers
    useEffect(() => {
        if (Object.keys(answers).length > 0) {
            localStorage.setItem(`test_answers_${id}`, JSON.stringify(answers));
        }
    }, [answers, id]);

    const autoSubmit = () => {
        submitTest(true);
    };

    const handleSelect = (option) => {
        const qId = questions[currentQ].id;
        setAnswers(prev => ({ ...prev, [qId]: option }));
    };

    const handleQuestionChange = (newIdx) => {
        updateTimeForCurrentQuestion();
        setCurrentQ(newIdx);
    };

    const submitTest = async (isAuto = false) => {
        if (!isAuto && !window.confirm('Are you sure you want to submit your test?')) return;

        setSubmitting(true);
        if (timerRef.current) clearInterval(timerRef.current);

        // Final time update for current question
        updateTimeForCurrentQuestion();

        // Use the most fresh state for time spent
        // Since setTimeSpentPerQuestion is async, we calculate the final seconds manually for the current question
        const now = Date.now();
        const deltaSeconds = Math.floor((now - lastEntryTimeRef.current) / 1000);
        const finalTimeSpent = { ...timeSpentPerQuestion };
        if (questions[currentQ]) {
            const qId = questions[currentQ].id;
            finalTimeSpent[qId] = (finalTimeSpent[qId] || 0) + deltaSeconds;
        }

        try {
            const res = await api.post('/student/submit', {
                test_id: id,
                answers,
                timeSpentPerQuestion: finalTimeSpent
            });

            // Clear local storage on successful submission
            localStorage.removeItem(`test_answers_${id}`);
            localStorage.removeItem(`test_time_${id}`);
            localStorage.removeItem(`test_timer_${id}`);

            alert('Test submitted successfully!');
            navigate(`/student/result/${res.data.attempt_id}`);
        } catch (err) {
            alert('Failed to submit test. Please check your connection.');
            setSubmitting(false);
        }
    };

    const formatTime = (seconds) => {
        const m = Math.floor(seconds / 60);
        const s = seconds % 60;
        return `${m}:${s < 10 ? '0' : ''}${s}`;
    };

    if (loading) return <div className="p-8 text-center">Initializing Exam...</div>;
    if (!questions.length) return <div className="p-8 text-center">No questions found for this test.</div>;

    const currentQuestion = questions[currentQ];
    const selectedOption = answers[currentQuestion.id];

    return (
        <div className="flex flex-col min-h-screen">
            {/* Header */}
            <div className="exam-header flex justify-between items-center">
                <div>
                    <h2 className="text-primary font-bold">{test.title}</h2>
                    <p className="text-gray text-sm">Question {currentQ + 1} of {questions.length}</p>
                </div>

                <div className="flex items-center gap-4">
                    <div className={`flex items-center gap-2 p-2 px-4 rounded-lg font-bold border ${timeLeft < 60 ? 'text-danger border-danger' : 'text-primary border-primary'}`}>
                        <Timer size={20} />
                        {formatTime(timeLeft)}
                    </div>
                    <button onClick={() => submitTest(false)} className="btn btn-primary" style={{ background: 'var(--danger)' }}>
                        Finish Test
                    </button>
                </div>
            </div>

            {/* Main Grid */}
            <div className="container grid lg-grid-cols-4 gap-8 flex-1">

                {/* Question Side */}
                <div className="lg-col-span-3 flex flex-col gap-6">
                    <div className="glass-panel p-8 flex-1">
                        <h1 className="mb-8" style={{ fontSize: '1.5rem', fontWeight: '500' }}>
                            <span className="text-primary font-bold mr-2">Q{currentQ + 1}.</span>
                            {currentQuestion.text}
                        </h1>

                        <div className="flex flex-col gap-4">
                            {['A', 'B', 'C', 'D'].map(opt => (
                                <div
                                    key={opt}
                                    className={`option-card ${selectedOption === opt ? 'selected' : ''}`}
                                    onClick={() => handleSelect(opt)}
                                >
                                    <div className="option-circle">{opt}</div>
                                    <span>{currentQuestion[`option_${opt.toLowerCase()}`]}</span>
                                </div>
                            ))}
                        </div>
                    </div>

                    {/* Navigation */}
                    <div className="flex justify-between items-center">
                        <button
                            className="btn btn-outline"
                            onClick={() => handleQuestionChange(Math.max(0, currentQ - 1))}
                            disabled={currentQ === 0}
                        >
                            <ChevronLeft size={18} /> Previous
                        </button>

                        {currentQ < questions.length - 1 ? (
                            <button
                                className="btn btn-primary"
                                onClick={() => handleQuestionChange(currentQ + 1)}
                            >
                                Next Question <ChevronRight size={18} />
                            </button>
                        ) : (
                            <button
                                className="btn btn-primary"
                                style={{ background: 'var(--success)' }}
                                onClick={() => submitTest(false)}
                            >
                                Submit Test <CheckCircle size={18} />
                            </button>
                        )}
                    </div>
                </div>

                {/* Palette Side */}
                <div className="flex flex-col gap-4">
                    <div className="glass-panel p-6">
                        <h3 className="font-bold mb-4 text-center">Question Palette</h3>
                        <div className="palette-grid">
                            {questions.map((q, idx) => (
                                <div
                                    key={q.id}
                                    className={`palette-btn ${answers[q.id] ? 'answered' : ''} ${currentQ === idx ? 'current' : ''}`}
                                    onClick={() => handleQuestionChange(idx)}
                                >
                                    {idx + 1}
                                </div>
                            ))}
                        </div>

                        <div className="mt-8 flex flex-col gap-2 text-sm text-gray">
                            <div className="flex items-center gap-2">
                                <div className="palette-btn answered" style={{ width: 14, height: 14 }}></div> Answered
                            </div>
                            <div className="flex items-center gap-2">
                                <div className="palette-btn" style={{ width: 14, height: 14 }}></div> Not Answered
                            </div>
                            <div className="flex items-center gap-2">
                                <div className="palette-btn current" style={{ width: 14, height: 14, border: '1px solid white' }}></div> Current
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    );
};

export default TakeTest;
