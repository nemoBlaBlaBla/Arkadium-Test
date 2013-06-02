package utilities
{
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author Eugene Tkachenko
	 * AAGameParameters is a SINGLETON Class
	 */
	public class AAGameParameters
	{
		private static var _sharedInstance:AAGameParameters;
		
		private var _playerScore:Number = 0;
		private var _playerPosition:Point = new Point();
		
		public function AAGameParameters()
		{
		
		}
		
		public static function sharedInstance():AAGameParameters
		{
			if (!_sharedInstance)
			{
				_sharedInstance = new AAGameParameters();
			}
			return _sharedInstance;
		}
		
		public function WipeGameParameters():void
		{
			playerScore = 0;
		}
		
		
//{PROPERTIES GETTERS AND SETTERS
		public function get playerScore():Number 
		{
			return _playerScore;
		}
		
		public function set playerScore(value:Number):void 
		{
			_playerScore = value;
		}
		
		public function get playerPosition():Point 
		{
			return _playerPosition;
		}
		
		public function set playerPosition(value:Point):void 
		{
			_playerPosition = value;
		}
//}
	}

}

class PrivateClass
{
	public function PrivateClass()
	{
	
	}
}