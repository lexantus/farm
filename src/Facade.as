/**
 * Created by alex on 13.07.2015.
 */
package
{
    import ui.hud.controller.HUDController;

    public class Facade
    {
        private static var _instance:Facade;

        public var hudController:HUDController;

        public static function gi():Facade
        {
            if (!_instance)
            {
                _instance = new Facade(new Singleton());
            }

            return _instance;
        }

        public function Facade(singletonEnforcer:Singleton)
        {

        }
    }
}

class Singleton{}
