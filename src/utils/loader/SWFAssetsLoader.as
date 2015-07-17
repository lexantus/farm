/**
 * Created by alex on 12.07.2015.
 */
package utils.loader
{
    import flash.display.Loader;
    import flash.display.LoaderInfo;
    import flash.display.MovieClip;
    import flash.events.Event;
    import flash.events.IOErrorEvent;
    import flash.events.ProgressEvent;
    import flash.net.URLRequest;

    import tiles.model.TileModel;

    import utils.debug.Debug;

    public class SWFAssetsLoader
    {
        private const ASSETS_SWF_DIR:String = "../swf/lib/";

        private var _swfLoadList:Vector.<String>;
        private var _swfClasses:Vector.<Class>;

        private var _urlReq:URLRequest;
        private var _loader:Loader;

        private var _loadingSWFIndex:uint;

        private var _callbackComplete:Function;

        public function SWFAssetsLoader(loader:Loader, callbackComplete:Function)
        {
            Debug.log("CONSTRUCTOR SWFAssetsLoader");

            if (!loader)
            {
                throw new Error("SWFAssetsLoader constructor param loader is " + loader);
            }

            if (!callbackComplete)
            {
                throw new Error("SWFAssetsLoader constructor param callbackComplete is " + callbackComplete);
            }

            _loader = loader;
            _callbackComplete = callbackComplete;
        }

        public function start():void
        {
            addLoaderListeners(_loader.contentLoaderInfo);
            initLoadList();
            loadGameAssetSwf(TileModel.TILE_EMPTY);
        }

        private function initLoadList():void
        {
            _swfLoadList = new Vector.<String>(4, true);
            _swfLoadList[TileModel.TILE_EMPTY] = "empty";
            _swfLoadList[TileModel.TILE_COW] = "cow";
            _swfLoadList[TileModel.TILE_CHICKEN] = "chicken";
            _swfLoadList[TileModel.TILE_WHEAT] = "wheat";

            _swfClasses = new Vector.<Class>(_swfLoadList.length, true);
        }

        private function loadGameAssetSwf(swfIndex:uint):void
        {
            if (!_swfLoadList[swfIndex])
            {
                throw new Error("There is not such element within _swfLoadList at = " + swfIndex);
            }

            if (swfIndex >= _swfLoadList.length)
            {
                throw new Error("Try to load asset beyond _swfLoadList length");
            }

            _loadingSWFIndex = swfIndex;
            _urlReq = new URLRequest(ASSETS_SWF_DIR + _swfLoadList[swfIndex] + ".swf");
            _loader.load(_urlReq);
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

            var ClassDef:Class = e.target.applicationDomain.getDefinition("Tile") as Class;

            _swfClasses[_loadingSWFIndex] = ClassDef;

            if ((_loadingSWFIndex + 1) > (_swfLoadList.length - 1))
            {
                Debug.log("SUCCESSFULLY LOAD ALL ASSETS");
                removeLoaderListeners(e.currentTarget as LoaderInfo);
                TileModel.tileClasses = _swfClasses;
                _swfLoadList = null;
                _swfClasses = null;
                _callbackComplete();
            }
            else
            {
                loadGameAssetSwf(++_loadingSWFIndex);
            }
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
