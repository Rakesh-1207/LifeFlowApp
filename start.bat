@echo off
echo =======================================
echo     Starting LifeFlow Application
echo =======================================

echo [1/2] Starting Backend Server on port 5000...
start "LifeFlow Backend" cmd /k "cd backend && npm install && npm start"

echo [2/2] Starting Frontend Server...
start "LifeFlow Frontend" cmd /k "cd frontend && npx serve ."

echo =======================================
echo Both servers have been launched in separate windows!
echo Please wait a few seconds and check the new windows for any errors.
echo The frontend URL will be displayed in its window (usually http://localhost:3000).
echo =======================================
