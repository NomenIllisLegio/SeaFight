package Filed 
{
	import starling.display.Sprite;
	
	/**
	 * ...
	 * @author NomenIllisLegio
	 */
	public class GroundCell extends Sprite implements ICell 
	{
		private function _type : int;
		
		public function GroundCell() 
		{
			super();
			initCellView();
		}
		
		private function initCellView() : void
		{
			
		}
		
		/* INTERFACE Filed.ICell */
		
		public function get type():int 
		{
			return _type;
		}
		
		public function set type(value:int):void 
		{
			_type = value;
		}
		
		public function set type(value:int):void 
		{
			_type = value;
		}
		
	}

}