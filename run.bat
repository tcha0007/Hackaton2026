@echo off
echo ========================================
echo    Extraction Game - Auto Launcher
echo ========================================
echo.

:: Verifie si Python 3.13 est deja installe
echo [1/3] Verification de Python 3.13...
py -3.13 --version >nul 2>&1
if errorlevel 1 (
    echo Python 3.13 non trouve. Installation automatique...
    echo.
    winget install Python.Python.3.13 --accept-source-agreements --accept-package-agreements
    if errorlevel 1 (
        echo ERREUR: Installation echouee. Installez Python 3.13 manuellement depuis python.org
        pause
        exit /b 1
    )
    echo.
    echo Python 3.13 installe. Relancez run.bat pour demarrer le jeu.
    pause
    exit /b 0
)

py -3.13 --version
echo OK!
echo.

echo [2/3] Installation des dependances...
py -3.13 -m pip install --upgrade pip setuptools --quiet
py -3.13 -m pip install pygame pillow --quiet
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
py -3.13 src/main.py
if errorlevel 1 (
    echo.
    echo Le jeu s'est termine avec une erreur.
    pause
    exit /b 1
)
pause
