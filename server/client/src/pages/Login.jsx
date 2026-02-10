import React, { useState, useContext } from 'react';
import { AuthContext } from '../context/AuthContext';
import { useNavigate, Link } from 'react-router-dom';

const Login = () => {
    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');
    const [error, setError] = useState('');
    const { login } = useContext(AuthContext);
    const navigate = useNavigate();

    const handleSubmit = async (e) => {
        e.preventDefault();
        const res = await login(email, password);
        if (res.success) {
            // Redirect based on role is handled in App or here
            // For now, we will inspect the user object in context, but simpler to just navigate to /dashboard
            // and let the dashboard route handle redirection.
            // Wait, we need to know the role immediately or just go to a common dashboard route.
            // Let's go to /dashboard.
            navigate('/dashboard');
        } else {
            setError(res.message);
        }
    };

    return (
        <div className="flex items-center justify-center min-h-screen">
            <div className="glass-panel p-8 w-full max-w-md animate-fade-in" style={{ padding: '3rem' }}>
                <h1 className="text-3xl font-bold text-center mb-2">Welcome Back</h1>
                <p className="text-center text-gray mb-8">Sign in to continue</p>

                {error && <div className="p-3 mb-4 bg-red-500/20 text-red-200 rounded text-sm text-center">{error}</div>}

                <form onSubmit={handleSubmit}>
                    <div className="mb-4">
                        <label className="block text-sm text-gray mb-1">Email Address</label>
                        <input
                            type="email"
                            className="input-field"
                            value={email}
                            onChange={(e) => setEmail(e.target.value)}
                            placeholder="admin@test.com"
                            required
                        />
                    </div>

                    <div className="mb-6">
                        <label className="block text-sm text-gray mb-1">Password</label>
                        <input
                            type="password"
                            className="input-field"
                            value={password}
                            onChange={(e) => setPassword(e.target.value)}
                            placeholder="••••••••"
                            required
                        />
                    </div>

                    <button type="submit" className="btn btn-primary w-full">
                        Login
                    </button>
                </form>

                <div className="mt-4 text-center">
                    <Link to="/register" className="text-sm text-primary hover:underline">New Student? Register here</Link>
                </div>
                <div className="mt-4 text-center text-sm text-gray">
                    <p>Demo Admin: admin@test.com / admin123</p>
                    <p>Demo Student: pramod@test.com / student123</p>
                </div>
            </div>
        </div>
    );
};

export default Login;
