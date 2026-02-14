import game
from utils import CELL_SIZE, GRID_SIZE
from tiles.colors import BLACK

class PlayerView:
    """Cette classe est responsable de l'affichage du joueur dans le monde de jeu."""
    def draw(self, screen):
        # DESSIN DU JOUEUR (Toujours au centre de l'écran)
        screen_center = (
            (GRID_SIZE // 2) * CELL_SIZE + CELL_SIZE // 2,
            (GRID_SIZE // 2) * CELL_SIZE + CELL_SIZE // 2
        )
        game.draw.circle(screen, BLACK, screen_center, CELL_SIZE // 3)
