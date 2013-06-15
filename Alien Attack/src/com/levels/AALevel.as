package com.levels 
{
	/**
	 * ...
	 * @author Eugene Tkachenko
	 */
	public class AALevel 
	{
		//properties
		private var _levelName:String;
		private var _timeToFinishInSeconds:Number;
		private var _enemySpawnDelayInSeconds:Number;
		private var _playerArmor:int;
		
		public function AALevel() 
		{
			
		}
		
		public function DefaulParameters():void
		{
			this.timeToFinishInSeconds = 60;
			this.enemySpawnDelayInSeconds = 2;
			this.playerArmor = 100;
			this.levelName = "Level";
		}
		
		
//{ GETTERS AND SETTERS
		public function get levelName():String 
		{
			return _levelName;
		}
		
		public function set levelName(value:String):void 
		{
			_levelName = value;
		}
		
		public function get timeToFinishInSeconds():Number 
		{
			return _timeToFinishInSeconds;
		}
		
		public function set timeToFinishInSeconds(value:Number):void 
		{
			_timeToFinishInSeconds = value;
		}
		
		public function get enemySpawnDelayInSeconds():Number 
		{
			return _enemySpawnDelayInSeconds;
		}
		
		public function set enemySpawnDelayInSeconds(value:Number):void 
		{
			_enemySpawnDelayInSeconds = value;
		}
		
		public function get playerArmor():int 
		{
			return _playerArmor;
		}
		
		public function set playerArmor(value:int):void 
		{
			_playerArmor = value;
		}
		
	}
//}
}