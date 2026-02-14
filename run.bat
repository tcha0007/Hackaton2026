@echo off
echo ========================================
echo    Extraction Game - Auto Launcher
echo ========================================
echo.

:: Verifie que WSL est installe
wsl --status >nul 2>&1
if errorlevel 1 (
    echo WSL non installe. Installation...
    echo Lancez "wsl --install" dans un terminal administrateur, redemarrez, puis relancez ce script.
    pause
    exit /b 1
)

:: Lance le script Linux dans WSL
echo Lancement via WSL...
echo.
wsl bash -c "cd \"$(wslpath '%~dp0')\" && sed -i 's/\r$//' run.sh && chmod +x run.sh && ./run.sh"
pause
