/**
 * Created by alex on 18.07.2015.
 */
package interfaces
{
    public interface ICustomizeContextMenu
    {
        function initContextMenu():void;
        function removeDefaultItems():void;
        function addCustomMenuItems():void;
    }
}
