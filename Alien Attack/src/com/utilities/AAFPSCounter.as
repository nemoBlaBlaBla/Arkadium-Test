package com.utilities
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	/**
	 * ...
	 * @author Eugene
	 */
	public class AAFPSCounter extends Sprite
	{
		private var _timer:Timer = new Timer(1000);
		private var _now:uint = 0;
		private var _last:uint = 0;
		
		//property
		private var _fps:uint = 0;
		
		public function AAFPSCounter()
		{
			this._timer.start();
			this._timer.addEventListener(TimerEvent.TIMER, onTimerTick);
			this.addEventListener(Event.ENTER_FRAME, OnEnterFrame);
		}
		
//{ EVENT HANDLERS
		private function OnEnterFrame(e:Event):void 
		{
			this._now++;
		}
		
		private function onTimerTick(e:TimerEvent):void
		{
			this._fps = (_now - _last);
			this._last = _now;
		}
//}

		
//{ GETTERS AND SETTERS
		public function get fps():uint 
		{
			return _fps;
		}
//}
	}
}