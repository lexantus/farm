/**
 * Created by alex on 12.07.2015.
 */
package
{
    import flash.display.Loader;
    import flash.display.LoaderInfo;
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.IOErrorEvent;
    import flash.events.ProgressEvent;
    import flash.net.URLRequest;
    import flash.system.Security;

    import utils.debug.Debug;
    import utils.loader.SWFAssetsLoader;

    [SWF(width="1280", height="800", frameRate="24", backgroundColor="#333333")]
    public class Preloader extends Sprite
    {
        private const GAME_SWF_NAME:String = "farm.swf";

        private var _swfAssetsLoader:SWFAssetsLoader;

        private var _urlReq:URLRequest;
        private var _loader:Loader;

        public function Preloader()
        {
            Security.allowDomain("*");

            _loader = new Loader();
            _swfAssetsLoader = new SWFAssetsLoader(_loader, completeLoadAllGameAssetsSwf);
            _swfAssetsLoader.start();
        }

        private function completeLoadAllGameAssetsSwf():void
        {
            Debug.log("completeLoadAllGameAssetsSwf");
            loadGameSwf();
            _swfAssetsLoader = null;
        }

        private function loadGameSwf():void
        {
            addLoaderListeners(_loader.contentLoaderInfo);
            _urlReq = new URLRequest(GAME_SWF_NAME);
            _loader.load(_urlReq);
            addChild(_loader);
        }

        private function addLoaderListeners(contentLoaderInfo:LoaderInfo):void
        {
            contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
            contentLoaderInfo.addEventListener(Event.COMPLETE, completeHandler);
            contentLoaderInfo.addEventListener(Event.INIT, initHandler);
            contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, progressHandler);
        }

        private function removeLoaderListeners(contentLoaderInfo:LoaderInfo):void
        {
            contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
            contentLoaderInfo.removeEventListener(Event.COMPLETE, completeHandler);
            contentLoaderInfo.removeEventListener(Event.INIT, initHandler);
            contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS, progressHandler);
        }

        private function ioErrorHandler(e:IOErrorEvent):void
        {
            Debug.error("ioErrorHandler " + e.toString());
        }

        private function completeHandler(e:Event):void
        {
            Debug.log("completeHandler " + e.toString());
            removeLoaderListeners(e.currentTarget as LoaderInfo);
        }

        private function initHandler(e:Event):void
        {
            Debug.log("initHandler " + e.toString());
        }

        private function progressHandler(e:ProgressEvent):void
        {
            Debug.log("progressHandler " + (e.bytesLoaded / e.bytesTotal * 100));
        }

    }
}
