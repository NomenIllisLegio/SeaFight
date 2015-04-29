package
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.geom.Rectangle;
	import flash.ui.ContextMenu;
	import flash.ui.ContextMenuItem
	import starling.core.Starling;
	
	/**
	 * ...
	 * @author NomenIllisLegio
	 */
	public class Main extends Sprite 
	{
		public static var mainStage : Stage;
		
		public function Main() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			mainStage = this.stage;	
			
			addContextMenuItem();
			
			addKeyEvents();
			
			addStarling();
		}
		
		private function addKeyEvents():void 
		{
			mainStage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		}
		
		private function onKeyDown(e:KeyboardEvent):void 
		{	
			if (e.keyCode == 192) // ~ тильда
			{
				Log.switchVisible();
			}			
			
			if(e.shiftKey)
			{
				if(e.keyCode == 70) // F
				{
					Log.saveFile();
				}
			}
		}
		
		private function addContextMenuItem() : void
		{
			var cm : ContextMenu = new ContextMenu();
			cm.hideBuiltInItems();
			
			var cmi : ContextMenuItem = new ContextMenuItem("SeaFight Version: "
															+VersionGame.version
															+VersionGame.minor
															+VersionGame.major);
			cm.customItems.push(cmi);
			this.contextMenu = cm;
			
			Log.i("StartLog");
		}
		
		private function addStarling() : void
		{
			var myStarling : Starling = new Starling(Game, mainStage);
			myStarling.start();
		}
		
	}
	
}