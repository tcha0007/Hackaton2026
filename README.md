# Hackaton2026 - Extraction Game

## Prerequis

- **Python 3.10** ou superieur
- C'est tout.

Pas besoin de Poetry, pyenv, ni de compiler du C++.

## Lancement rapide

### Windows

Double-cliquez sur **`run.bat`** a la racine du projet.

Ou en terminal :
```cmd
run.bat
```

### Linux / Mac

```bash
chmod +x run.sh
./run.sh
```

Les scripts detectent automatiquement votre version de Python, installent les dependances (`pygame`, `pillow`) et lancent le jeu.

## Lancement manuel

Si vous preferez faire ca a la main :

```bash
pip install pygame pillow
python src/main.py
```

> Sur Linux, utilisez `python3` et `pip3` si `python` pointe vers Python 2.

## Structure du projet

```
src/
  main.py          <- Point d'entree du jeu
  game.py          <- Moteur de jeu (logique)
  view.py          <- Affichage graphique (Pygame)
  controller.py    <- Gestion des inputs clavier
  eventmanager.py  <- Systeme d'evenements
  utils.py         <- Utilitaires (Position, constantes)
  entities/        <- Joueur et entites
  grid/            <- Grille du monde (generation infinie)
  tiles/           <- Types de tuiles (desert, eau...)
  views/           <- Sous-vues (rendu des tuiles, joueur)
  actions/         <- Actions des entites
```

## Depannage

| Probleme | Solution |
|----------|----------|
| `python` n'est pas reconnu | Reinstallez Python en cochant **"Add to PATH"** |
| `No module named 'pygame'` | Lancez `pip install pygame pillow` |
| La fenetre s'ouvre et se ferme | Comportement attendu - lisez le code ;) |
hhhhhhhhh