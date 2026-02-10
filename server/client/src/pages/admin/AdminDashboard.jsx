import React, { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import api from '../../api';
import { Plus, FileText, BarChart, Trash2, Users, AlertTriangle } from 'lucide-react';

const AdminDashboard = () => {
    const [tests, setTests] = useState([]);

    useEffect(() => {
        fetchTests();
    }, []);

    const fetchTests = async () => {
        try {
            const res = await api.get('/admin/tests');
            setTests(res.data);
        } catch (err) {
            console.error(err);
        }
    };

    const createTest = async () => {
        const title = prompt('Enter Test Title:');
        if (!title) return;
        const duration = prompt('Enter Duration (minutes):', '60');

        try {
            await api.post('/tests', {
                title,
                duration_minutes: parseInt(duration),
                description: 'No description'
            });
            fetchTests();
        } catch (err) {
            alert('Failed to create test');
        }
    };

    return (
        <div className="container animate-fade-in">
            <div className="flex justify-between items-center mb-8">
                <h1 className="text-2xl font-bold">Admin Dashboard</h1>
                <div className="flex gap-4">
                    {/* Simple prompt-based create for speed, typically would be a modal */}
                    <button onClick={createTest} className="btn btn-primary">
                        <Plus size={18} /> New Test
                    </button>
                </div>
            </div>

            <div className="grid md-grid-cols-2 lg-grid-cols-3 gap-6">
                {tests.map(test => (
                    <div key={test.id} className="glass-panel p-6 flex flex-col justify-between">
                        <div>
                            <h3 className="text-xl font-bold mb-2">{test.title}</h3>
                            <p className="text-gray text-sm mb-2">{test.duration_minutes} mins • {new Date(test.createdAt).toLocaleDateString()}</p>
                            <div className="flex flex-wrap gap-1 mt-2">
                                {test.Classes && test.Classes.length > 0 ? (
                                    test.Classes.map(c => (
                                        <span key={c.id} className="text-[10px] bg-primary/20 text-blue-300 px-2 py-0.5 rounded uppercase font-bold">
                                            {c.name}
                                        </span>
                                    ))
                                ) : (
                                    <span className="text-[10px] bg-gray-500/20 text-gray-400 px-2 py-0.5 rounded uppercase font-bold">
                                        No Class Assigned
                                    </span>
                                )}
                            </div>
                        </div>
                        <div className="flex gap-2 mt-4">
                            <Link to={`/admin/test/${test.id}`} className="btn btn-outline w-full text-sm mt-0">
                                Manage
                            </Link>
                        </div>
                    </div>
                ))}
            </div>

            <div className="mt-12">
                <h2 className="text-xl font-bold mb-4">Quick Links</h2>
                <div className="flex flex-wrap gap-4">
                    <Link to="/admin/reports" className="glass-panel p-4 flex items-center gap-3 text-primary hover:bg-white/5 transition border border-primary/20">
                        <FileText />&nbsp; Performance Reports
                    </Link>
                    <Link to="/admin/classes" className="glass-panel p-4 flex items-center gap-3 text-primary hover:bg-white/5 transition border border-primary/20">
                        <Plus />&nbsp; Manage Classes
                    </Link>
                    <Link to="/admin/students" className="glass-panel p-4 flex items-center gap-3 text-primary hover:bg-white/5 transition border border-primary/20">
                        <Users />&nbsp; Manage Students
                    </Link>
                    <Link to="/admin/mistakes" className="glass-panel p-4 flex items-center gap-3 text-primary hover:bg-white/5 transition border border-primary/20">
                        <AlertTriangle />&nbsp; Mistake Analytics
                    </Link>
                </div>
            </div>
        </div>
    );
};

export default AdminDashboard;
