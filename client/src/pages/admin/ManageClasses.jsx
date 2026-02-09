import React, { useEffect, useState } from 'react';
import api from '../../api';
import { Plus, Trash2, Users, ArrowLeft } from 'lucide-react';
import { Link } from 'react-router-dom';

const ManageClasses = () => {
    const [classes, setClasses] = useState([]);
    const [newClassName, setNewClassName] = useState('');
    const [loading, setLoading] = useState(true);

    useEffect(() => {
        fetchClasses();
    }, []);

    const fetchClasses = async () => {
        try {
            const res = await api.get('/classes');
            setClasses(res.data);
            setLoading(false);
        } catch (err) {
            console.error(err);
            setLoading(false);
        }
    };

    const handleAddClass = async (e) => {
        e.preventDefault();
        if (!newClassName.trim()) return;
        try {
            await api.post('/classes', { name: newClassName });
            setNewClassName('');
            fetchClasses();
        } catch (err) {
            alert('Error adding class. Name might already exist.');
        }
    };

    const handleDeleteClass = async (id) => {
        if (!confirm('Are you sure? This will unassign students from this class.')) return;
        try {
            await api.delete(`/classes/${id}`);
            fetchClasses();
        } catch (err) {
            alert('Error deleting class.');
        }
    };

    const handleAddBatch = async (classId, batchName) => {
        try {
            await api.post('/batches', { name: batchName, class_id: classId });
            fetchClasses();
        } catch (err) {
            alert('Error adding batch.');
        }
    };

    const handleDeleteBatch = async (id) => {
        if (!confirm('Delete this batch?')) return;
        try {
            await api.delete(`/batches/${id}`);
            fetchClasses();
        } catch (err) {
            alert('Error deleting batch.');
        }
    };

    if (loading) return <div className="p-8 text-center text-gray">Loading Classes...</div>;

    return (
        <div className="container animate-fade-in pb-12">
            <Link to="/dashboard" className="flex items-center gap-2 text-gray mb-4 hover:text-white">
                <ArrowLeft size={18} /> Back to Dashboard
            </Link>

            <div className="glass-panel p-8 mb-8">
                <h1 className="text-3xl font-bold mb-2">Manage Classes</h1>
                <p className="text-gray text-sm">Create and manage student classes for test assignment.</p>
            </div>

            <div className="grid md-grid-cols-2 gap-8">
                {/* Add Class Form */}
                <div className="glass-panel p-6">
                    <h2 className="text-xl font-bold mb-4 flex items-center gap-2">
                        <Plus size={20} className="text-primary" /> Add New Class
                    </h2>
                    <form onSubmit={handleAddClass}>
                        <div className="mb-4">
                            <label className="text-sm block mb-1">Class Name</label>
                            <input
                                type="text"
                                className="input-field"
                                placeholder="e.g. Class 10, Batch A"
                                value={newClassName}
                                onChange={(e) => setNewClassName(e.target.value)}
                                required
                            />
                        </div>
                        <button type="submit" className="btn btn-primary w-full">
                            Create Class
                        </button>
                    </form>
                </div>

                {/* Class List */}
                <div className="glass-panel p-6">
                    <h2 className="text-xl font-bold mb-4 flex items-center gap-2">
                        <Users size={20} className="text-primary" /> Existing Classes
                    </h2>
                    <div className="flex flex-col gap-3">
                        {classes.length === 0 && <p className="text-gray text-sm">No classes created yet.</p>}
                        {classes.map((cls) => (
                            <div key={cls.id} className="p-4 bg-white/5 rounded-lg border border-white/10 group">
                                <div className="flex justify-between items-center mb-4">
                                    <span className="font-medium text-lg">{cls.name}</span>
                                    <button
                                        onClick={() => handleDeleteClass(cls.id)}
                                        className="p-2 text-red-400 hover:bg-red-400/10 rounded-lg transition opacity-0 group-hover:opacity-100"
                                        title="Delete Class"
                                    >
                                        <Trash2 size={18} />
                                    </button>
                                </div>

                                {/* Batches Section */}
                                <div className="pl-4 border-l-2 border-white/10 ml-2">
                                    <h4 className="text-sm text-gray mb-2 font-bold uppercase tracking-wider">Batches</h4>
                                    <div className="flex flex-wrap gap-2 mb-3">
                                        {cls.Batches && cls.Batches.map(batch => (
                                            <div key={batch.id} className="bg-primary/20 text-primary-light px-3 py-1 rounded-full text-sm flex items-center gap-2">
                                                {batch.name}
                                                <button onClick={() => handleDeleteBatch(batch.id)} className="text-red-400 hover:text-red-300">
                                                    <Trash2 size={12} />
                                                </button>
                                            </div>
                                        ))}
                                        {(!cls.Batches || cls.Batches.length === 0) && <span className="text-xs text-gray-500 italic">No batches</span>}
                                    </div>
                                    <form onSubmit={(e) => {
                                        e.preventDefault();
                                        const input = e.target.elements.batchName;
                                        handleAddBatch(cls.id, input.value);
                                        input.value = '';
                                    }} className="flex gap-2">
                                        <input name="batchName" type="text" placeholder="New Batch..." className="input-field py-1 text-sm w-32" required />
                                        <button type="submit" className="btn btn-sm btn-outline border-primary text-primary hover:bg-primary hover:text-white">
                                            <Plus size={14} />
                                        </button>
                                    </form>
                                </div>
                            </div>
                        ))}
                    </div>
                </div>
            </div>
        </div>
    );
};

export default ManageClasses;
