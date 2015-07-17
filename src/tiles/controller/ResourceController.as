package tiles.controller
{
    import flash.events.MouseEvent;
    import flash.events.TimerEvent;
    import flash.utils.Timer;

    import tiles.interfaces.IProduceResource;

    import tiles.model.ResourceModel;
    import tiles.view.TileViewBase;

    import utils.debug.Debug;

    public class ResourceController extends TileController implements IProduceResource
    {
        private var _view:TileViewBase;
        private var _model:ResourceModel;

        private var _timer:Timer;

        public function ResourceController(tileView:TileViewBase, resourceType:int)
        {
            Debug.log("ResourceController" + tileView + " " + resourceType);
            super(tileView);

            _view = tileView;
            _model = new ResourceModel();
            _model.typeRes = resourceType;
        }

        override public function activate():void
        {
            _timer = new Timer(_model.time);
            _timer.addEventListener(TimerEvent.TIMER, onTime);
            _timer.start();
        }

        override public function deactivate():void
        {
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
            _view.mcTile.gotoAndStop(2);
            _view.mcTile.addEventListener(MouseEvent.CLICK, onClick);
            _timer.stop();
        }

        public function getProduct():void
        {
            _view.mcTile.gotoAndStop(1);
            _view.mcTile.removeEventListener(MouseEvent.CLICK, onClick);

            if (_model.typeRes == ResourceModel.WHEAT_TYPE)
            {
                var wheatNum:uint = Facade.gi().hudController.model.wheatNum + 1;
                Facade.gi().hudController.SetWheat(wheatNum);
            }

            _timer.start();
        }
    }
}