import React, { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import api from '../../api';
import { ArrowLeft, BarChart2, TrendingUp, Award, Clock } from 'lucide-react';

const StudentReports = () => {
    const [data, setData] = useState(null);
    const [loading, setLoading] = useState(true);

    useEffect(() => {
        const fetchPerformance = async () => {
            try {
                const res = await api.get('/student/performance');
                setData(res.data);
                setLoading(false);
            } catch (err) {
                console.error(err);
                setLoading(false);
            }
        };
        fetchPerformance();
    }, []);

    if (loading) return <div className="p-8 text-center text-gray">Loading Reports...</div>;
    if (!data || data.attempts.length === 0) return (
        <div className="container p-8 text-center">
            <Link to="/dashboard" className="flex items-center gap-2 text-gray mb-4 hover:text-white">
                <ArrowLeft size={18} /> Back to Dashboard
            </Link>
            <div className="glass-panel p-12">
                <BarChart2 size={48} className="mx-auto mb-4 text-gray/30" />
                <h2 className="text-xl font-bold">No Reports Available</h2>
                <p className="text-gray mt-2">Take some tests to see your performance analytics here.</p>
            </div>
        </div>
    );

    const { attempts, stats } = data;

    return (
        <div className="container animate-fade-in pb-12">
            <Link to="/dashboard" className="flex items-center gap-2 text-gray mb-4 hover:text-white">
                <ArrowLeft size={18} /> Back to Dashboard
            </Link>

            <h1 className="text-3xl font-bold mb-8">My Performance Report</h1>

            {/* Stats Overview */}
            <div className="grid grid-3 gap-6 mb-8">
                <div className="glass-panel p-6 flex items-center gap-4">
                    <div className="p-3 bg-primary/20 rounded-lg text-primary">
                        <Award size={24} />
                    </div>
                    <div>
                        <div className="text-2xl font-bold">{stats.totalTests}</div>
                        <div className="text-xs text-gray uppercase tracking-wider">Tests Taken</div>
                    </div>
                </div>
                <div className="glass-panel p-6 flex items-center gap-4">
                    <div className="p-3 bg-success/20 rounded-lg text-success">
                        <TrendingUp size={24} />
                    </div>
                    <div>
                        <div className="text-2xl font-bold">{stats.avgScore}</div>
                        <div className="text-xs text-gray uppercase tracking-wider">Average Score</div>
                    </div>
                </div>
                <div className="glass-panel p-6 flex items-center gap-4">
                    <div className="p-3 bg-purple-500/20 rounded-lg text-purple-400">
                        <Clock size={24} />
                    </div>
                    <div>
                        <div className="text-2xl font-bold">{stats.totalScore}</div>
                        <div className="text-xs text-gray uppercase tracking-wider">Total Marks</div>
                    </div>
                </div>
            </div>

            {/* Detailed Table */}
            <div className="glass-panel overflow-hidden">
                <div className="p-6 border-b border-white/10">
                    <h2 className="font-bold flex items-center gap-2">
                        <BarChart2 size={18} className="text-primary" /> Detailed History
                    </h2>
                </div>
                <table className="w-full">
                    <thead>
                        <tr>
                            <th className="text-left p-4 text-xs font-bold text-gray uppercase tracking-wider">Test Name</th>
                            <th className="text-left p-4 text-xs font-bold text-gray uppercase tracking-wider">Date</th>
                            <th className="text-left p-4 text-xs font-bold text-gray uppercase tracking-wider">Score</th>
                            <th className="text-left p-4 text-xs font-bold text-gray uppercase tracking-wider">Accuracy</th>
                            <th className="text-right p-4 text-xs font-bold text-gray uppercase tracking-wider">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        {attempts.map(a => {
                            const accuracy = ((a.correct_answers / a.total_questions) * 100).toFixed(0);
                            return (
                                <tr key={a.id} className="border-t border-white/5 hover:bg-white/5 transition">
                                    <td className="p-4 font-medium">{a.Test?.title}</td>
                                    <td className="p-4 text-sm text-gray">{new Date(a.createdAt).toLocaleDateString()}</td>
                                    <td className="p-4">
                                        <span className="text-primary font-bold">{a.score}</span>
                                        <span className="text-xs text-gray">/{a.total_questions}</span>
                                    </td>
                                    <td className="p-4">
                                        <div className="flex items-center gap-2">
                                            <div className="w-24 bg-white/10 h-1.5 rounded-full overflow-hidden">
                                                <div
                                                    className="h-full bg-primary"
                                                    style={{ width: `${accuracy}%` }}
                                                ></div>
                                            </div>
                                            <span className="text-xs font-bold">{accuracy}%</span>
                                        </div>
                                    </td>
                                    <td className="p-4 text-right">
                                        <Link
                                            to={`/student/result/${a.id}`}
                                            className="btn btn-outline text-xs py-1"
                                        >
                                            View Review
                                        </Link>
                                    </td>
                                </tr>
                            );
                        })}
                    </tbody>
                </table>
            </div>
        </div>
    );
};

export default StudentReports;
