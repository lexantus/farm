package fields.controller
{
    import fields.model.FieldModel;
    import fields.view.FieldView;

    import flash.display.Sprite;
    import flash.geom.Point;

    import tiles.controller.AnimalController;
    import tiles.controller.ResourceController;
    import tiles.controller.TileController;
    import tiles.model.AnimalModel;
    import tiles.model.ResourceModel;
    import tiles.model.TileModel;
    import tiles.view.ChickenTile;
    import tiles.view.CowTile;
    import tiles.view.EmptyTile;
    import tiles.view.TileViewBase;
    import tiles.view.WheatTile;

    public class FieldController
    {
        private var _tileControllers:Vector.<TileController>;

        private var _view:FieldView;
        private var _model:FieldModel;

        public function FieldController()
        {
            _view = new FieldView;
            _model = new FieldModel;
            _tileControllers = new Vector.<TileController>;
        }

        public function get model():FieldModel
        {
            return _model;
        }

        public function get view():FieldView
        {
            return _view;
        }

        public function instantiate(coords:Point, mc_holder:Sprite):void
        {
            mc_holder.addChild(view);
            view.x = coords.x;
            view.y = coords.y;

            var i:int;
            var j:int;

            for (i = 0; i < FieldModel.field.length; i++)
            {
                for (j = 0; j < FieldModel.field[i].length; j++)
                {
                    var tileType:uint = FieldModel.field[i][j];

                    var tileController:TileController = GetTileController(GetTile(tileType), tileType);
                    tileController.activate();

                    _tileControllers.push(tileController);

                    if ((i % 2) == 0)
                    {
                        coords.x = j * TileViewBase.TILE_WIDTH + TileViewBase.TILE_WIDTH / 2;
                    }
                    else
                    {
                        coords.x = j * TileViewBase.TILE_WIDTH;
                    }

                    coords.y = i * TileViewBase.TILE_HEIGHT / 2;


                    _tileControllers[_tileControllers.length - 1].instantiate(coords, mc_holder);

                }
            }
        }

        private function GetTile(tileType:uint):TileViewBase
        {
            switch (tileType)
            {
                case TileModel.TILE_CHICKEN:
                    return new ChickenTile();
                case TileModel.TILE_COW:
                    return new CowTile();
                case TileModel.TILE_WHEAT:
                    return new WheatTile();
                case TileModel.TILE_EMPTY:
                    return new EmptyTile();
                default:
                    throw new Error("GetTile return null");
                    return null;
            }
        }

        private function GetTileController(tileView:TileViewBase, tileType:uint):TileController
        {
            switch (tileType)
            {
                case TileModel.TILE_CHICKEN:
                    return new AnimalController(tileView, AnimalModel.CHICKEN_TYPE);
                case TileModel.TILE_COW:
                    return new AnimalController(tileView, AnimalModel.COW_TYPE);
                case TileModel.TILE_WHEAT:
                    return new ResourceController(tileView, ResourceModel.WHEAT_TYPE);
                case TileModel.TILE_EMPTY:
                    return new TileController(tileView);
                default:
                    throw new Error("GetTileController return null");
                    return null;
            }
        }
    }
}