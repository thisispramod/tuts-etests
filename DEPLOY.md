# Deployment Guide

This project is structured as a monorepo with `client` (Frontend) and `server` (Backend). The recommended deployment strategy is:
- **Frontend**: Vercel
- **Backend**: Render

## 1. Environment Configurations

### Local Development

1.  **Backend Setup**:
    -   Navigate to `server/`:
        ```bash
        cd server
        npm install
        ```
    -   Create a `.env` file (copy from `.env.example`):
        ```env
        PORT=5005
        JWT_SECRET=your_dev_secret_key
        DB_HOST=localhost
        DB_USER=root
        DB_PASSWORD=
        DB_NAME=e_test
        CLIENT_URL=http://localhost:5173
        ```
    -   Run the server:
        ```bash
        npm run dev
        ```

2.  **Frontend Setup**:
    -   Navigate to `client/`:
        ```bash
        cd client
        npm install
        ```
    -   Create a `.env.local` file (copy from `.env.example`):
        ```env
        VITE_API_URL=http://localhost:5005/api
        ```
    -   Run the frontend:
        ```bash
        npm run dev
        ```

---

## 2. Backend Deployment (Render)

1.  **Create a Web Service**:
    -   Sign in to Render and create a new Web Service linked to your GitHub repository.
2.  **Configuration**:
    -   **Root Directory**: `server`
    -   **Build Command**: `npm install`
    -   **Start Command**: `npm start`
3.  **Environment Variables**:
    Add these in the Render dashboard:
    -   `NODE_ENV`: `production`
    -   `PORT`: `10000` (or leave blank if Render assigns one)
    -   `JWT_SECRET`: A secure random string.
    -   `DB_HOST`: Your remote MySQL host address.
    -   `DB_USER`: Remote DB username.
    -   `DB_PASSWORD`: Remote DB password.
    -   `DB_NAME`: Remote DB name.
    -   `DB_PORT`: `3306` (default).
    -   `CLIENT_URL`: The URL of your Vercel frontend (e.g., `https://my-app.vercel.app`). **Critical for CORS.**

---

## 3. Frontend Deployment (Vercel)

1.  **Import Project**:
    -   Sign in to Vercel and import your GitHub repository.
2.  **Configuration**:
    -   **Framework Preset**: Vite
    -   **Root Directory**: `client`
    -   **Build Command**: `npm run build`
    -   **Output Directory**: `dist`
3.  **Environment Variables**:
    Add this in the Vercel dashboard:
    -   `VITE_API_URL`: The URL of your Render backend **including /api** (e.g., `https://my-app-backend.onrender.com/api`).
        -   *Note: Ensure you include `/api` at the end because the frontend code appends endpoints like `/register` directly to this base path.*

---

## 4. Database Setup

-   The backend uses Sequelize ORM.
-   On startup, it executes `sequelize.sync({ alter: true })`, which automatically creates or updates tables in your remote database.
-   Ensure your remote MySQL user has permissions to CREATE and ALTER tables.
