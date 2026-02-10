import React, { useEffect, useState } from 'react';
import { useParams, Link } from 'react-router-dom';
import api from '../../api';
import { ArrowLeft, BarChart3, Clock, Target, AlertTriangle, Download } from 'lucide-react';

const TestAnalytics = () => {
    const { id } = useParams();
    const [analytics, setAnalytics] = useState([]);
    const [loading, setLoading] = useState(true);
    const [testTitle, setTestTitle] = useState('');

    useEffect(() => {
        const fetchAnalytics = async () => {
            try {
                // Fetch test title
                const testRes = await api.get(`/tests/${id}`);
                setTestTitle(testRes.data.title);

                // Fetch analytics data
                const res = await api.get(`/admin/analytics/questions/${id}`);
                setAnalytics(res.data);
                setLoading(false);
            } catch (err) {
                console.error(err);
                setLoading(false);
            }
        };
        fetchAnalytics();
    }, [id]);

    const exportToCSV = () => {
        const headers = ['Question', 'Avg Time Spent (s)', 'Accuracy (%)', 'Total Attempts'];
        const rows = analytics.map(q => [
            `"${q.text.replace(/"/g, '""')}"`,
            q.avgTimeSpent,
            q.accuracy,
            q.totalAttempts
        ]);

        const csvContent = [headers, ...rows].map(e => e.join(",")).join("\n");
        const blob = new Blob([csvContent], { type: 'text/csv;charset=utf-8;' });
        const link = document.createElement("a");
        const url = URL.createObjectURL(blob);
        link.setAttribute("href", url);
        link.setAttribute("download", `analytics_test_${id}.csv`);
        link.style.visibility = 'hidden';
        document.body.appendChild(link);
        link.click();
        document.body.removeChild(link);
    };

    if (loading) return <div className="p-8 text-center text-gray">Loading Analytics...</div>;

    return (
        <div className="container animate-fade-in pb-12">
            <div className="flex justify-between items-center mb-4">
                <Link to={`/admin/test/${id}`} className="flex items-center gap-2 text-gray hover:text-white">
                    <ArrowLeft size={18} /> Back to Manage Test
                </Link>
                <button onClick={exportToCSV} className="btn btn-outline flex items-center gap-2">
                    <Download size={18} /> Export CSV
                </button>
            </div>

            <div className="glass-panel p-8 mb-8">
                <h1 className="text-3xl font-bold mb-2">{testTitle} - Education Analytics</h1>
                <p className="text-gray">Deep insights into student performance and question difficulty.</p>
            </div>

            <div className="grid md-grid-cols-3 gap-6 mb-8">
                <div className="glass-panel p-6 border-l-4 border-primary">
                    <div className="flex items-center gap-3 text-primary mb-2">
                        <Clock size={24} />
                        <h3 className="font-bold">Avg. Time / Question</h3>
                    </div>
                    <p className="text-2xl font-bold">
                        {(analytics.reduce((acc, curr) => acc + curr.avgTimeSpent, 0) / (analytics.length || 1)).toFixed(1)}s
                    </p>
                </div>
                <div className="glass-panel p-6 border-l-4 border-success">
                    <div className="flex items-center gap-3 text-success mb-2">
                        <Target size={24} />
                        <h3 className="font-bold">Overall Accuracy</h3>
                    </div>
                    <p className="text-2xl font-bold">
                        {(analytics.reduce((acc, curr) => acc + curr.accuracy, 0) / (analytics.length || 1)).toFixed(1)}%
                    </p>
                </div>
                <div className="glass-panel p-6 border-l-4 border-danger">
                    <div className="flex items-center gap-3 text-danger mb-2">
                        <AlertTriangle size={24} />
                        <h3 className="font-bold">Difficult Questions</h3>
                    </div>
                    <p className="text-2xl font-bold">
                        {analytics.filter(q => q.accuracy < 50 || q.avgTimeSpent > 60).length} Detected
                    </p>
                </div>
            </div>

            {/* Topic-wise Analytics */}
            <div className="mb-8">
                <h2 className="text-xl font-bold mb-4 flex items-center gap-2">
                    <BarChart3 size={20} className="text-primary" /> Topic-wise Performance
                </h2>
                <div className="grid md-grid-cols-2 lg-grid-cols-4 gap-4">
                    {Object.entries(analytics.reduce((acc, q) => {
                        const topic = q.topic || 'General';
                        if (!acc[topic]) acc[topic] = { count: 0, totalAccuracy: 0, totalTime: 0 };
                        acc[topic].count++;
                        acc[topic].totalAccuracy += q.accuracy;
                        acc[topic].totalTime += q.avgTimeSpent;
                        return acc;
                    }, {})).map(([topic, stats]) => (
                        <div key={topic} className="glass-panel p-4 bg-white/5 border border-white/10 hover:border-primary/30 transition">
                            <h4 className="font-bold text-primary mb-2 truncate">{topic}</h4>
                            <div className="flex justify-between text-xs mb-1">
                                <span className="text-gray">Accuracy</span>
                                <span className="font-mono">{(stats.totalAccuracy / stats.count).toFixed(1)}%</span>
                            </div>
                            <div className="w-full bg-white/5 h-1.5 rounded-full mb-3 overflow-hidden">
                                <div
                                    className="h-full bg-primary"
                                    style={{ width: `${stats.totalAccuracy / stats.count}%` }}
                                ></div>
                            </div>
                            <div className="flex justify-between text-xs">
                                <span className="text-gray">Avg. Time</span>
                                <span className="font-mono">{(stats.totalTime / stats.count).toFixed(1)}s</span>
                            </div>
                        </div>
                    ))}
                </div>
            </div>

            <div className="glass-panel overflow-hidden">
                <table className="w-full text-left">
                    <thead className="bg-white/5 text-gray-400 text-sm uppercase tracking-wider">
                        <tr>
                            <th className="p-4">Question</th>
                            <th className="p-4 text-center">Avg Time</th>
                            <th className="p-4 text-center">Accuracy</th>
                            <th className="p-4 text-center">Attempts</th>
                            <th className="p-4">Insights</th>
                        </tr>
                    </thead>
                    <tbody className="divide-y divide-white/5">
                        {analytics.map((q, idx) => {
                            const isDifficult = q.accuracy < 50;
                            const isSlow = q.avgTimeSpent > 60;

                            return (
                                <tr key={q.id} className="hover:bg-white/5 transition">
                                    <td className="p-4 max-w-md">
                                        <div className="font-medium truncate">{q.text}</div>
                                        <div className="text-xs text-gray">Question #{idx + 1}</div>
                                    </td>
                                    <td className="p-4 text-center font-mono">{q.avgTimeSpent}s</td>
                                    <td className="p-4 text-center">
                                        <div className="flex items-center justify-center gap-2">
                                            <div className="w-16 bg-white/10 h-2 rounded-full overflow-hidden">
                                                <div
                                                    className={`h-full ${q.accuracy > 70 ? 'bg-success' : q.accuracy > 40 ? 'bg-yellow-500' : 'bg-danger'}`}
                                                    style={{ width: `${q.accuracy}%` }}
                                                ></div>
                                            </div>
                                            <span className="text-sm font-bold">{q.accuracy}%</span>
                                        </div>
                                    </td>
                                    <td className="p-4 text-center text-gray">{q.totalAttempts}</td>
                                    <td className="p-4">
                                        <div className="flex gap-2">
                                            {isDifficult && (
                                                <span className="text-[10px] bg-red-500/20 text-red-400 px-2 py-1 rounded border border-red-500/20 uppercase font-bold">Hard</span>
                                            )}
                                            {isSlow && (
                                                <span className="text-[10px] bg-yellow-500/20 text-yellow-400 px-2 py-1 rounded border border-yellow-500/20 uppercase font-bold">Slow</span>
                                            )}
                                            {!isDifficult && !isSlow && (
                                                <span className="text-[10px] bg-green-500/20 text-green-400 px-2 py-1 rounded border border-green-500/20 uppercase font-bold">Optimal</span>
                                            )}
                                        </div>
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

export default TestAnalytics;
