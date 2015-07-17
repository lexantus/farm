package tiles.controller
{
    import flash.events.MouseEvent;
    import flash.events.TimerEvent;
    import flash.utils.Timer;

    import tiles.interfaces.IProduceResource;
    import tiles.model.AnimalModel;
    import tiles.model.ResourceModel;
    import tiles.view.TileViewBase;

    public class AnimalController extends TileController implements IProduceResource
    {
        private var _view:TileViewBase;
        private var _model:AnimalModel;

        private var _isCanProduce:Boolean = true; // TODO
        private var _timer:Timer;

        public function AnimalController(tileView:TileViewBase, animalType:int)
        {
            super(tileView);

            _view = tileView;
            _model = new AnimalModel;
            _model.typeAnimal = animalType;
        }

        override public function activate():void
        {
            super.activate();
            _timer = new Timer(_model.resource.time);
            _timer.addEventListener(TimerEvent.TIMER, onTime);
            _timer.start();
        }

        override public function deactivate():void
        {
            //super.deactivate();
            _timer.removeEventListener(TimerEvent.TIMER, onTime);
            _timer.stop();
            _timer = null;
        }

        public function onTime(event:TimerEvent):void
        {
            produce();
        }

        public function onClick(e:MouseEvent):void
        {
            getProduct();
        }

        public function produce():void
        {
            if (!_view.mcTile["habitant"])
            {
                throw new Error("_view.mcTile['habitant'] = " + _view.mcTile["habitant"]);
            }
            _view.mcTile["habitant"].gotoAndStop(2);
            _view.mcTile.addEventListener(MouseEvent.CLICK, onClick);
            _timer.stop();
        }

        public function getProduct():void
        {
            if (!_view.mcTile["habitant"])
            {
                throw new Error("_view.mcTile['habitant'] = " + _view.mcTile["habitant"]);
            }
            _view.mcTile["habitant"].gotoAndStop(1);
            _view.mcTile.removeEventListener(MouseEvent.CLICK, onClick);

            if (_model.resource.typeRes == ResourceModel.EGG_TYPE)
            {
                var eggsNum:uint = Facade.gi().hudController.model.eggsNum + 1;
                Facade.gi().hudController.SetEggs(eggsNum);
            }
            else if (_model.resource.typeRes == ResourceModel.MILK_TYPE)
            {
                var milkNum:uint = Facade.gi().hudController.model.milkNum + 1;
                Facade.gi().hudController.SetMilk(milkNum);
            }

            _timer.start();
        }
    }
}