import React, { useContext } from 'react';
import { AuthContext } from '../context/AuthContext';
import AdminDashboard from './admin/AdminDashboard';
import StudentDashboard from './student/StudentDashboard';

const Dashboard = () => {
    const { user } = useContext(AuthContext);

    if (!user) return <p>Loading...</p>;

    return user.role === 'admin' ? <AdminDashboard /> : <StudentDashboard />;
};

export default Dashboard;
