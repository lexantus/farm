package tiles.model
{
    public class AnimalModel
    {
        public static const COW_TYPE:int = 0;
        public static const CHICKEN_TYPE:int = 1;

        private var _typeAnimal:int;
        private var _resource:ResourceModel;

        public function AnimalModel()
        {
            _resource = new ResourceModel;
        }

        public function get resource():ResourceModel
        {
            return _resource;
        }

        public function set typeAnimal(animalType:int):void
        {
            switch (animalType)
            {
                case COW_TYPE:
                    _typeAnimal = COW_TYPE;
                    _resource.typeRes = ResourceModel.MILK_TYPE;
                    break;

                case CHICKEN_TYPE:
                    _typeAnimal = CHICKEN_TYPE;
                    _resource.typeRes = ResourceModel.EGG_TYPE;
                    break;

                default:
                    _typeAnimal = undefined;
                    _resource.typeRes = undefined;
                    throw new Error("Ooops! There is no that resType. See set type in ResourceModel");
            }
        }

    }
}