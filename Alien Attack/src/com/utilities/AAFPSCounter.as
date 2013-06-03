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
		private var _fps:uint = 0;
		
		public function AAFPSCounter()
		{
			_timer.start();
			_timer.addEventListener(TimerEvent.TIMER, onTimerTick);
			addEventListener(Event.ENTER_FRAME, OnEnterFrame);
		}
		
		private function OnEnterFrame(e:Event):void 
		{
			_now++;
		}
		
		private function onTimerTick(e:TimerEvent):void
		{
			_fps = (_now - _last);
			_last = _now;
		}
		
		
//{ GETTERS AND SETTERS
		public function get fps():uint 
		{
			return _fps;
		}
		
		public function set fps(value:uint):void 
		{
			_fps = value;
		}
//}
	}
}