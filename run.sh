#!/bin/bash
echo "========================================"
echo "   Extraction Game - Auto Launcher"
echo "========================================"
echo

echo "[1/4] Verification de Python 3.13..."

if ! command -v python3.13 &>/dev/null; then
    echo "Python 3.13 non trouve. Installation automatique..."
    echo

    if command -v apt &>/dev/null; then
        sudo add-apt-repository ppa:deadsnakes/ppa -y
        sudo apt update
        sudo apt install python3.13 python3.13-venv python3.13-dev python3-pip -y
    elif command -v brew &>/dev/null; then
        brew install python@3.13
    elif command -v dnf &>/dev/null; then
        sudo dnf install python3.13 -y
    elif command -v pacman &>/dev/null; then
        sudo pacman -S python --noconfirm
    else
        echo "ERREUR: Impossible d'installer Python automatiquement."
        echo "Installez Python 3.13 manuellement."
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

# Si on est dans WSL, installer les deps SDL pour pygame
echo "[2/4] Installation des dependances systeme..."
if grep -qi microsoft /proc/version 2>/dev/null; then
    echo "WSL detecte."
    sudo apt install -y build-essential libsdl2-dev libsdl2-image-dev libsdl2-mixer-dev libsdl2-ttf-dev libfreetype6-dev python3.13-tk 2>/dev/null
else
    # Linux natif
    if command -v apt &>/dev/null; then
        sudo apt install -y build-essential libsdl2-dev libsdl2-image-dev libsdl2-mixer-dev libsdl2-ttf-dev 2>/dev/null
    fi
fi
echo "OK!"
echo

echo "[3/4] Installation des dependances Python..."
python3.13 -m ensurepip --upgrade 2>/dev/null
python3.13 -m pip install --upgrade pip setuptools --quiet
python3.13 -m pip install pygame pillow --quiet
if [ $? -ne 0 ]; then
    echo "ERREUR: Echec de l'installation des dependances."
    exit 1
fi
echo "OK!"
echo

echo "[4/4] Lancement du jeu..."
echo "========================================"
echo
python3.13 src/main.py
