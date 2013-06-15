package com.utilities
{
	import com.levels.AALevel;
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
		private static var _SharedInstance:AAGameParameters;
		
		// properties
		private var _currentLevelIndex:int;
		private var _fpsCounter:AAFPSCounter;
		private var _gameComplete:Boolean = false;
		private var _levels:Vector.<AALevel>;
		private var _xmlLoader:URLLoader;
		private var _playerScore:Number = 0;
		private var _playerPosition:Point = new Point();
		
		public function AAGameParameters(privateClass:PrivateClass)
		{
			this._fpsCounter = new AAFPSCounter();
			
			this.LoadXMLConfig();
		}
		
		public static function SharedInstance():AAGameParameters
		{
			if (!_SharedInstance)
			{
				_SharedInstance = new AAGameParameters(new PrivateClass());
			}
			return _SharedInstance;
		}
		
		public function WipeGameParameters():void
		{
			this.playerScore = 0;
		}
		
		public function LoadNextLevel():void
		{
			if (this.currentLevelIndex == this.levels.length - 1)
			{
				this._gameComplete = true;
				this.currentLevelIndex = 0;
			}
			else
			{
				this._gameComplete = false;
				this.currentLevelIndex++;
			}
		}
		
		public function CurrentLevel():AALevel
		{
			var currentLevel:AALevel;
			try
			{
				currentLevel = this.levels[currentLevelIndex];
			}
			catch (err:Error)
			{
				trace(err);
				currentLevel = new AALevel();
				currentLevel.DefaulParameters();
			}
			return currentLevel;
		}
		
		//loading xml levels
		private function LoadXMLConfig():void
		{	
			this._xmlLoader = new URLLoader();
			this._xmlLoader.addEventListener(Event.COMPLETE, OnLoading);
			this._xmlLoader.load(new URLRequest("GameConfig.xml"));
		}
		
		
		private function OnLoading(e:Event):void 
		{
			this._xmlLoader.removeEventListener(Event.COMPLETE, OnLoading);
			
			XML.ignoreWhitespace = true;
			var xmlLevels:XML = new XML(e.target.data);
			
			this.levels = new Vector.<AALevel>();
			for each(var xmlLevel:XML in xmlLevels.children())
			{
				this.levels.push(ParseLevelFromXMLLevel(xmlLevel));
			}
			
			if (this.levels.length > 0)
			{
				this.currentLevelIndex = 0;
			}
		}
		
		private function ParseLevelFromXMLLevel(xmlLevel:XML):AALevel
		{
			var level:AALevel = new AALevel();
			level.levelName = xmlLevel.name;
			level.timeToFinishInSeconds = xmlLevel.time_to_finish;
			level.enemySpawnDelayInSeconds = xmlLevel.enemy_spawn_delay;
			level.playerArmor = xmlLevel.player_armor;
			
			return level;
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
		
		public function get levels():Vector.<AALevel> 
		{
			return _levels;
		}
		
		public function set levels(value:Vector.<AALevel>):void 
		{
			_levels = value;
		}
		
		public function get currentLevelIndex():uint 
		{
			return _currentLevelIndex;
		}
		
		public function set currentLevelIndex(value:uint):void 
		{
			if (_levels.length > 0 && _levels.length >= value + 1)
			{
				_currentLevelIndex = value;
			}
		}
		
		public function get xmlLoader():URLLoader 
		{
			return _xmlLoader;
		}
		
		public function get gameComplete():Boolean 
		{
			return _gameComplete;
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