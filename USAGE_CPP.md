# Guide d'Utilisation de l'Extension C++

Ce projet inclut un module d'extension C++ (`math_utils`) intégré via **pybind11**. Cela permet d'appeler du code C++ haute performance directement depuis Python.
tsss
## Prérequis

Assurez-vous d'avoir installé les éléments suivants :
1.  **Python 3.14+** 
2.  **Compilateur C++** (clang++ sur macOS, g++ sur Linux/Windows)
3.  **Poetry** (gestionnaire de paquets)

Les dépendances du projet (`pybind11`, `setuptools`) sont déjà gérées par `pyproject.toml`.

## Compilation de l'Extension

L'extension doit être compilée avant de lancer le jeu. Nous utilisons un script utilitaire `build_cpp.py` pour cela.

**Commande :**
```bash
poetry run python build_cpp.py build_ext --inplace
```

**Explication :**
- `poetry run` : Exécute la commande dans l'environnement virtuel du projet.
- `build_cpp.py` : Le script de setup configurant la compilation C++.
- `build_ext` : La commande pour construire l'extension.
- `--inplace` : Génère la bibliothèque compilée (`.so` ou `.pyd`) directement dans le répertoire `src/` (ou répertoire courant), la rendant importable.

**Résultat :**
Après une compilation réussie, vous verrez un fichier tel que `math_utils.cpython-314-darwin.so` (le nom varie selon l'OS/version Python) dans votre répertoire.

## Utilisation de l'Extension en Python

Une fois compilée, vous pouvez l'importer comme n'importe quel module Python standard.

**Exemple (`src/main.py`) :**
```python
import math_utils

result = math_utils.add(10, 20)
print(f"Résultat du C++ : {result}")
```

## Dépannage

- **`ModuleNotFoundError: No module named 'math_utils'`** : 
  - Assurez-vous d'avoir exécuté la commande de build avec succès.
  - Vérifiez que le fichier `.so` / `.pyd` est bien dans `src/` ou dans le PYTHONPATH.
  
- **Erreurs de Compilateur** :
  - Assurez-vous que `clang++` ou `g++` est dans votre PATH.
  - Sur macOS, vous devrez peut-être installer les Outils de Ligne de Commande Xcode (`xcode-select --install`).
