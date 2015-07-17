package ui.hud.controller
{
    import flash.display.MovieClip;
    import flash.display.Sprite;
    import flash.geom.Point;

    import ui.hud.model.HUDModel;
    import ui.hud.view.HUDView;

    public class HUDController
    {
        private var _model:HUDModel;
        private var _view:HUDView;

        public function HUDController(hudView:MovieClip)
        {
            _model = new HUDModel;
            _view = new HUDView(hudView);
        }

        public function instantiate(coords:Point, mc_holder:Sprite):void
        {
            mc_holder.addChild(_view);
            _view.x = coords.x;
            _view.y = coords.y;
        }

        public function get view():HUDView
        {
            return _view;
        }

        public function get model():HUDModel
        {
            return _model;
        }

        public function reset():void
        {
            SetEggs(0);
            SetMoney(0);
            SetWheat(0);
            SetMilk(0);
        }

        public function SetEggs(eggsNum:int):void
        {
            _model.eggsNum = eggsNum;
            _view.SetEggs(eggsNum);
        }

        public function SetMoney(mny:Number):void
        {
            _model.money = mny;
            _view.SetMoney(mny);
        }

        public function SetWheat(whtNum:int):void
        {
            _model.wheatNum = whtNum;
            _view.SetWheat(whtNum);
        }

        public function SetMilk(mlkNum:int):void
        {
            _model.milkNum = mlkNum;
            _view.SetMilk(mlkNum);
        }
    }
}