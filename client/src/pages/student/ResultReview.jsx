import React, { useEffect, useState } from 'react';
import { useParams, Link } from 'react-router-dom';
import api from '../../api';
import { ChevronLeft, CheckCircle, XCircle, Info, ArrowLeft, Bookmark } from 'lucide-react';

const ResultReview = () => {
    const { id } = useParams();
    const [attempt, setAttempt] = useState(null);
    const [rankings, setRankings] = useState(null);
    const [loading, setLoading] = useState(true);

    useEffect(() => {
        const fetchResult = async () => {
            try {
                const res = await api.get(`/student/result/${id}`);
                setAttempt(res.data);

                // Fetch Rankings
                if (res.data.test_id) {
                    try {
                        const rankRes = await api.get(`/rankings/${res.data.test_id}`);
                        setRankings(rankRes.data);
                    } catch (e) { console.error("Ranking fetch error", e); }
                }

                setLoading(false);
            } catch (err) {
                console.error(err);
                alert('Error loading result');
                setLoading(false);
            }
        };
        fetchResult();
    }, [id]);

    if (loading) return <div className="p-8 text-center text-gray">Loading Result...</div>;
    if (!attempt) return <div className="p-8 text-center text-gray">Result not found.</div>;

    const { Test: test, answers_json, QuestionTimes: qTimes } = attempt;
    const userAnswers = JSON.parse(answers_json || '{}');
    const questions = test.Questions || [];

    const formatTime = (seconds) => {
        const m = Math.floor(seconds / 60);
        const s = seconds % 60;
        return `${m}m ${s}s`;
    };

    const avgTime = qTimes?.length > 0
        ? (qTimes.reduce((acc, curr) => acc + curr.time_spent, 0) / questions.length).toFixed(1)
        : 0;

    return (
        <div className="container animate-fade-in pb-12">
            <Link to="/dashboard" className="flex items-center gap-2 text-gray mb-4 hover:text-white">
                <ArrowLeft size={18} /> Back to Dashboard
            </Link>

            <div className="glass-panel p-8 mb-8 flex flex-col md:flex-row justify-between items-center gap-6">
                <div>
                    <h1 className="text-3xl font-bold mb-2">{test.title} - Review</h1>
                    <p className="text-gray text-sm">Completed on {new Date(attempt.completed_at).toLocaleString()}</p>
                </div>
                <div className="flex flex-wrap justify-center gap-6 text-center">
                    <div>
                        <div className="text-2xl font-bold text-primary">{attempt.score}</div>
                        <div className="text-xs text-gray uppercase tracking-wider">Score</div>
                    </div>
                    <div>
                        <div className="text-2xl font-bold text-success">{attempt.correct_answers}</div>
                        <div className="text-xs text-gray uppercase tracking-wider">Correct</div>
                    </div>
                    <div>
                        <div className="text-2xl font-bold text-danger">{attempt.wrong_answers}</div>
                        <div className="text-xs text-gray uppercase tracking-wider">Wrong</div>
                    </div>
                    <div className="border-l border-white/10 pl-6">
                        <div className="text-2xl font-bold text-blue-400">{avgTime}s</div>
                        <div className="text-xs text-gray uppercase tracking-wider">Avg/Question</div>
                    </div>
                </div>
            </div>

            {/* Ranking & Leaderboard Section */}
            {rankings && (
                <div className="grid md-grid-cols-2 gap-8 mb-8">
                    {/* My Rank Cards */}
                    <div className="glass-panel p-6">
                        <h3 className="font-bold mb-4 flex items-center gap-2">🏆 Your Rank</h3>
                        <div className="grid grid-cols-3 gap-4 text-center">
                            <div className="p-4 bg-primary/10 rounded-xl border border-primary/20">
                                <div className="text-3xl font-bold text-primary">{rankings.myRanks.overall}</div>
                                <div className="text-xs uppercase tracking-wider text-gray-400 mt-1">Overall</div>
                            </div>
                            <div className="p-4 bg-info/10 rounded-xl border border-info/20">
                                <div className="text-3xl font-bold text-blue-400">{rankings.myRanks.class}</div>
                                <div className="text-xs uppercase tracking-wider text-gray-400 mt-1">Class Rank</div>
                            </div>
                            <div className="p-4 bg-purple-500/10 rounded-xl border border-purple-500/20">
                                <div className="text-3xl font-bold text-purple-400">{rankings.myRanks.batch}</div>
                                <div className="text-xs uppercase tracking-wider text-gray-400 mt-1">Batch Rank</div>
                            </div>
                        </div>
                    </div>

                    {/* Leaderboard Table (Top 5) */}
                    <div className="glass-panel p-6">
                        <h3 className="font-bold mb-4 flex items-center gap-2">🏅 Top Performers</h3>
                        <div className="overflow-x-auto">
                            <table className="w-full text-sm text-left">
                                <thead className="text-xs text-gray uppercase bg-white/5">
                                    <tr>
                                        <th className="px-3 py-2 rounded-l">Rank</th>
                                        <th className="px-3 py-2">Student</th>
                                        <th className="px-3 py-2">Score</th>
                                        <th className="px-3 py-2 rounded-r">Accuracy</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {rankings.leaderboard.slice(0, 5).map((user, idx) => (
                                        <tr key={idx} className={`border-b border-white/5 ${user.user_id === attempt.user_id ? 'bg-primary/10' : ''}`}>
                                            <td className="px-3 py-2 font-bold text-primary">#{user.rank}</td>
                                            <td className="px-3 py-2 font-medium">{user.name} {user.user_id === attempt.user_id && '(You)'}</td>
                                            <td className="px-3 py-2 text-white">{user.score}</td>
                                            <td className="px-3 py-2 text-gray">{user.accuracy}%</td>
                                        </tr>
                                    ))}
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            )}

            <div className="glass-panel p-8 mb-8 flex flex-col md:flex-row justify-between items-center gap-6">
                <div className="p-4 rounded-xl bg-green-500/10 border border-green-500/20">
                    <h4 className="text-green-500 font-bold text-sm mb-1">Strong Areas</h4>
                    <p className="text-xs text-gray-300">Questions answered correctly in under 30 seconds.</p>
                </div>
                <div className="p-4 rounded-xl bg-yellow-500/10 border border-yellow-500/20">
                    <h4 className="text-yellow-500 font-bold text-sm mb-1">Speed Improvement</h4>
                    <p className="text-xs text-gray-300">Questions answered correctly but took over 60 seconds.</p>
                </div>
                <div className="p-4 rounded-xl bg-red-500/10 border border-red-500/20">
                    <h4 className="text-red-500 font-bold text-sm mb-1">Revision Map</h4>
                    <p className="text-xs text-gray-300">Questions with high time spent and wrong answers.</p>
                </div>
            </div>

            <div className="flex flex-col gap-8">
                {questions.map((q, idx) => {
                    const userAns = userAnswers[q.id];
                    const isCorrect = userAns === q.correct_option;
                    const isUnattempted = !userAns;
                    const timeSpent = qTimes?.find(t => t.question_id === q.id)?.time_spent || 0;

                    let highlight = null;
                    if (!isUnattempted) {
                        if (timeSpent > 60 && !isCorrect) highlight = { label: 'Revision Needed: High Time + Incorrect', class: 'bg-red-500/20 text-red-100 border-red-500/40' };
                        else if (timeSpent > 60 && isCorrect) highlight = { label: 'Speed Improvement: High Time + Correct', class: 'bg-yellow-500/20 text-yellow-100 border-yellow-500/40' };
                        else if (timeSpent < 30 && isCorrect) highlight = { label: 'Strong Area: Quick + Correct', class: 'bg-green-500/20 text-green-100 border-green-500/40' };
                    }

                    return (
                        <div key={q.id} className="glass-panel p-6 relative overflow-hidden">
                            {highlight && (
                                <div className={`absolute top-0 left-0 right-0 p-1 px-4 text-[10px] font-bold uppercase tracking-widest border-b ${highlight.class}`}>
                                    {highlight.label}
                                </div>
                            )}

                            <div className={`flex justify-between items-start mb-6 ${highlight ? 'mt-6' : ''}`}>
                                <h3 className="text-xl font-medium">
                                    <span className="text-primary font-bold mr-2">Q{idx + 1}.</span>
                                    {q.text}
                                </h3>
                                <div className="flex flex-col items-end gap-2">
                                    <div className="flex items-center gap-2">
                                        <button
                                            onClick={async () => {
                                                try {
                                                    await api.post(`/student/mistakes/${q.id}/bookmark`, { test_id: attempt.test_id });
                                                    alert('Bookmark toggled!'); // Simple feedback for now
                                                } catch (e) { console.error(e); }
                                            }}
                                            className="p-1.5 rounded-full hover:bg-slate-700 text-gray-400 hover:text-yellow-400 transition"
                                            title="Bookmark this question"
                                        >
                                            <Bookmark size={18} />
                                        </button>
                                        {isUnattempted ? (
                                            <span className="px-3 py-1 bg-gray-500/20 text-gray-400 rounded text-sm border border-gray-500/20">Unattempted</span>
                                        ) : isCorrect ? (
                                            <span className="px-3 py-1 bg-green-500/20 text-green-400 rounded text-sm border border-green-500/30 flex items-center gap-1">
                                                <CheckCircle size={14} /> Correct
                                            </span>
                                        ) : (
                                            <span className="px-3 py-1 bg-red-500/20 text-red-400 rounded text-sm border border-red-500/30 flex items-center gap-1">
                                                <XCircle size={14} /> Incorrect
                                            </span>
                                        )}
                                    </div>
                                    <span className="text-xs text-gray font-mono bg-white/5 px-2 py-1 rounded">
                                        Time Spent: {formatTime(timeSpent)}
                                    </span>
                                </div>
                            </div>

                            <div className="grid grid-2 gap-4 mb-6">
                                {['A', 'B', 'C', 'D'].map(opt => {
                                    const optText = q[`option_${opt.toLowerCase()}`];
                                    let statusClass = '';
                                    if (opt === q.correct_option) statusClass = 'correct';
                                    else if (opt === userAns && !isCorrect) statusClass = 'wrong';

                                    return (
                                        <div key={opt} className={`option-card ${statusClass} cursor-default`}>
                                            <div className={`option-circle ${statusClass}`}>
                                                {statusClass === 'correct' ? <CheckCircle size={18} /> :
                                                    statusClass === 'wrong' ? <XCircle size={18} /> : opt}
                                            </div>
                                            <span>{optText}</span>
                                        </div>
                                    );
                                })}
                            </div>

                            <div className="bg-primary/5 border border-primary/20 rounded-xl p-4 flex gap-4">
                                <div className="mt-1 text-primary">
                                    <Info size={20} />
                                </div>
                                <div>
                                    <p className="font-bold text-primary mb-1 text-sm uppercase tracking-wide">Explanation</p>
                                    <p className="text-white font-medium mb-1">
                                        Correct Answer: <span className="text-success text-md">Option {q.correct_option}: {q[`option_${q.correct_option?.toLowerCase()}`]}</span>
                                    </p>
                                    {q.explanation ? (
                                        <div className="mt-2 pt-2 border-t border-white/5 text-gray-200 text-sm leading-relaxed">
                                            {q.explanation}
                                        </div>
                                    ) : (
                                        <p className="text-gray-500 text-sm italic mt-1">No additional explanation provided for this question.</p>
                                    )}
                                </div>
                            </div>
                        </div>
                    );
                })}
            </div>
        </div>
    );
};

export default ResultReview;
