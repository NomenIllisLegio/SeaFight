package utils 
{
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.utils.getQualifiedClassName;
	import starling.display.Image;
	import starling.textures.Texture;
	/**
	 * ...
	 * @author NomenIllisLegio
	 */
	public class Parser 
	{
		
		public function Parser() 
		{
			
		}
		
		public static function parse( displayObject : DisplayObject ) : Texture
		{	
			
			var movieName : String = getQualifiedClassName(displayObject);
			
			if(GameConstants.LOG)
				Log.i("Name of parse: " + movieName );
			
			var bm : BitmapData;	
			
			bm = new BitmapData(displayObject.width, displayObject.height, true, 0);
			
			 bm.draw( displayObject );
			 
			if ( bm )
			{
				var texture : Texture = Texture.fromBitmapData(bm, false, false, 1);
				bm.dispose();
				return texture;
			}
			else
			{
				Log.e("Bitmap not create!");
				return null;
			}
		}
		
	}

}