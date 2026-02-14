import game
from views.tile_view import TileView
from tiles.colors import YELLOW

class DesertTileView(TileView):
    """Cette classe est responsable de l'affichage des tiles de désert dans le monde de jeu."""
    def draw(self, screen: game.Surface, rect: tuple[int, int, int, int]):
        game.draw.rect(screen, YELLOW, rect)
