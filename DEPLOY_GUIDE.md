# Deployment Guide (Vercel + Render)

This guide details how to deploy your application using **Vercel for the Frontend** and **Render for the Backend**.

We have updated the backend to support **PostgreSQL** (native on Render) while keeping MySQL support for your local development.

## Equivalencies

- **Frontend**: `client` folder -> Deployed to Vercel
- **Backend**: `server` folder -> Deployed to Render
- **Database**: 
    - **Local**: MySQL (as you have it set up)
    - **Production (Render)**: PostgreSQL (Managed by Render, free tier available)

---

## 1. Push to GitHub

Ensure your project is pushed to a GitHub repository.

```bash
git add .
git commit -m "Prepared for deployment"
git push origin main
```

---

## 2. Backend Deployment (Render)

### Step 2.1: Create Database
1.  Go to [Render Dashboard](https://dashboard.render.com/).
2.  Click **New +** -> **PostgreSQL**.
3.  Name it (e.g., `e-test-db`).
4.  Choose your region (e.g., Singapore, Frankfurt).
5.  Select **Free Plan**.
6.  Click **Create Database**.
7.  Wait for it to be created. You don't need to copy credentials yet if you link it in the next step.

### Step 2.2: Create Web Service
1.  Click **New +** -> **Web Service**.
2.  Connect your GitHub repository.
3.  **Name**: `e-test-api` (or similar).
4.  **Region**: Same as your database.
5.  **Branch**: `main`.
6.  **Root Directory**: `server` (Important!).
7.  **Build Command**: `npm install`
8.  **Start Command**: `node index.js`
9.  **Plan**: Free.
10. **Environment Variables**:
    *   Scroll down to "Environment Variables".
    *   Add `JWT_SECRET`: (Enter a random secret string).
    *   Add `NODE_ENV`: `production`
    *   **DATABASE_URL**:  You can manually add the "Internal Database URL" from your Postgres dashboard, OR...
    *   **Better**: Click **"Connect a Database"** (if available in the UI setup) or go to the Dashboard > Your Web Service > Environment > **Link a Database** and select the Postgres DB you just created. This automatically sets the `DATABASE_URL` for you.
11. Click **Create Web Service**.

*Note: The first build might take a few minutes. It will install dependencies and start. You might see "Connected to database successfully" in the logs.*

---

## 3. Frontend Deployment (Vercel)

1.  Go to [Vercel Dashboard](https://vercel.com/dashboard).
2.  Click **Add New...** -> **Project**.
3.  Import your GitHub repository.
4.  **Framework Preset**: Vite (should be auto-detected).
5.  **Root Directory**: Click "Edit" and select `client`.
6.  **Build Command**: `npm run build` (default).
7.  **Environment Variables**:
    *   Expand `Environment Variables`.
    *   Key: `VITE_API_URL`
    *   Value: Your **Render Backend URL** + `/api` configured in Step 2.
        *   Example: `https://e-test-api.onrender.com/api`
        *   *Review*: Check your Render dashboard for the URL (e.g., ending in `.onrender.com`).
8.  Click **Deploy**.

---

## 4. Final Configuration

1.  Once Vercel deploys, copy your new **Frontend URL** (e.g., `https://e-test-frontend.vercel.app`).
2.  Go back to **Render Dashboard** -> Your Web Service -> **Environment**.
3.  Add/Edit the variable:
    *   `CLIENT_URL`: `https://e-test-frontend.vercel.app` (Your actual Vercel URL).
    *   *Note: This enables CORS so your frontend can talk to the backend.*
4.  **Save Changes** in Render (this will trigger a restart/redeploy of the backend).

---

## Troubleshooting

-   **Database Errors**: Check Render logs. If you see connection errors, ensure `DATABASE_URL` is correct (starts with `postgres://...`).
-   **CORS Errors**: Ensure `CLIENT_URL` in Render matches your Vercel URL exactly (no trailing slash usually, or check browser console).
-   **White Screen on Frontend**: Check browser console (F12). If you see 404s for API calls, verify `VITE_API_URL` in Vercel settings (it must end with `/api` unless your endpoints don't use it, but your code uses `/api/login` etc.).
