package fields.model
{
    import utils.debug.Debug;

    public class FieldModel
    {

        [Embed(source="../../../config/config.xml", mimeType="application/octet-stream")]
        public static const FieldConfig:Class;

        private static var _field:Vector.<Vector.<uint>>;

        public function FieldModel()
        {
        }

        public static function get field():Vector.<Vector.<uint>>
        {
            if (!_field)
            {
                _field = new Vector.<Vector.<uint>>;

                var xmlConfigFile:XMLList = new XMLList(new FieldConfig);

                var i:int;
                var j:int;
                var contentStr:String;

                for (i = 0; i < xmlConfigFile.row.length(); i++)
                {
                    contentStr = xmlConfigFile.row[i].@content;
                    _field.push(new Vector.<uint>);

                    for (j = 0; j < contentStr.length; j++)
                    {
                        _field[i].push(uint(contentStr.charAt(j)));
                    }
                }

                Debug.log(_field.toString());
            }

            return _field;
        }
    }
}