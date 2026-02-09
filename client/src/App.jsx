import React from 'react';
import { Routes, Route, Navigate } from 'react-router-dom';
import Login from './pages/Login';
import Register from './pages/Register';
import Dashboard from './pages/Dashboard';
import ManageTest from './pages/admin/ManageTest';
import TestAnalytics from './pages/admin/TestAnalytics';
import ManageClasses from './pages/admin/ManageClasses';
import ManageStudents from './pages/admin/ManageStudents';
import AdminReports from './pages/admin/Reports';
import MistakeAnalytics from './pages/admin/MistakeAnalytics';
import TakeTest from './pages/student/TakeTest';
import ResultReview from './pages/student/ResultReview';
import StudentReports from './pages/student/StudentReports';
import MistakeBook from './pages/student/MistakeBook';
import Navbar from './components/Navbar';
import { AuthProvider } from './context/AuthContext';

function App() {
  return (
    <AuthProvider>
      <div className="min-h-screen bg-slate-900 text-slate-50">
        <Navbar />
        <Routes>
          <Route path="/" element={<Navigate to="/login" />} />
          <Route path="/login" element={<Login />} />
          <Route path="/register" element={<Register />} />
          <Route path="/dashboard" element={<Dashboard />} />

          {/* Admin Routes */}
          <Route path="/admin/test/:id" element={<ManageTest />} />
          <Route path="/admin/test/:id/analytics" element={<TestAnalytics />} />
          <Route path="/admin/classes" element={<ManageClasses />} />
          <Route path="/admin/students" element={<ManageStudents />} />
          <Route path="/admin/reports" element={<AdminReports />} />
          <Route path="/admin/mistakes" element={<MistakeAnalytics />} />

          {/* Student Routes */}
          <Route path="/student/test/:id" element={<TakeTest />} />
          <Route path="/student/result/:id" element={<ResultReview />} />
          <Route path="/student/reports" element={<StudentReports />} />
          <Route path="/student/mistakes" element={<MistakeBook />} />

          {/* Fallback */}
          <Route path="*" element={<Navigate to="/dashboard" />} />
        </Routes>
      </div>
    </AuthProvider>
  );
}

export default App;
