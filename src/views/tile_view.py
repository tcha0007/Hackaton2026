from abc import ABC, abstractmethod
import pygame
from tiles.colors import BLACK

class TileView(ABC):
    """
    Classe de base pour les vues de tiles dans le monde de jeu. 
    Les classes qui héritent de TileView doivent implémenter la méthode draw pour dessiner le tile à l'écran.
    """
    @abstractmethod
    def draw(self, screen: pygame.Surface, rect: tuple[int, int, int, int]):
        pygame.draw.rect(screen, BLACK, rect)
