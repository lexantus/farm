package tiles.view
{
    import tiles.model.TileModel;

    public class EmptyTile extends TileViewBase
    {
        public function EmptyTile()
        {
            super();
            mcTile = new TileModel.tileClasses[TileModel.TILE_EMPTY];
        }
    }
}