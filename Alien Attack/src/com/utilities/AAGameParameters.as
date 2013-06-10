package com.utilities
{
	import flash.events.Event;
	import flash.geom.Point;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
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
		
		private var _fpsCounter:AAFPSCounter;
		
		public function AAGameParameters(privateClass:PrivateClass)
		{
			_fpsCounter = new AAFPSCounter();
			
			LoadXMLConfig();
		}
		
		public static function sharedInstance():AAGameParameters
		{
			if (!_sharedInstance)
			{
				_sharedInstance = new AAGameParameters(new PrivateClass());
			}
			return _sharedInstance;
		}
		
		public function WipeGameParameters():void
		{
			playerScore = 0;
		}
		
		
		
		//;alsjdfla;jfa;slf
		private function LoadXMLConfig():void
		{	
			var xmlLoader:URLLoader = new URLLoader();
			xmlLoader.addEventListener(Event.COMPLETE, showXML);
			xmlLoader.load(new URLRequest("GameConfig.xml"));
		}
		
		private function showXML(e:Event):void 
		{
			XML.ignoreWhitespace = true;
			var levels:XML = new XML(e.target.data);
			trace(levels.children());
			
			//for each(var level:XML in levels)
			//{
				//trace(level.children());
			//}
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
		
		public function get fpsCounter():AAFPSCounter 
		{
			return _fpsCounter;
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