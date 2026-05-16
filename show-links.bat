@echo off
chcp 65001 >nul
cls

echo.
echo ╔═══════════════════════════════════════════════════════════════╗
echo ║             LifeFlow - Access Links                            ║
echo ╚═══════════════════════════════════════════════════════════════╝
echo.

REM Get local IP
for /f "tokens=2 delims=: " %%a in ('ipconfig ^| findstr /R "IPv4 Address"') do (
    set "LOCAL_IP=%%a"
    goto :done
)

:done
echo 📱 LOCAL ACCESS (Same Computer):
echo.
echo   http://localhost:5000
echo.
echo.
echo 🌐 NETWORK ACCESS (Other Devices):
echo.
echo   http://%LOCAL_IP%:5000
echo.
echo.
echo ═══════════════════════════════════════════════════════════════
echo API Endpoints:
echo ═══════════════════════════════════════════════════════════════
echo.
echo 🔗 Health Check:
echo   http://localhost:5000/api/health
echo.
echo 🔐 Authentication API:
echo   http://localhost:5000/api/auth
echo.
echo 👥 Users API:
echo   http://localhost:5000/api/users
echo.
echo 🩸 Blood Requests API:
echo   http://localhost:5000/api/blood-requests
echo.
echo ═══════════════════════════════════════════════════════════════
pause
