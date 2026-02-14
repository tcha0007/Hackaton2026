@echo off
echo ========================================
echo    Extraction Game - Auto Launcher
echo ========================================
echo.

:: Utilise Python 3.10 via le py launcher
set PY=py -3.10

echo [1/3] Verification de Python 3.10...
%PY% --version >nul 2>&1
if errorlevel 1 (
    echo ERREUR: Python 3.10 introuvable. Installe-le depuis python.org
    pause
    exit /b 1
)
%PY% --version
echo OK!
echo.

echo [2/3] Installation des dependances...
%PY% -m pip install pygame pillow --quiet
if errorlevel 1 (
    echo ERREUR: Echec de l'installation des dependances.
    pause
    exit /b 1
)
echo OK!
echo.

echo [3/3] Lancement du jeu...
echo ========================================
echo.
%PY% src/main.py
if errorlevel 1 (
    echo.
    echo Le jeu s'est termine avec une erreur.
    pause
    exit /b 1
)
pause
