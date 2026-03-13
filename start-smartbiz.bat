@echo off
title SMARTBIZ - AI Powered Business Management System

echo ===========================================
echo        SMARTBIZ SYSTEM LAUNCHER
echo ===========================================

echo Checking Node.js...
node -v >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    echo Node.js not found. Install from https://nodejs.org
    pause
    exit
)

echo Node.js OK
echo.

echo Starting MySQL service...
net start MySQL >nul 2>&1
net start MySQL80 >nul 2>&1

echo Installing backend dependencies...
cd backend
call npm install

echo Starting backend server...
start cmd /k "npm start"

echo.

echo Installing frontend dependencies...
cd ../frontend
call npm install

echo Starting frontend server...
start cmd /k "npm run dev"

echo.

echo Waiting for frontend to start...
timeout /t 10 >nul

echo Opening SmartBiz in browser...

start http://localhost:3000

pause