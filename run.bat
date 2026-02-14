@echo off
echo ========================================
echo    Extraction Game - Auto Launcher
echo ========================================
echo.

:: Cherche la meilleure version Python disponible (>= 3.10)
set PY=
for %%v in (3.14 3.13 3.12 3.11 3.10) do (
    if not defined PY (
        py -%%v --version >nul 2>&1
        if not errorlevel 1 (
            set PY=py -%%v
        )
    )
)

:: Fallback : essayer python directement
if not defined PY (
    python --version >nul 2>&1
    if not errorlevel 1 (
        set PY=python
    )
)

if not defined PY (
    echo ERREUR: Aucun Python trouve. Installe Python 3.10+ depuis python.org
    pause
    exit /b 1
)

echo [1/3] Python detecte :
%PY% --version
echo.

:: Verifie que la version est >= 3.10
%PY% -c "import sys; exit(0 if sys.version_info >= (3,10) else 1)" 2>nul
if errorlevel 1 (
    echo ERREUR: Python 3.10 minimum requis. Installe une version plus recente depuis python.org
    pause
    exit /b 1
)

echo [2/3] Installation des dependances...
%PY% -m pip install --upgrade pip setuptools --quiet
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
