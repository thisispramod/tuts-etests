import React, { useEffect, useState } from 'react';
import api from '../../api';
import { UserCog, ArrowLeft, Search } from 'lucide-react';
import { Link } from 'react-router-dom';

const ManageStudents = () => {
    const [students, setStudents] = useState([]);
    const [classes, setClasses] = useState([]);
    const [loading, setLoading] = useState(true);
    const [searchTerm, setSearchTerm] = useState('');

    useEffect(() => {
        fetchData();
    }, []);

    const fetchData = async () => {
        try {
            const [studentRes, classRes] = await Promise.all([
                api.get('/admin/students'),
                api.get('/classes')
            ]);
            setStudents(studentRes.data);
            setClasses(classRes.data);
            setLoading(false);
        } catch (err) {
            console.error(err);
            setLoading(false);
        }
    };

    const handleClassChange = async (studentId, classId) => {
        try {
            await api.put(`/admin/students/${studentId}/class`, {
                class_id: classId === '' ? null : parseInt(classId),
                batch_id: null // Reset batch when class changes
            });
            // Update local state for immediate feedback
            setStudents(prev => prev.map(s => s.id === studentId ? { ...s, class_id: classId === '' ? null : parseInt(classId), batch_id: null } : s));
        } catch (err) {
            alert('Error updating student class.');
        }
    };

    const filteredStudents = students.filter(s =>
        s.name.toLowerCase().includes(searchTerm.toLowerCase()) ||
        s.email.toLowerCase().includes(searchTerm.toLowerCase())
    );

    const handleBatchChange = async (studentId, batchId) => {
        const student = students.find(s => s.id === studentId);
        if (!student) return;

        try {
            await api.put(`/admin/students/${studentId}/class`, {
                class_id: student.class_id,
                batch_id: batchId === '' ? null : parseInt(batchId)
            });
            // Update local state
            setStudents(prev => prev.map(s => s.id === studentId ? { ...s, batch_id: batchId === '' ? null : parseInt(batchId) } : s));
        } catch (err) {
            alert('Error updating student batch.');
        }
    };

    if (loading) return <div className="p-8 text-center text-gray">Loading Students...</div>;

    return (
        <div className="container animate-fade-in pb-12">
            <Link to="/dashboard" className="flex items-center gap-2 text-gray mb-4 hover:text-white">
                <ArrowLeft size={18} /> Back to Dashboard
            </Link>

            <div className="glass-panel p-8 mb-8 flex flex-col md:flex-row justify-between items-center gap-6">
                <div>
                    <h1 className="text-3xl font-bold mb-2">Student Management</h1>
                    <p className="text-gray text-sm">Assign students to classes for test access control.</p>
                </div>
                <div className="relative">
                    <Search className="absolute left-3 top-1/2 -translate-y-1/2 text-gray" size={18} />
                    <input
                        type="text"
                        placeholder="Search students..."
                        className="input-field pl-10 mb-0 w-64"
                        value={searchTerm}
                        onChange={(e) => setSearchTerm(e.target.value)}
                    />
                </div>
            </div>

            <div className="glass-panel overflow-hidden">
                <table className="w-full text-left">
                    <thead className="bg-white/5 text-gray-400 text-sm uppercase tracking-wider">
                        <tr>
                            <th className="p-4">Student Name</th>
                            <th className="p-4">Email</th>
                            <th className="p-4">Assigned Class</th>
                            <th className="p-4">Assigned Batch</th>
                        </tr>
                    </thead>
                    <tbody className="divide-y divide-white/5">
                        {filteredStudents.length === 0 && (
                            <tr>
                                <td colSpan="3" className="p-8 text-center text-gray italic">No students found.</td>
                            </tr>
                        )}
                        {filteredStudents.map((student) => (
                            <tr key={student.id} className="hover:bg-white/5 transition">
                                <td className="p-4 font-medium">{student.name}</td>
                                <td className="p-4 text-gray">{student.email}</td>
                                <td className="p-4">
                                    <select
                                        className="input-field mb-0 py-1 text-sm bg-slate-800 border-primary/20"
                                        value={student.class_id || ''}
                                        onChange={(e) => handleClassChange(student.id, e.target.value)}
                                    >
                                        <option value="">Unassigned</option>
                                        {classes.map(cls => (
                                            <option key={cls.id} value={cls.id}>{cls.name}</option>
                                        ))}
                                    </select>
                                </td>
                                <td className="p-4">
                                    <select
                                        className="input-field mb-0 py-1 text-sm bg-slate-800 border-primary/20"
                                        value={student.batch_id || ''}
                                        onChange={(e) => handleBatchChange(student.id, e.target.value)}
                                        disabled={!student.class_id}
                                    >
                                        <option value="">No Batch</option>
                                        {classes.find(c => c.id === student.class_id)?.Batches?.map(batch => (
                                            <option key={batch.id} value={batch.id}>{batch.name}</option>
                                        ))}
                                    </select>
                                </td>
                            </tr>
                        ))}
                    </tbody>
                </table>
            </div>
        </div>
    );
};

export default ManageStudents;
