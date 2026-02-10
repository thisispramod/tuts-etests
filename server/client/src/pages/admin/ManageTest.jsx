import React, { useEffect, useState } from 'react';
import { useParams, Link } from 'react-router-dom';
import api from '../../api';
import { Save, Trash, ArrowLeft, BarChart3, Users } from 'lucide-react';

const ManageTest = () => {
    const { id } = useParams();
    const [test, setTest] = useState(null);
    const [questions, setQuestions] = useState([]);
    const [allClasses, setAllClasses] = useState([]);
    const [assignedClassIds, setAssignedClassIds] = useState([]);
    const [assignedBatchIds, setAssignedBatchIds] = useState([]);

    // New Question Form State
    const [newQ, setNewQ] = useState({
        text: '',
        option_a: '', option_b: '', option_c: '', option_d: '',
        correct_option: 'A',
        marks: 1,
        topic: 'General',
        explanation: ''
    });

    useEffect(() => {
        fetchTest();
        fetchClasses();
    }, [id]);

    const fetchTest = async () => {
        try {
            const res = await api.get(`/tests/${id}`);
            setTest(res.data);
            if (res.data.Questions) setQuestions(res.data.Questions);
            if (res.data.Classes) {
                setAssignedClassIds(res.data.Classes.map(c => c.id));
            }
            if (res.data.Batches) {
                setAssignedBatchIds(res.data.Batches.map(b => b.id));
            }
        } catch (err) {
            console.error(err);
        }
    };

    const fetchClasses = async () => {
        try {
            const res = await api.get('/classes');
            setAllClasses(res.data);
        } catch (err) {
            console.error(err);
        }
    };

    const handleClassToggle = async (classId) => {
        const newIds = assignedClassIds.includes(classId)
            ? assignedClassIds.filter(cid => cid !== classId)
            : [...assignedClassIds, classId];

        setAssignedClassIds(newIds);
        updateTestAssignment(newIds, assignedBatchIds);
    };

    const handleBatchToggle = async (batchId) => {
        const newIds = assignedBatchIds.includes(batchId)
            ? assignedBatchIds.filter(bid => bid !== batchId)
            : [...assignedBatchIds, batchId];

        setAssignedBatchIds(newIds);
        updateTestAssignment(assignedClassIds, newIds);
    };

    const updateTestAssignment = async (classIds, batchIds) => {
        try {
            await api.put(`/tests/${id}`, { classIds, batchIds });
        } catch (err) {
            console.error('Failed to update assignment', err);
        }
    };

    const handleAddQuestion = async (e) => {
        e.preventDefault();
        try {
            await api.post('/questions', { ...newQ, test_id: id });
            setNewQ({ ...newQ, text: '', option_a: '', option_b: '', option_c: '', option_d: '', explanation: '' }); // Reset
            fetchTest();
        } catch (err) {
            alert('Error adding question');
        }
    };

    const deleteQuestion = async (qId) => {
        if (!confirm('Are you sure?')) return;
        try {
            await api.delete(`/questions/${qId}`);
            fetchTest();
        } catch (err) { console.error(err); }
    };

    if (!test) return <div className="p-8 text-center text-gray">Loading Test...</div>;

    return (
        <div className="container animate-fade-in pb-12">
            <Link to="/dashboard" className="flex items-center gap-2 text-gray mb-4 hover:text-white">
                <ArrowLeft size={18} /> Back to Dashboard
            </Link>

            <div className="grid md-grid-cols-3 gap-8 mb-8">
                <div className="md-col-span-2 glass-panel p-6 flex justify-between items-center bg-gradient-to-br from-slate-800 to-slate-900">
                    <div>
                        <h1 className="text-3xl font-bold mb-2">{test.title}</h1>
                        <p className="text-gray mb-4">Duration: {test.duration_minutes} minutes • {questions.length} Questions</p>
                        <Link to={`/admin/test/${id}/analytics`} className="btn btn-outline border-primary text-primary hover:bg-primary hover:text-white flex items-center gap-2 py-2 text-sm w-fit">
                            <BarChart3 size={18} /> View Test Analytics
                        </Link>
                    </div>
                </div>

                <div className="glass-panel p-6">
                    <h3 className="font-bold mb-3 flex items-center gap-2">
                        <Users size={18} className="text-primary" /> Assign to Classes
                    </h3>
                    <div className="flex flex-col gap-2 max-h-60 overflow-y-auto pr-2 custom-scrollbar">
                        {allClasses.length === 0 && <p className="text-xs text-gray">No classes available.</p>}
                        {allClasses.map(cls => (
                            <div key={cls.id} className="mb-2">
                                <label className="flex items-center gap-3 p-2 rounded hover:bg-white/5 cursor-pointer transition">
                                    <input
                                        type="checkbox"
                                        className="w-4 h-4 rounded border-gray-600 bg-slate-700 text-primary focus:ring-primary"
                                        checked={assignedClassIds.includes(cls.id)}
                                        onChange={() => handleClassToggle(cls.id)}
                                    />
                                    <span className="text-sm font-medium">{cls.name}</span>
                                </label>
                                {/* Batches */}
                                {cls.Batches && cls.Batches.length > 0 && (
                                    <div className="pl-8 flex flex-col gap-1 mt-1 border-l border-white/10 ml-4">
                                        {cls.Batches.map(batch => (
                                            <label key={batch.id} className="flex items-center gap-2 p-1 rounded hover:bg-white/5 cursor-pointer transition">
                                                <input
                                                    type="checkbox"
                                                    className="w-3 h-3 rounded border-gray-600 bg-slate-700 text-info focus:ring-info"
                                                    checked={assignedBatchIds.includes(batch.id)}
                                                    onChange={() => handleBatchToggle(batch.id)}
                                                />
                                                <span className="text-xs text-gray-300">{batch.name}</span>
                                            </label>
                                        ))}
                                    </div>
                                )}
                            </div>
                        ))}
                    </div>
                </div>
            </div>

            <div className="grid grid-2" style={{ gridTemplateColumns: '1fr 1fr', gap: '2rem' }}>

                {/* Left: Add Question Form */}
                <div className="glass-panel p-6">
                    <h2 className="text-xl font-bold mb-4">Add Question</h2>
                    <form onSubmit={handleAddQuestion}>
                        <div className="mb-4">
                            <label className="text-sm block mb-1">Question Text</label>
                            <textarea
                                className="input-field"
                                rows="3"
                                value={newQ.text}
                                onChange={e => setNewQ({ ...newQ, text: e.target.value })}
                                required
                            />
                        </div>

                        <div className="grid grid-2 gap-4 mb-4">
                            <input type="text" placeholder="Option A" className="input-field" value={newQ.option_a} onChange={e => setNewQ({ ...newQ, option_a: e.target.value })} required />
                            <input type="text" placeholder="Option B" className="input-field" value={newQ.option_b} onChange={e => setNewQ({ ...newQ, option_b: e.target.value })} required />
                            <input type="text" placeholder="Option C" className="input-field" value={newQ.option_c} onChange={e => setNewQ({ ...newQ, option_c: e.target.value })} required />
                            <input type="text" placeholder="Option D" className="input-field" value={newQ.option_d} onChange={e => setNewQ({ ...newQ, option_d: e.target.value })} required />
                        </div>

                        <div className="flex gap-4 mb-4">
                            <div className="w-1/3">
                                <label className="text-sm block mb-1">Correct Answer</label>
                                <select className="input-field" value={newQ.correct_option} onChange={e => setNewQ({ ...newQ, correct_option: e.target.value })}>
                                    <option value="A">Option A</option>
                                    <option value="B">Option B</option>
                                    <option value="C">Option C</option>
                                    <option value="D">Option D</option>
                                </select>
                            </div>
                            <div className="w-1/3">
                                <label className="text-sm block mb-1">Marks</label>
                                <input type="number" className="input-field" value={newQ.marks} onChange={e => setNewQ({ ...newQ, marks: parseInt(e.target.value) })} min="1" />
                            </div>
                            <div className="w-1/3">
                                <label className="text-sm block mb-1">Topic</label>
                                <input type="text" className="input-field" value={newQ.topic} onChange={e => setNewQ({ ...newQ, topic: e.target.value })} placeholder="e.g. Math, History" />
                            </div>
                        </div>

                        <div className="mb-4">
                            <label className="text-sm block mb-1">Explanation (Why is this correct?)</label>
                            <textarea
                                className="input-field"
                                rows="2"
                                value={newQ.explanation}
                                onChange={e => setNewQ({ ...newQ, explanation: e.target.value })}
                                placeholder="Optional explanation for the student..."
                            />
                        </div>

                        <button type="submit" className="btn btn-primary w-full">
                            <Save size={18} /> Add Question
                        </button>
                    </form>
                </div>

                {/* Right: Existing Questions */}
                <div className="glass-panel p-6 h-fit" style={{ maxHeight: '800px', overflowY: 'auto' }}>
                    <h2 className="text-xl font-bold mb-4">Questions ({questions.length})</h2>
                    {questions.length === 0 && <p className="text-gray">No questions yet.</p>}

                    <div className="flex flex-col gap-4">
                        {questions.map((q, idx) => (
                            <div key={q.id} className="p-4 bg-white/5 rounded border border-white/10 relative group">
                                <button
                                    onClick={() => deleteQuestion(q.id)}
                                    className="absolute top-2 right-2 text-red-400 opacity-0 group-hover:opacity-100 transition"
                                >
                                    <Trash size={16} />
                                </button>
                                <p className="font-bold mb-2">{idx + 1}. {q.text}</p>
                                <ul className="text-sm text-gray space-y-1 ml-4 list-disc">
                                    <li className={q.correct_option === 'A' ? 'text-green-400 font-bold' : ''}>{q.option_a}</li>
                                    <li className={q.correct_option === 'B' ? 'text-green-400 font-bold' : ''}>{q.option_b}</li>
                                    <li className={q.correct_option === 'C' ? 'text-green-400 font-bold' : ''}>{q.option_c}</li>
                                    <li className={q.correct_option === 'D' ? 'text-green-400 font-bold' : ''}>{q.option_d}</li>
                                </ul>
                                {q.explanation && (
                                    <div className="mt-3 p-2 bg-blue-500/10 border border-blue-500/20 rounded text-xs text-blue-200">
                                        <span className="font-bold">Explanation:</span> {q.explanation}
                                    </div>
                                )}
                                <div className="mt-2 text-xs flex justify-between">
                                    <span className="text-gray-500">Marks: {q.marks}</span>
                                    <span className="bg-primary/20 text-primary-light px-2 py-0.5 rounded">{q.topic || 'General'}</span>
                                </div>
                            </div>
                        ))}
                    </div>
                </div>

            </div>
        </div>
    );
};

export default ManageTest;
