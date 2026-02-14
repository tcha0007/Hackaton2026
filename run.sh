#!/bin/bash
echo "========================================"
echo "   Extraction Game - Auto Launcher"
echo "========================================"
echo

echo "[1/3] Verification de Python 3.13..."

if ! command -v python3.13 &>/dev/null; then
    echo "Python 3.13 non trouve. Installation automatique..."
    echo

    if command -v apt &>/dev/null; then
        # Debian / Ubuntu
        sudo add-apt-repository ppa:deadsnakes/ppa -y
        sudo apt update
        sudo apt install python3.13 python3.13-venv python3-pip -y
    elif command -v brew &>/dev/null; then
        # macOS
        brew install python@3.13
    elif command -v dnf &>/dev/null; then
        # Fedora
        sudo dnf install python3.13 -y
    elif command -v pacman &>/dev/null; then
        # Arch
        sudo pacman -S python --noconfirm
    else
        echo "ERREUR: Impossible d'installer Python automatiquement."
        echo "Installez Python 3.13 manuellement depuis python.org"
        exit 1
    fi
fi

if ! command -v python3.13 &>/dev/null; then
    echo "ERREUR: Python 3.13 introuvable apres installation."
    exit 1
fi

python3.13 --version
echo "OK!"
echo

echo "[2/3] Installation des dependances..."
python3.13 -m pip install --upgrade pip setuptools --quiet
python3.13 -m pip install pygame pillow --quiet
if [ $? -ne 0 ]; then
    echo "ERREUR: Echec de l'installation des dependances."
    exit 1
fi
echo "OK!"
echo

echo "[3/3] Lancement du jeu..."
echo "========================================"
echo
python3.13 src/main.py
