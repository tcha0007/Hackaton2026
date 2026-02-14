from abc import ABC, abstractmethod
import game

class TileView(ABC):
    """
    Classe de base pour les vues de tiles dans le monde de jeu.
    Les classes qui héritent de TileView doivent implémenter la méthode draw pour dessiner le tile à l'écran.
    """
    @abstractmethod
    def draw(self, screen: game.Surface, rect: tuple[int, int, int, int]):
        pass
