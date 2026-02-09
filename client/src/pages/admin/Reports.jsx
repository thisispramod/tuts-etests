import React, { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import api from '../../api';
import { ArrowLeft, Download } from 'lucide-react';

const AdminReports = () => {
    const [attempts, setAttempts] = useState([]);

    useEffect(() => {
        const fetchReports = async () => {
            try {
                const res = await api.get('/admin/reports');
                setAttempts(res.data);
            } catch (err) {
                console.error(err);
            }
        };
        fetchReports();
    }, []);

    const exportCSV = () => {
        if (attempts.length === 0) return;

        // Create CSV content
        const headers = "Student Name,Email,Test Title,Score,Correct,Wrong,Total Questions,Date\n";
        const rows = attempts.map(a =>
            `"${a.User?.name}","${a.User?.email}","${a.Test?.title}",${a.score},${a.correct_answers},${a.wrong_answers},${a.total_questions},"${new Date(a.createdAt).toLocaleString()}"`
        ).join("\n");

        const csvContent = "data:text/csv;charset=utf-8," + headers + rows;
        const encodedUri = encodeURI(csvContent);
        const link = document.createElement("a");
        link.setAttribute("href", encodedUri);
        link.setAttribute("download", "student_performance_report.csv");
        document.body.appendChild(link);
        link.click();
        document.body.removeChild(link);
    };

    return (
        <div className="container animate-fade-in">
            <Link to="/dashboard" className="flex items-center gap-2 text-gray mb-4 hover:text-white">
                <ArrowLeft size={18} /> Back to Dashboard
            </Link>

            <div className="flex justify-between items-center mb-4">
                <h1 className="text-2xl font-bold">Student Performance Reports</h1>
                <button onClick={exportCSV} className="btn btn-primary">
                    <Download size={18} /> Export CSV
                </button>
            </div>

            <div className="glass-panel overflow-hidden">
                <table>
                    <thead>
                        <tr>
                            <th>Student</th>
                            <th>Test</th>
                            <th>Score</th>
                            <th>Performance</th>
                            <th>Date</th>
                        </tr>
                    </thead>
                    <tbody>
                        {attempts.length === 0 ? (
                            <tr><td colSpan="5" className="text-center py-8 text-gray">No test attempts recorded yet.</td></tr>
                        ) : (
                            attempts.map(attempt => (
                                <tr key={attempt.id}>
                                    <td>
                                        <div className="font-bold">{attempt.User?.name}</div>
                                        <div className="text-xs text-gray">{attempt.User?.email}</div>
                                    </td>
                                    <td>{attempt.Test?.title}</td>
                                    <td>
                                        <span className="font-bold text-lg text-primary">{attempt.score}</span>
                                        <span className="text-xs text-gray"> / {attempt.total_questions}</span>
                                    </td>
                                    <td>
                                        <div className="flex items-center gap-2 text-xs">
                                            <span className="text-green-400">{attempt.correct_answers} Correct</span>
                                            <span className="text-red-400">{attempt.wrong_answers} Wrong</span>
                                        </div>
                                    </td>
                                    <td className="text-sm">{new Date(attempt.createdAt).toLocaleDateString()}</td>
                                </tr>
                            ))
                        )}
                    </tbody>
                </table>
            </div>
        </div>
    );
};

export default AdminReports;
