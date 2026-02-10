import React, { useEffect, useState } from 'react';
import api from '../../api';
import { BarChart, Users, AlertTriangle, Search, BookOpen, ArrowLeft } from 'lucide-react';
import { Link } from 'react-router-dom';

const MistakeAnalytics = () => {
    const [analytics, setAnalytics] = useState(null);
    const [students, setStudents] = useState([]);
    const [selectedStudent, setSelectedStudent] = useState('');
    const [studentMistakes, setStudentMistakes] = useState([]);
    const [loading, setLoading] = useState(true);

    useEffect(() => {
        fetchDashboardData();
    }, []);

    const fetchDashboardData = async () => {
        try {
            const [analyticsRes, studentsRes] = await Promise.all([
                api.get('/admin/mistakes/analytics'),
                api.get('/admin/students')
            ]);
            setAnalytics(analyticsRes.data);
            setStudents(studentsRes.data);
            setLoading(false);
        } catch (err) {
            console.error(err);
            setLoading(false);
        }
    };

    const fetchStudentMistakes = async (studentId) => {
        if (!studentId) return;
        setLoading(true);
        try {
            const res = await api.get(`/admin/mistakes/student/${studentId}`);
            setStudentMistakes(res.data);
            setLoading(false);
        } catch (err) {
            console.error(err);
            setLoading(false);
        }
    };

    const handleStudentChange = (e) => {
        const id = e.target.value;
        setSelectedStudent(id);
        if (id) {
            fetchStudentMistakes(id);
        } else {
            setStudentMistakes([]);
        }
    };

    if (loading && !analytics) return <div className="p-8 text-center">Loading Analytics...</div>;

    return (
        <div className="container animate-fade-in pb-12">
            <Link to="/dashboard" className="flex items-center gap-2 text-gray mb-4 hover:text-white">
                <ArrowLeft size={18} /> Back to Dashboard
            </Link>
            <header className="mb-8">
                <h1 className="text-3xl font-bold mb-2 flex items-center gap-2">
                    <BookOpen className="text-red-500" /> Mistake Analytics
                </h1>
                <p className="text-gray-400">Analyze common mistakes and identify weak areas across batches.</p>
            </header>

            {/* Overview Stats */}
            <div className="grid grid-cols-1 md:grid-cols-2 gap-8 mb-12">

                {/* Batch Weakness */}
                <div className="glass-panel p-6">
                    <h2 className="text-xl font-bold mb-4 flex items-center gap-2">
                        <Users className="text-primary" /> Batch Weakness
                    </h2>
                    <p className="text-sm text-gray-400 mb-4">Total active mistakes per batch.</p>

                    <div className="space-y-4">
                        {analytics?.batchWeakness.length === 0 ? <p className="text-gray-500">No data available.</p> :
                            analytics?.batchWeakness.map((batch, idx) => (
                                <div key={idx} className="flex items-center justify-between">
                                    <span className="font-semibold">{batch.User?.Batch?.name || 'Unassigned'}</span>
                                    <div className="flex items-center gap-2 w-2/3">
                                        <div className="w-full bg-slate-800 rounded-full h-2.5">
                                            <div
                                                className="bg-red-500 h-2.5 rounded-full"
                                                style={{ width: `${Math.min(batch.mistake_count * 5, 100)}%` }} // Rough scaling
                                            ></div>
                                        </div>
                                        <span className="text-sm font-bold w-8 text-right">{batch.mistake_count}</span>
                                    </div>
                                </div>
                            ))
                        }
                    </div>
                </div>

                {/* Common Difficult Questions */}
                <div className="glass-panel p-6">
                    <h2 className="text-xl font-bold mb-4 flex items-center gap-2">
                        <AlertTriangle className="text-yellow-500" /> Most Common Mistakes
                    </h2>
                    <p className="text-sm text-gray-400 mb-4">Top questions students are getting wrong.</p>

                    <div className="space-y-4 max-h-[300px] overflow-y-auto custom-scrollbar">
                        {analytics?.commonQuestions.length === 0 ? <p className="text-gray-500">No data available.</p> :
                            analytics?.commonQuestions.map((item, idx) => (
                                <div key={idx} className="p-3 bg-slate-800 rounded border border-slate-700">
                                    <p className="font-medium text-sm mb-1 line-clamp-2">{item.Question.text}</p>
                                    <div className="flex justify-between items-center text-xs text-gray-400">
                                        <span>Topic: {item.Question.topic}</span>
                                        <span className="text-red-400 font-bold">{item.count} Failures</span>
                                    </div>
                                </div>
                            ))
                        }
                    </div>
                </div>
            </div>

            {/* Student Explorer */}
            <section className="mt-12">
                <h2 className="text-2xl font-bold mb-6 flex items-center gap-2 border-t border-gray-800 pt-8">
                    <Search className="text-blue-400" /> Student Mistake Explorer
                </h2>

                <div className="mb-6 max-w-md">
                    <label className="block text-sm font-bold mb-2 text-gray-300">Select Student</label>
                    <select
                        className="input-field w-full"
                        value={selectedStudent}
                        onChange={handleStudentChange}
                    >
                        <option value="">-- Choose a Student --</option>
                        {students.map(s => (
                            <option key={s.id} value={s.id}>
                                {s.name} ({s.email}) - {s.Class?.name} / {s.Batch?.name}
                            </option>
                        ))}
                    </select>
                </div>

                {selectedStudent && (
                    <div className="animate-fade-in">
                        {loading ? <p>Loading student data...</p> : (
                            studentMistakes.length === 0 ? (
                                <div className="p-8 text-center glass-panel text-gray-500">No mistakes recorded for this student.</div>
                            ) : (
                                <div className="space-y-4">
                                    <div className="flex justify-between items-center mb-4">
                                        <h3 className="font-bold text-lg">Mistake History ({studentMistakes.length})</h3>
                                    </div>
                                    {studentMistakes.map(mistake => (
                                        <div key={mistake.id} className="glass-panel p-4 border-l-4 mb-2 border-l-red-500">
                                            <div className="flex justify-between items-start mb-2">
                                                <div>
                                                    <h4 className="font-bold text-md">{mistake.Question.text}</h4>
                                                    <p className="text-xs text-gray-400 mt-1">Test: {mistake.Test.title} </p>
                                                </div>
                                                <div className="flex gap-2">
                                                    <span className={`badge ${mistake.status === 'active' ? 'bg-red-500/20 text-red-500' : 'bg-green-500/20 text-green-500'}`}>
                                                        {mistake.status.toUpperCase()}
                                                    </span>
                                                </div>
                                            </div>

                                            <div className="mt-2 text-sm bg-slate-900/50 p-2 rounded">
                                                <p><span className="text-red-400 font-bold">Explanation:</span> {mistake.Question.explanation}</p>
                                                <div className="mt-1 flex gap-4 text-xs text-gray-500">
                                                    <span>Reason: {mistake.is_incorrect ? 'Wrong Answer' : ''} {mistake.is_slow ? 'Too Slow' : ''}</span>
                                                    <span>Retries: {mistake.retry_count}</span>
                                                </div>
                                            </div>
                                        </div>
                                    ))}
                                </div>
                            )
                        )}
                    </div>
                )}
            </section>
        </div>
    );
};

export default MistakeAnalytics;
