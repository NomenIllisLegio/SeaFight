package 
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.net.FileReference;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;
	import flash.events.Event;
	import flash.utils.ByteArray;
	import starling.animation.Juggler;
	import starling.animation.Tween;
	import starling.animation.Transitions;
	import starling.core.Starling;
	/**
	 * ...
	 * @author NomenIllisLegio
	 */
	public class Log extends Sprite
	{
		private static var _field  			: TextField;
		
		private static var _consoleSprite 	: Sprite;
		private static var _instance		: Log;
		
		private static const _h				: Number = 200;
		private static const _w				: Number = 400;
		
		public function Log() 
		{	
			super();
			Main.mainStage.addChild(this);
			this.visible = false;
		}
		
		private static function init() : void
		{	
			if (_instance == null )
			{
				_instance = new Log();
			}
			
			_field = new TextField();
			
			_field.textColor = 0x000000;
			_field.multiline = true;
			_field.wordWrap  = true;
			
			_field.defaultTextFormat = new TextFormat( "Lucida Console", 12, 0x000000 );
			
			_field.width  = Log._w;
			_field.height = Log._h;
			
			_instance.addChild(_field);
			
			initConsoleSprite();
		}
		
		private static function initConsoleSprite():void 
		{
			_consoleSprite = new Sprite();
			_consoleSprite.graphics.beginFill(0xAAAAAA, 0.3);
			_consoleSprite.graphics.drawRect(0, 0, _w, _h);
			_consoleSprite.graphics.endFill();
			_instance.addChild(_consoleSprite);
			_instance.y = -200;
		}
		
		public static function e( message : * ) : void
		{
			if (_field == null)
			{
				init();
			}
			
			var oldText : String = _field.htmlText;
			var newStr  : String = '<font color="#ff4444">' + String(message) + '</font>\n';
			
			write(oldText+newStr);
		}
		
		public static function w( message : * ) : void
		{
			if (_field == null)
			{
				init();
			}
			
			var oldText : String = _field.htmlText;
			var newStr  : String = '<font color="#FFB300">' + String(message) + '</font>\n';
			
			write(oldText+newStr);
		}
		
		public static function i( message : * ) : void
		{
			if (_field == null)
			{
				init();
			}
			
			var oldText : String = _field.htmlText;
			var newStr  : String = '<font color="#1A00FF">' + String(message) + '</font>\n';
			
			write(oldText+newStr);
		}
		
		private static function write( str : String ) : void
		{	
			_field.htmlText = str;

			_field.scrollV = _field.maxScrollV;
			
			redraw();
		}
		
		public static function switchVisible() : void
		{
			if(!_instance.visible == false)
			{
				moveSpriteToDefaultPlace();
			}
			else
			{	
				_instance.visible = true;
				moveSpriteToCurrentPlace();
			}
		}
		
		private static function moveSpriteToDefaultPlace():void 
		{	
			if ( Starling.juggler.containsTweens(_instance) )
				return;
			
			var tweenToDefaultPlace : Tween = new Tween(_instance, 1, Transitions.EASE_OUT);
			tweenToDefaultPlace.onComplete = onCompleteMoveToDefaultPlace;
			tweenToDefaultPlace.onCompleteArgs = [tweenToDefaultPlace];
			tweenToDefaultPlace.animate("y", -200);
			
			Starling.juggler.add(tweenToDefaultPlace);
		}
		
		private static function onCompleteMoveToDefaultPlace( tween : Tween ):void 
		{
			if (tween)
			{
				Starling.juggler.remove(tween);
				tween = null;
			}
			_instance.visible = false;
		}
		
		private static function moveSpriteToCurrentPlace():void 
		{	
			if ( Starling.juggler.containsTweens(_instance) )
				return;
				
			var tweenToCurrentPlace : Tween = new Tween(_instance, 1, Transitions.EASE_OUT_IN_BACK);
			tweenToCurrentPlace.onComplete = onCompleteMoveToCurrentPlace;
			tweenToCurrentPlace.onCompleteArgs = [tweenToCurrentPlace];
			tweenToCurrentPlace.animate("y", 0);
			
			Starling.juggler.add(tweenToCurrentPlace);
		}
		
		private static function onCompleteMoveToCurrentPlace( tween : Tween ):void 
		{
			if (tween)
			{
				Starling.juggler.remove(tween);
				tween = null;
			}
		}
		
		private static function redraw() : void
		{
			_instance.addChild(_field);
		}		
		
		public static function saveFile() : void
		{	
			Log.i("saveLog");
			
			var bytes 	: ByteArray 	= new ByteArray();
			var fileRef	: FileReference = new FileReference();
			
			fileRef.save( _field.text, "Log.txt" );
		}
	}

}