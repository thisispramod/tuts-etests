import React, { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import api from '../../api';
import { Play, CheckCircle, Clock } from 'lucide-react';

const StudentDashboard = () => {
    const [tests, setTests] = useState([]);
    const [results, setResults] = useState([]);

    const [userClass, setUserClass] = useState(null);

    useEffect(() => {
        fetchData();
        fetchUserClass();
    }, []);

    const fetchUserClass = async () => {
        try {
            const res = await api.get('/student/me'); // I'll need to add this route or just use AuthContext
            setUserClass(res.data.Class?.name || 'Unassigned');
        } catch (err) { console.error(err); }
    };

    const fetchData = async () => {
        try {
            const [testsRes, resultsRes] = await Promise.all([
                api.get('/student/tests'),
                api.get('/student/results')
            ]);
            setTests(testsRes.data);
            setResults(resultsRes.data);
        } catch (err) { console.error(err); }
    };

    return (
        <div className="container animate-fade-in">
            <div className="flex justify-between items-center mb-6">
                <div>
                    <h1 className="text-2xl font-bold">Student Dashboard</h1>
                    {userClass && <p className="text-primary text-sm font-medium">Class: {userClass}</p>}
                </div>
                <Link to="/student/reports" className="btn btn-outline flex items-center gap-2">
                    <CheckCircle size={18} className="text-success" /> View Performance Report
                </Link>
            </div>

            {/* Available Tests */}
            <section className="mb-12">
                <h2 className="text-xl font-bold mb-4 flex items-center gap-2">
                    <Clock className="text-primary" /> Available Tests
                </h2>
                <div className="grid grid-3">
                    {tests.length === 0 ? <p className="text-gray">No tests assigned yet.</p> :
                        tests.map(test => (
                            <div key={test.id} className="glass-panel card">
                                <h3 className="text-xl font-bold mb-2">{test.title}</h3>
                                <p className="text-gray text-sm mb-4">Duration: {test.duration_minutes} mins</p>
                                <Link to={`/student/test/${test.id}`} className="btn btn-primary w-full">
                                    <Play size={16} /> Start Test
                                </Link>
                            </div>
                        ))}
                </div>
            </section>

            {/* Mistake Book Promo */}
            <section className="mb-12">
                <div className="glass-panel p-6 flex flex-col md:flex-row items-center justify-between bg-gradient-to-r from-red-900/20 to-slate-800">
                    <div className="mb-4 md:mb-0">
                        <h2 className="text-xl font-bold mb-2 text-white flex items-center gap-2">
                            <span role="img" aria-label="alert">🚨</span> Mistake Book
                        </h2>
                        <p className="text-gray-300">
                            You have pending mistakes to review. Focusing on your weak areas is the fastest way to improve.
                        </p>
                    </div>
                    <Link to="/student/mistakes" className="btn btn-danger">
                        Open Mistake Book
                    </Link>
                </div>
            </section >

            {/* History */}
            <section>
                <h2 className="text-xl font-bold mb-4 flex items-center gap-2">
                    <CheckCircle className="text-green-500" /> Past Results
                </h2>
                <div className="glass-panel overflow-hidden">
                    <table>
                        <thead>
                            <tr>
                                <th>Test</th>
                                <th>Date</th>
                                <th>Score</th>
                                <th>Questions</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            {results.length === 0 ?
                                <tr><td colSpan="6" className="text-center text-gray py-4">No attempts yet.</td></tr> :
                                results.map(r => (
                                    <tr key={r.id}>
                                        <td>{r.Test?.title || 'Unknown Test'}</td>
                                        <td>{new Date(r.createdAt).toLocaleDateString()}</td>
                                        <td className="font-bold text-primary">{r.score}</td>
                                        <td>{r.correct_answers}/{r.total_questions}</td>
                                        <td><span className="text-green-400 text-sm">Completed</span></td>
                                        <td>
                                            <Link to={`/student/result/${r.id}`} className="text-primary hover:underline text-sm font-bold">
                                                Review
                                            </Link>
                                        </td>
                                    </tr>
                                ))
                            }
                        </tbody>
                    </table>
                </div>
            </section >
        </div >
    );
};

export default StudentDashboard;
