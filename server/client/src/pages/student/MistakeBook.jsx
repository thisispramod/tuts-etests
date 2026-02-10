import React, { useEffect, useState } from 'react';
import api from '../../api';
import { BookOpen, Clock, AlertCircle, Bookmark, CheckCircle, RotateCcw, Filter } from 'lucide-react';

const MistakeBook = () => {
    const [mistakes, setMistakes] = useState([]);
    const [loading, setLoading] = useState(true);
    const [filter, setFilter] = useState('all'); // all, incorrect, slow, bookmarked
    const [retryMode, setRetryMode] = useState(null); // mistakeId being retried
    const [selectedAnswer, setSelectedAnswer] = useState('');
    const [retryResult, setRetryResult] = useState(null);

    useEffect(() => {
        fetchMistakes();
    }, []);

    const fetchMistakes = async () => {
        try {
            const res = await api.get('/student/mistakes');
            setMistakes(res.data);
            setLoading(false);
        } catch (err) {
            console.error(err);
            setLoading(false);
        }
    };

    const handleRetry = async (mistakeId) => {
        try {
            const res = await api.post(`/student/mistakes/${mistakeId}/retry`, { answer: selectedAnswer });
            setRetryResult(res.data);

            // Always update status if changed
            setMistakes(prev => prev.map(m => {
                if (m.id === mistakeId && res.data.status) {
                    return { ...m, status: res.data.status };
                }
                return m;
            }));

        } catch (err) {
            console.error(err);
        }
    };

    const handleMarkRevised = async (mistakeId) => {
        try {
            await api.put(`/student/mistakes/${mistakeId}/revise`);
            setMistakes(prev => prev.map(m => m.id === mistakeId ? { ...m, status: 'revised' } : m));
        } catch (err) {
            console.error(err);
        }
    };

    const filteredMistakes = mistakes.filter(m => {
        if (m.status === 'improved' || m.status === 'revised') return false; // Focus on active mistakes
        if (filter === 'all') return true;
        if (filter === 'incorrect') return m.is_incorrect;
        if (filter === 'slow') return m.is_slow;
        if (filter === 'bookmarked') return m.is_bookmarked;
        return true;
    });

    const activeMistakesCount = mistakes.filter(m => m.status === 'active').length;
    const improvedCount = mistakes.filter(m => m.status === 'improved').length;

    if (loading) return <div className="p-8 text-center">Loading Mistake Book...</div>;

    return (
        <div className="container animate-fade-in pb-12">
            <header className="mb-8">
                <h1 className="text-3xl font-bold mb-2 flex items-center gap-2">
                    <BookOpen className="text-red-500" /> My Mistake Book
                </h1>
                <p className="text-gray-400">Focus on your weak areas and turn mistakes into mastery.</p>
            </header>

            {/* Stats */}
            <div className="grid grid-cols-1 md:grid-cols-3 gap-6 mb-8">
                <div className="glass-panel p-6 flex items-center justify-between">
                    <div>
                        <p className="text-gray-400 text-sm">Active Mistakes</p>
                        <h2 className="text-3xl font-bold text-red-500">{activeMistakesCount}</h2>
                    </div>
                    <AlertCircle size={32} className="text-red-500 opacity-50" />
                </div>
                <div className="glass-panel p-6 flex items-center justify-between">
                    <div>
                        <p className="text-gray-400 text-sm">Improved</p>
                        <h2 className="text-3xl font-bold text-green-500">{improvedCount}</h2>
                    </div>
                    <CheckCircle size={32} className="text-green-500 opacity-50" />
                </div>
                <div className="glass-panel p-6 flex items-center justify-between">
                    <div>
                        <p className="text-gray-400 text-sm">Total Logged</p>
                        <h2 className="text-3xl font-bold">{mistakes.length}</h2>
                    </div>
                    <Bookmark size={32} className="text-primary opacity-50" />
                </div>
            </div>

            {/* Filters */}
            <div className="flex gap-4 mb-6 overflow-x-auto pb-2">
                <button
                    onClick={() => setFilter('all')}
                    className={`btn ${filter === 'all' ? 'btn-primary' : 'btn-outline'}`}
                >
                    All Pending
                </button>
                <button
                    onClick={() => setFilter('incorrect')}
                    className={`btn ${filter === 'incorrect' ? 'btn-danger' : 'btn-outline'}`}
                >
                    <AlertCircle size={16} className="mr-2 inline" /> Incorrect
                </button>
                <button
                    onClick={() => setFilter('slow')}
                    className={`btn ${filter === 'slow' ? 'btn-warning' : 'btn-outline'}`}
                >
                    <Clock size={16} className="mr-2 inline" /> Slow
                </button>
                <button
                    onClick={() => setFilter('bookmarked')}
                    className={`btn ${filter === 'bookmarked' ? 'btn-info' : 'btn-outline'}`}
                >
                    <Bookmark size={16} className="mr-2 inline" /> Bookmarked
                </button>
            </div>

            {/* List */}
            <div className="space-y-6">
                {filteredMistakes.length === 0 ? (
                    <div className="text-center py-12 text-gray-500 glass-panel">
                        <CheckCircle size={48} className="mx-auto mb-4 opacity-50" />
                        <p>No active mistakes in this category. Great job!</p>
                    </div>
                ) : (
                    filteredMistakes.map(mistake => (
                        <div key={mistake.id} className="glass-panel p-6 relative border-l-4 border-l-red-500">
                            <div className="absolute top-4 right-4 flex gap-2">
                                {mistake.is_incorrect && <span className="badge bg-red-500/20 text-red-500 text-xs px-2 py-1 rounded">Wrong</span>}
                                {mistake.is_slow && <span className="badge bg-yellow-500/20 text-yellow-500 text-xs px-2 py-1 rounded">Slow</span>}
                                {mistake.is_bookmarked && <span className="badge bg-blue-500/20 text-blue-500 text-xs px-2 py-1 rounded">Bookmarked</span>}
                            </div>

                            <div className="mb-4 pr-12">
                                <h3 className="text-lg font-semibold mb-2">{mistake.Question.text}</h3>
                                <p className="text-sm text-gray-400">Topic: {mistake.Question.topic} • Test: {mistake.Test.title}</p>
                            </div>

                            {retryMode === mistake.id ? (
                                <div className="mt-4 bg-slate-800 p-4 rounded-lg animate-fade-in">
                                    <h4 className="font-bold mb-3 text-sm uppercase text-gray-400">Retry Question</h4>
                                    <div className="grid grid-cols-1 md:grid-cols-2 gap-3 mb-4">
                                        {['option_a', 'option_b', 'option_c', 'option_d'].map(optKey => (
                                            <button
                                                key={optKey}
                                                onClick={() => setSelectedAnswer(optKey.split('_')[1].toUpperCase())}
                                                className={`p-3 text-left rounded border transition-all ${selectedAnswer === optKey.split('_')[1].toUpperCase()
                                                    ? 'border-primary bg-primary/20 text-white'
                                                    : 'border-slate-700 hover:border-slate-500'
                                                    }`}
                                            >
                                                <span className="font-bold mr-2">{optKey.split('_')[1].toUpperCase()}.</span>
                                                {mistake.Question[optKey]}
                                            </button>
                                        ))}
                                    </div>

                                    {retryResult ? (
                                        <div className={`p-4 rounded mb-4 ${retryResult.isCorrect ? 'bg-green-500/20 border border-green-500' : 'bg-red-500/20 border border-red-500'}`}>
                                            <p className={`font-bold ${retryResult.isCorrect ? 'text-green-400' : 'text-red-400'}`}>
                                                {retryResult.isCorrect ? 'Correct! Keep it up.' : 'Incorrect. Try again!'}
                                            </p>
                                            <p className="mt-2 text-sm text-gray-300">
                                                <span className="font-bold">Explanation:</span> {mistake.Question.explanation}
                                            </p>
                                            {retryResult.isCorrect && (
                                                <button onClick={() => { setRetryMode(null); setRetryResult(null); setSelectedAnswer(''); fetchMistakes(); }} className="btn btn-sm btn-outline mt-2">
                                                    Close
                                                </button>
                                            )}
                                        </div>
                                    ) : (
                                        <div className="flex gap-2">
                                            <button
                                                onClick={() => handleRetry(mistake.id)}
                                                disabled={!selectedAnswer}
                                                className="btn btn-primary"
                                            >
                                                Submit Retry
                                            </button>
                                            <button onClick={() => { setRetryMode(null); setSelectedAnswer(''); }} className="btn btn-outline">
                                                Cancel
                                            </button>
                                        </div>
                                    )}
                                </div>
                            ) : (
                                <div className="flex gap-3 mt-4">
                                    <button onClick={() => setRetryMode(mistake.id)} className="btn btn-sm btn-primary">
                                        <RotateCcw size={14} className="mr-1" /> Retry
                                    </button>
                                    <button onClick={() => handleMarkRevised(mistake.id)} className="btn btn-sm btn-outline text-gray-400 hover:text-white">
                                        <CheckCircle size={14} className="mr-1" /> Mark Revised
                                    </button>
                                </div>
                            )}
                        </div>
                    ))
                )}
            </div>
        </div>
    );
};

export default MistakeBook;
