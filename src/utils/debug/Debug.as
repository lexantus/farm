/**
 * Created by alex on 12.07.2015.
 */
package utils.debug
{
    public class Debug
    {
        private static const LOG_TAG_STR:String = "TRACE";
        private static const ERROR_TAG_STR:String = "ERROR"


        public static function log(message:String):void
        {
            trace("[" + LOG_TAG_STR + "]: " + message);
        }

        public static function error(description:String):void
        {
            trace("[" + ERROR_TAG_STR + "]: " + description);
        }
    }
}
