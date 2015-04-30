package Filed 
{
	import Filed.interfaces.ICellView;
	import SeaFight.ui.HitCell;
	import SeaFight.ui.QuadCell;
	import SeaFight.ui.QuadMiss;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.textures.Texture;
	import utils.Parser;
	
	/**
	 * ...
	 * @author NomenIllisLegio
	 */
	public class GroundCellView extends Sprite implements ICellView
	{
		private var _texture : Texture;
		private var _image	 : Image;
		private var _type 	 : int = 1;
		
		public function GroundCellView() 
		{
			super();
			loadImage();
		}

		/* INTERFACE Filed.interfaces.ICellView */
		
		public function loadImage():void 
		{	
			switch(_type)
			{
				case 1:
					_texture = Parser.parse( new QuadCell() );
					break;
				case 2:
					_texture = Parser.parse( new HitCell() );
					break;
				case 3:
					_texture = Parser.parse( new QuadMiss() );
					break;
				default:
					Log.e("GroundCellView : loadImage : Error - undefined type");
			}
			
			addImage();
		}
		
		public function addImage():void 
		{
			_image = new Image(_texture);
			this.addChild(_image);
		}
		
		public function switcher( type : int ):void 
		{	
			Log.i("Switch GroundCellView: type "+type);
			destruct();
			_type = type;
			loadImage();
		}
		
		public function changePhase():void 
		{
			
		}
		
		private function destruct() : void
		{
			if (_texture)
			{
				_texture.dispose();
				_texture = null;
			}
			
			if (_image)
			{
				_image.removeFromParent(true);
				_image = null;
			}
		}
		
		
		
		
	}

}