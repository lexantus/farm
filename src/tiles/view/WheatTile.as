package tiles.view
{
    import tiles.model.TileModel;

    public class WheatTile extends TileViewBase
    {
        public function WheatTile()
        {
            super();
            mcTile = new TileModel.tileClasses[TileModel.TILE_WHEAT];
        }
    }
}