package utilities
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.text.TextField;
	import flash.utils.Timer;
	import flash.text.TextFormat;
	import flash.filters.GlowFilter;
	
	/**
	 * ...
	 * @author Eugene
	 */
	public class FPSCounter extends Sprite
	{
		private var _textField:TextField = new TextField();
		private var _timer:Timer = new Timer(1000);
		private var _now:uint = 0;
		private var _last:uint = 0;
		private var _fps:uint = 0;
		
		public function FPSCounter()
		{
			var tformat:TextFormat = new TextFormat("Pixel10", 16, 0x99ff99);
			_textField.embedFonts = true;
			_textField.defaultTextFormat = tformat;
			this.addEventListener(Event.ADDED_TO_STAGE, onAddingToStage);
			this.addChild(_textField);
		}
		
		private function onAddingToStage(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddingToStage);
			this.addEventListener(Event.ENTER_FRAME, onNewFrame)
			_timer.start();
			_timer.addEventListener(TimerEvent.TIMER, onTimerTick);
		}
		
		private function onTimerTick(e:TimerEvent):void
		{
			_fps = (_now - _last);
			_last = _now;
			_textField.text = ("fps: " + _fps);
		}
		
		private function onNewFrame(e:Event):void
		{
			_now++;
		}
	}
}