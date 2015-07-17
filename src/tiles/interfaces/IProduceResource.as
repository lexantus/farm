/**
 * Created by alex on 13.07.2015.
 */
package tiles.interfaces
{
    import flash.events.MouseEvent;
    import flash.events.TimerEvent;

    public interface IProduceResource
    {
        function produce():void;

        function getProduct():void;

        function onClick(e:MouseEvent):void;

        function onTime(e:TimerEvent):void;
    }
}
