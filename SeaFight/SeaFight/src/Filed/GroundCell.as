package Filed 
{
	import Filed.interfaces.ICell;
	import starling.display.Sprite;
	
	/**
	 * ...
	 * @author NomenIllisLegio
	 */
	public class GroundCell extends Sprite implements ICell 
	{
		private var _type : int = 1;
		private var _view : GroundCellView;
		
		public function GroundCell() 
		{
			super();
			initCellView();
		}
		
		/* INTERFACE Filed.interfaces.ICell */
		
		public function initCellView():void 
		{	
			_view = new GroundCellView();
			_view.width = _view.height = 50;
			this.addChild(_view);
		}
		
		public function get type():int 
		{
			return _type;
		}
		
		public function set type(value:int):void 
		{
			_type = value;
			if (_view != null)
			{
				_view.switcher(_type)
			}
		}
		
	}

}