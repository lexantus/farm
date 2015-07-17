package tiles.view
{
    import flash.display.MovieClip;
    import flash.display.Sprite;
    import flash.geom.Point;

    public class TileViewBase extends Sprite
    {
        public static const TILE_WIDTH:Number = 100;
        public static const TILE_HEIGHT:Number = 50;

        public static const NORM_STATE_FRAME:uint = 1;
        public static const OVER_STATE_FRAME:uint = 2;
        public static const FEED_STATE_FRAME:uint = 3;
        public static const PRODUCE_RES_STATE_FRAME:uint = 3;

        public var mcTile:MovieClip;

        public function TileViewBase()
        {

        }

        public function Instantiate(coords:Point, mc_holder:Sprite):void
        {
			if (!mcTile)
			{
				throw new Error("Ooops: Tile view doesn't exist. See TileViewBase.Instantiate");
			}
			if (!mc_holder)
			{
				throw new Error("Ooops: Pass wrong mc_holder. See TileViewBase.Instantiate");
			}

            mcTile.x = coords.x;
            mcTile.y = coords.y
            mcTile.useHandCursor = true;
            mcTile.buttonMode = true;
            mcTile.gotoAndStop(NORM_STATE_FRAME);

            if (mcTile.habitant)
            {
                mcTile.habitant.gotoAndStop(1);
                mcTile.habitant.mouseEnabled = false;
            }

            mc_holder.addChild(mcTile);
        }

    }
}