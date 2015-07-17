/**
 * Created by alex on 13.07.2015.
 */
package
{
    import fields.controller.FieldController;

    import flash.display.DisplayObjectContainer;
    import flash.display.MovieClip;
    import flash.display.Sprite;
    import flash.display.StageAlign;
    import flash.display.StageScaleMode;
    import flash.events.Event;
    import flash.geom.Point;
    import flash.system.Security;

    import ui.hud.controller.HUDController;

    import utils.debug.Debug;

    [SWF(width="1280", height="800", frameRate="24", backgroundColor="#333333")]
    public class Game extends Sprite
    {
        private var mc_holders:Vector.<Sprite>;
        private var mc_field:Sprite;
        private var mc_hud:Sprite;

        private var _fieldController:FieldController;
        private var _hudController:HUDController;

        public var menu_mc:MovieClip;

        public function Game()
        {
            Security.allowDomain("*");
            addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
        }

        protected function onAddedToStage(event:Event):void
        {
            removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
            configStage();
            startGame();
        }

        private function configStage():void
        {
            if (!stage)
            {
                throw new Error("Ooops! There is no stage. See farm.ConfigStage");
            }

            stage.scaleMode = StageScaleMode.NO_SCALE;
            stage.align = StageAlign.TOP_LEFT;
        }

        private function startGame():void
        {
            initMcHolders();
            addHoldersToScene(this);

            _fieldController = new FieldController;

            _fieldController.instantiate(new Point(50, 150), mc_field)

            _hudController = new HUDController(this.menu_mc);
            _hudController.instantiate(new Point(0, 0), mc_hud);
            _hudController.reset();

            Facade.gi().hudController = _hudController;

            mc_field.scaleX = mc_field.scaleY = 0.75;
            mc_field.x = stage.stageWidth/2 - mc_field.width/2;
            mc_field.y = 50;
        }

        private function initMcHolders():void
        {
            mc_holders = new Vector.<Sprite>(2, true);

            mc_field = new Sprite();
            mc_hud = new Sprite();

            mc_holders[0] = mc_field;
            mc_holders[1] = mc_hud;
        }

        private function addHoldersToScene(sceneDO:DisplayObjectContainer):void
        {
            if (!sceneDO)
            {
                throw new Error("Oops! There is no sceneDO. See AddHoldersToScene");
            }

            for (var i:int = 0; i < mc_holders.length; i++)
            {
                sceneDO.addChild(mc_holders[i]);
            }
        }
    }
}
