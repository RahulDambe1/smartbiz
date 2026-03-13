# SMARTBIZ – AI Powered Business Management System

SMARTBIZ is a full‑stack business management platform designed as a **major‑project–grade** system.  
It combines modern dashboards, CA‑style insights, compliance tracking and invoicing into a single, production‑ready web app.

## 1. Tech stack

- **Frontend**: React 18, Vite, React Router, Tailwind CSS, Framer Motion, `react-chartjs-2` / Chart.js  
- **Backend**: Node.js (ESM), Express, MySQL, JWT authentication  
- **PDF & reporting**: `pdfkit` for branded invoices, `json2csv` for exports

## 2. Features

- **Authentication & multi‑tenant setup**
  - Email/password registration and login
  - JWT‑based auth, protected API routes and activity logging

- **Smart dashboard**
  - KPI cards for today’s **sales**, **profit**, **pending payments** and **low stock**
  - Interactive **sales trend**, **profit trend** and **expense breakdown** charts
  - Recent invoices, low‑stock alerts, and top‑selling products

- **Invoicing**
  - Create invoices linked to customers and products
  - Line‑item support (quantity, price, totals with GST)
  - **Professional PDF invoices** generated via `/api/invoices/:id/pdf`

- **Inventory & customers**
  - CRUD for customers and products
  - Re‑order level alerts and low‑stock panel on the dashboard

- **Expenses & analytics**
  - Record expenses with category tagging
  - Expense breakdown doughnut chart
  - Sales, expense, profit and customer reports with CSV/“Excel” (JSON) export

- **Compliance & admin**
  - Compliance summary endpoint
  - Admin‑only user management and activity logs

## 3. Project structure

```text
smart-vedu/
  backend/
    src/
      server.js              # Express app entry
      config/db.js           # MySQL connection pool
      routes/index.js        # All API routes
      controllers/           # Feature‑wise controllers
      middleware/            # Auth + activity logger
      models/                # User model
  frontend/
    src/
      main.jsx               # React/Vite entry
      App.jsx                # Routing + shell
      pages/                 # Dashboard, Invoices, etc.
      components/            # Layout + charts
      context/AuthContext.jsx
    index.html, index.css, tailwind.config.cjs
```

## 4. Getting started (developer)

### Prerequisites

- Node.js 18+  
- MySQL 8+  

### Backend

```bash
cd backend
npm install

# copy your environment variables
cp .env.example .env   # or create .env manually on Windows

npm start              # runs on http://localhost:5000
```

The backend expects a MySQL database and tables for `users`, `customers`, `products`, `invoices`, `invoice_items`, `expenses`, `payments`, `alerts`.  
Update the credentials and database name in `src/config/db.js` / `.env` as per your setup.

### Frontend

```bash
cd frontend
npm install
npm run dev            # Vite dev server (usually http://localhost:5173)
```

Update `frontend/src/services/api.js` if your backend runs on a different host/port.

## 5. Production build

```bash
# frontend
cd frontend
npm run build          # outputs static assets in dist/

# backend can be run with any process manager (PM2, Docker, etc.)
```

## 6. How to present this as a major project

- **Architecture**: Explain the separation of concerns between frontend (React SPA), backend (REST APIs), and database (MySQL).  
- **Security**: Highlight JWT auth, protected routes, and role‑based admin endpoints.  
- **Data visualisation**: Show the dashboard charts and discuss how queries in `dashboardController.js` power them.  
- **Documented code**: Controllers are organised per feature (invoices, expenses, reports, admin, CA bot, compliance) with clear responsibilities.  
- **Demonstration flow**:
  1. Register & log in
  2. Create customers, products and invoices
  3. Show the live dashboard & charts updating
  4. Generate a **PDF invoice** and export a report
  5. Walk through compliance/admin panels and smart alerts

This README is intentionally detailed so it can be used directly in a viva / final report to demonstrate that the project is thoughtfully designed and ready to deploy.

