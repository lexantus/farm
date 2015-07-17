package tiles.view
{
    import tiles.model.TileModel;

    public class ChickenTile extends TileViewBase
    {
        public function ChickenTile()
        {
            super();
            mcTile = new TileModel.tileClasses[TileModel.TILE_CHICKEN];
        }
    }
}