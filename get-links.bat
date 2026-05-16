@echo off
chcp 65001 >nul
cls

echo =======================================
echo     Starting LifeFlow Application
echo =======================================
echo.

REM Get local IP
for /f "tokens=2 delims=: " %%a in ('ipconfig ^| findstr /R "IPv4 Address"') do (
    set "LOCAL_IP=%%a"
    goto :done
)

:done
echo [1/2] Starting Backend Server on port 5000...
echo.
start "LifeFlow Backend" cmd /k "cd backend && npm start"

echo.
timeout /t 3

echo.
echo =======================================
echo ✅ Server is starting!
echo =======================================
echo.
echo 📎 COPY & PASTE THESE LINKS:
echo.
echo LOCAL:   http://localhost:5000
echo NETWORK: http://%LOCAL_IP%:5000
echo.
echo =======================================
echo.
pause
