#!/bin/bash
echo "========================================"
echo "   Extraction Game - Auto Launcher"
echo "========================================"
echo

# Cherche la meilleure version Python disponible (>= 3.10)
PY=""
for v in 3.14 3.13 3.12 3.11 3.10; do
    if command -v "python$v" &>/dev/null; then
        PY="python$v"
        break
    fi
done

# Fallback : essayer python3 puis python
if [ -z "$PY" ]; then
    if command -v python3 &>/dev/null; then
        PY="python3"
    elif command -v python &>/dev/null; then
        PY="python"
    fi
fi

if [ -z "$PY" ]; then
    echo "ERREUR: Aucun Python trouve. Installe Python 3.10+ avec ton gestionnaire de paquets."
    exit 1
fi

echo "[1/3] Python detecte :"
$PY --version
echo

# Verifie que la version est >= 3.10
$PY -c "import sys; exit(0 if sys.version_info >= (3,10) else 1)" 2>/dev/null
if [ $? -ne 0 ]; then
    echo "ERREUR: Python 3.10 minimum requis. Installe une version plus recente."
    exit 1
fi

echo "[2/3] Installation des dependances..."
$PY -m pip install pygame pillow --quiet
if [ $? -ne 0 ]; then
    echo "ERREUR: Echec de l'installation des dependances."
    exit 1
fi
echo "OK!"
echo

echo "[3/3] Lancement du jeu..."
echo "========================================"
echo
$PY src/main.py
