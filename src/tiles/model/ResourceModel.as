package tiles.model
{
    public class ResourceModel
    {
        public static const EGG_TYPE:int = 0;
        public static const MILK_TYPE:int = 1;
        public static const WHEAT_TYPE:int = 2;

        private var _time:Number;
        private var _price:Number;
        private var _typeRes:int;

        public function ResourceModel()
        {
        }

        public function get price():Number
        {
            return _price;
        }

        public function get time():Number
        {
            return _time;
        }

        public function set typeRes(resType:int):void
        {
            switch (resType)
            {
                case EGG_TYPE:
                    _typeRes = EGG_TYPE;
                    _time = 5000;
                    _price = 100;
                    break;

                case MILK_TYPE:
                    _typeRes = MILK_TYPE;
                    _time = 10000;
                    _price = 350;
                    break;

                case WHEAT_TYPE:
                    _typeRes = WHEAT_TYPE;
                    _time = 15000;
                    _price = 40;
                    break;

                default:
                    _typeRes = undefined;
                    throw new Error("Ooops! There is no that resType. See set type in ResourceModel");
            }
        }

        public function get typeRes():int
        {
            return _typeRes;
        }
    }
}