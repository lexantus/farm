package ui.hud.model
{
    public class HUDModel
    {
        private var _money:Number;
        private var _wheatNum:int;
        private var _milkNum:int;
        private var _eggsNum:int;

        public function HUDModel()
        {
        }

        public function get eggsNum():int
        {
            return _eggsNum;
        }

        public function set eggsNum(value:int):void
        {
            _eggsNum = value;
        }

        public function get milkNum():int
        {
            return _milkNum;
        }

        public function set milkNum(value:int):void
        {
            _milkNum = value;
        }

        public function get wheatNum():int
        {
            return _wheatNum;
        }

        public function set wheatNum(value:int):void
        {
            _wheatNum = value;
        }

        public function get money():Number
        {
            return _money;
        }

        public function set money(value:Number):void
        {
            _money = value;
        }
    }
}