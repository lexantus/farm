package tiles.view
{
    import tiles.model.TileModel;

    public class CowTile extends TileViewBase
    {
        public function CowTile()
        {
            super();
            mcTile = new TileModel.tileClasses[TileModel.TILE_COW];
        }
    }
}