package Filed 
{
	import starling.display.DisplayObject;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	/**
	 * ...
	 * @author NomenIllisLegio
	 */
	public class MainField extends Sprite 
	{
		private const X_QUAD		: int = 10;
		private const Y_QUAD		: int = 10;
		private const SHIPS_COUNT 	: int = 10;
		
		private var _quad		: GroundCell;
		private var _quads		: Vector.<Vector.<GroundCell>>;
		private var _ships		: Vector.<Vector.<Ship>>;
		
		public function MainField() 
		{
			super();
			
			initShips();
			initField();
		}
		
		private function initShips():void 
		{
			/*Log.i("initShips");
						
			_ships = new Vector.<Vector.<Ship>>(); 

			for ( var k : int = 0; k < X_QUAD; k++ )
			{
				_ships.push( new Vector.<GroundCell>(Y_QUAD) );
			}*/
		}
		
		private function initField():void 
		{				
			Log.i("initField");
						
			_quads = new Vector.<Vector.<GroundCell>>(); 

			for ( var k : int = 0; k < X_QUAD; k++ )
			{
				_quads.push( new Vector.<GroundCell>(Y_QUAD) );
			}
			
			var count : int = 0;
			for ( var i : int = 0; i < X_QUAD; i++ )
			{	
				for ( var j : int = 0; j < Y_QUAD; j++ )
				{	
					_quads[i][j] = new GroundCell();
					_quads[i][j].x = i * _quads[i][j].width;
					_quads[i][j].y = j * _quads[i][j].height;
					this.addChild(_quads[i][j]);
					count++;
				}
				
			}
			Log.i("quads create "+ count);
			
			this.addEventListener(TouchEvent.TOUCH, onTouch);
		}
		
		private function onTouch(e:TouchEvent):void 
		{	
			var touch : Touch = e.getTouch(e.target as DisplayObject);
			
			if ( touch.phase == TouchPhase.BEGAN )
			{
				if (GameConstants.LOG)
					Log.i("TouchBegan");					
			}
			else
			{
				if ( touch.phase == TouchPhase.ENDED )
				{
					if (GameConstants.LOG)
						Log.i("TouchENDED");
						
					checkCell(touch.target);
				}
			}
		}
		
		private function checkCell(target:DisplayObject):void 
		{	
			Log.i("CheckSell");
			if ( target.parent is GroundCellView )
			{	
				var rand : Number = Math.random();
				if (rand > 0.66)
				{
					(target.parent as GroundCellView).switcher(3);
				}
				else
				{	
					if ( rand > 0.33)
					{
						(target.parent as GroundCellView).switcher(2);
					}
					else
					{
						(target.parent as GroundCellView).switcher(1);
					}
					
				}
				
			}
		}
	}

}