package com.objects.shipmodules.guns 
{
	import com.behaviours.AAAlienShipBehaviour;
	import com.behaviours.AAPlayerBehaviour;
	import com.objects.spaceobjects.bullets.AABulletAbstract;
	import com.objects.spaceobjects.ships.AASpaceShip;
	import flash.events.TimerEvent;
	import flash.media.Sound;
	import flash.utils.Timer;
	/**
	 * ...
	 * @author Eugene Tkachenko
	 */
	public class AAGunAbstract 
	{
		//properties
		private var _shotSound:Sound;
		
		//variables
		private var _fireTimer:Timer;
		private var _ship : AASpaceShip;
		protected var _fireRate : Number = 5;
		protected var _spreading : Number = 5;
		protected var _shellType:Class = AABulletAbstract;
		
		public function AAGunAbstract(ship : AASpaceShip) 
		{
			_ship = ship;
		}
		
		private function OnTimer(e:TimerEvent):void 
		{
			this.SingleShot();
		}
		
		public function Fire(start:Boolean) : void 
		{
			if (!_fireTimer)
			{
				this._fireTimer = new Timer(1000 / _fireRate, 0);
				this._fireTimer.addEventListener(TimerEvent.TIMER, OnTimer);
			}
			if (start)
			{
				this._fireTimer.start();
			}
			else
			{
				this._fireTimer.stop();
			}
		}
		
		public function SingleShot() : void
		{
			if (this.shotSound)
			{
				this.shotSound.play();
			}
			var bullet:AABulletAbstract = new _shellType(_ship.universe, _ship.rotation + ((Math.random() * _spreading) - _spreading / 2));
			if (_ship.behaviour is AAPlayerBehaviour)
			{
				bullet.tag = "player";
			}
			else if (_ship.behaviour is AAAlienShipBehaviour)
			{
				bullet.tag = "alien";
			}
			
			bullet.x = _ship.x - (Math.sin((_ship.rotation * Math.PI) / 180) * - 70);
			bullet.y = _ship.y + (Math.cos((_ship.rotation * Math.PI) / 180) * - 70);
			
			this._ship.universe.addChild(bullet);
			bullet = null;
			
			trace("shot!!!");
		}
		
		public function Destroy():void
		{
			this._ship = null;
			this._fireTimer.stop();
			this._fireTimer.removeEventListener(TimerEvent.TIMER, OnTimer);
			this._fireTimer = null;
		}
		
		
//{ GETTERS AND SETTERS
		public function get shotSound():Sound 
		{
			return _shotSound;
		}
		
		public function set shotSound(value:Sound):void 
		{
			_shotSound = value;
		}
//}
	}
}