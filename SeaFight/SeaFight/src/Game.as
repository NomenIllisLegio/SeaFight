package 
{
	import Filed.MainField;
	import starling.display.Sprite;
	
	/**
	 * ...
	 * @author NomenIllisLegio
	 */
	public class Game extends Sprite 
	{	
		private var _field : MainField;
		
		public function Game() 
		{
			Log.i("Starling create!");
			initGame();
		}
		
		private function initGame():void 
		{
			_field = new MainField();
			addChild(_field);
			_field.x = Main.mainStage.stageWidth * 0.5 - _field.width * 0.5
			_field.y = Main.mainStage.stageHeight * 0.5 - _field.height * 0.5
		}
	}

}