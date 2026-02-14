# Hackaton2026

# Guide de Lancement du Projet

Ce document explique comment configurer l'environnement et lancer le jeu **Extraction Game**.

## ⚠️ Prérequis Critique : Python 3.14

Ce projet **nécessite impérativement Python 3.14** ou supérieur.
Les versions antérieures (3.13, 3.12...) ne fonctionneront pas correctement avec certaines fonctionnalités Type Hinting récentes utilisées dans le code.

### Recommandation : Utiliser `pyenv`

Nous recommandons fortement l'utilisation de **pyenv** pour gérer vos versions de Python sans conflit avec le système.

**Installation de Python 3.14 avec pyenv :**

```bash
# 1. Installer la version 3.14 (ou la plus récente disponible)
pyenv install 3.14-dev  # ou 3.14.0 si sortie stable

# 2. Définir cette version pour le dossier courant
pyenv local 3.14-dev
```

## Installation du Projet

Ce projet utilise **Poetry** pour la gestion des dépendances.

1.  **Installer Poetry** (si ce n'est pas déjà fait) :
    Suivez la [documentation officielle](https://python-poetry.org/docs/).

2.  **Configurer l'environnement Poetry :**
    Assurez-vous que Poetry utilise bien votre version 3.14.
    ```bash
    poetry env use 3.14
    ```

3.  **Installer les dépendances :**
    ```bash
    poetry install
    ```

## Compilation des Modules C++

Avant de lancer le jeu, n'oubliez pas de compiler l'extension C++ (voir `USAGE_CPP.md` pour plus de détails) :

```bash
poetry run python build_cpp.py build_ext --inplace
```

## Lancer le Jeu

Une fois tout installé et compilé, lancez le jeu avec :

```bash
poetry run python src/main.py
```

Bon jeu ! 🎮
