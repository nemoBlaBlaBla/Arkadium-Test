package utilities 
{
	import flash.utils.Timer;
	import mx.core.Singleton;
	
	/**
	 * ...
	 * @author Eugene
	 * GlobalTimer is SINGLETON Class
	 */
	public class GlobalTimer extends Timer 
	{
		
		private static var _instance:GlobalTimer;
		
		public function GlobalTimer(privateClass:PrivateClass, delay:Number = 20, repeatCount:int=0) 
		{
			super(delay, repeatCount);
			this.start();
		}
		
		public static function GetInstance():GlobalTimer
		{
			if (!_instance)
			{
				_instance = new GlobalTimer(new PrivateClass(), 20, 0);
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