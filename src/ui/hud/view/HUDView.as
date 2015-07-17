package ui.hud.view
{
    import flash.display.MovieClip;
    import flash.display.Sprite;

    public class HUDView extends Sprite
    {

        private var _menu_mc:MovieClip;

        public function HUDView(menu_mc:MovieClip)
        {
            super();
            _menu_mc = menu_mc;
        }

        public function SetEggs(eggsNum:int):void
        {
            _menu_mc["tfEggNum"].text = eggsNum.toString(10);
        }

        public function SetMoney(mny:Number):void
        {
            _menu_mc["tfMoneyNum"].text = mny.toString(10);
        }

        public function SetWheat(whtNum:int):void
        {
            _menu_mc["tfWheatNum"].text = whtNum.toString(10);
        }

        public function SetMilk(mlkNum:int):void
        {
            _menu_mc["tfMilkNum"].text = mlkNum.toString(10);
        }
    }
}