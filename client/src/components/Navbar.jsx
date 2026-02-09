import React, { useContext } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import { AuthContext } from '../context/AuthContext';
import { LogOut, User, Menu } from 'lucide-react';

const Navbar = () => {
    const { user, logout } = useContext(AuthContext);
    const navigate = useNavigate();

    const handleLogout = () => {
        logout();
        navigate('/');
    };

    if (!user) return null;

    return (
        <nav className="navbar ml-4">
            <div className="nav-brand">
                <span style={{ color: 'var(--primary)' }}>E</span>-Test
            </div>
            <div className="flex items-center gap-4">
                <div className="flex items-center gap-2 text-sm text-gray">
                    <User size={16} />
                    <span>{user.name} ({user.role})</span>
                </div>
                <button onClick={handleLogout} className="btn btn-outline" style={{ padding: '0.4rem 0.8rem', fontSize: '0.8rem' }}>
                    <LogOut size={16} /> Logout
                </button>
            </div>
        </nav>
    );
};

export default Navbar;
