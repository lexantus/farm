package tiles.controller
{
    import flash.display.Sprite;
    import flash.events.MouseEvent;
    import flash.geom.Point;

    import tiles.model.TileModel;
    import tiles.view.TileViewBase;

    public class TileController
    {
        public var view:TileViewBase;
        public var model:TileModel;

        public function TileController(tileView:TileViewBase)
        {
            view = tileView;
            model = new TileModel;
        }

        public function instantiate(coords:Point, mc_holder:Sprite):void
        {
            view.Instantiate(coords, mc_holder);
        }

        public function activate():void
        {
            view.mcTile.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
            view.mcTile.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
        }

        public function deactivate():void
        {
            view.mcTile.removeEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
            view.mcTile.removeEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
        }

        protected function onMouseOut(event:MouseEvent):void
        {
            view.mcTile.gotoAndStop(TileViewBase.NORM_STATE_FRAME);
        }

        protected function onMouseOver(event:MouseEvent):void
        {
            view.mcTile.gotoAndStop(TileViewBase.OVER_STATE_FRAME);
        }

    }
}