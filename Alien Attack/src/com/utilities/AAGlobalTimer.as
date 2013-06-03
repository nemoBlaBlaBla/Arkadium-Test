package com.utilities 
{
	import flash.utils.Timer;
	import mx.core.Singleton;
	
	/**
	 * ...
	 * @author Eugene
	 * AAGlobalTimer is SINGLETON Class
	 */
	public class AAGlobalTimer extends Timer 
	{
		
		private static var _instance:AAGlobalTimer;
		
		public function AAGlobalTimer(privateClass:PrivateClass, delay:Number = 33, repeatCount:int=0) 
		{
			super(delay, repeatCount);
			this.start();
		}
		
		public static function GetInstance():AAGlobalTimer
		{
			if (!_instance)
			{
				_instance = new AAGlobalTimer(new PrivateClass(), 33, 0);
			}
			return _instance;
		}
	}
}

class PrivateClass 
{
	public function PrivateClass()
	{
		
	}
}