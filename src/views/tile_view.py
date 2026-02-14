from abc import ABC, abstractmethod
<<<<<<< Updated upstream
<<<<<<< Updated upstream
import pygame
from tiles.colors import BLACK
=======
import game
>>>>>>> Stashed changes
=======
import game
>>>>>>> Stashed changes

class TileView(ABC):
    """
    Classe de base pour les vues de tiles dans le monde de jeu. 
    Les classes qui héritent de TileView doivent implémenter la méthode draw pour dessiner le tile à l'écran.
    """
    @abstractmethod
<<<<<<< Updated upstream
<<<<<<< Updated upstream
    def draw(self, screen: pygame.Surface, rect: tuple[int, int, int, int]):
        pygame.draw.rect(screen, BLACK, rect)
=======
=======
>>>>>>> Stashed changes
    def draw(self, screen: game.Surface, rect: tuple[int, int, int, int]):
        pass
>>>>>>> Stashed changes
