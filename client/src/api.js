import axios from 'axios';

const isLocalhost = window.location.hostname === 'localhost' || window.location.hostname === '127.0.0.1';
const productionURL = 'https://tuts-etest.onrender.com/api';

const api = axios.create({
    baseURL: !isLocalhost ? productionURL : (import.meta.env.VITE_API_URL || 'http://localhost:5005/api'),
});

// Auto-add token to requests
api.interceptors.request.use((config) => {
    const token = localStorage.getItem('token');
    if (token) {
        config.headers.Authorization = `Bearer ${token}`;
    }
    return config;
});

export default api;
