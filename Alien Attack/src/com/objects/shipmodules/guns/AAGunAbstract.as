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
		protected var _fireRate : Number = 5;
		private var _ship : AASpaceShip;
		protected var _spreading : Number = 5;
		protected var _shellType:Class = AABulletAbstract;
		private var _shotSound:Sound;
		
		private var _fireTimer:Timer;
		
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
				_fireTimer = new Timer(1000 / _fireRate, 0);
				_fireTimer.addEventListener(TimerEvent.TIMER, OnTimer);
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
			var shell:AABulletAbstract = new _shellType(_ship.universe, _ship.rotation + ((Math.random() * _spreading) - _spreading / 2));
			if (_ship.behaviour is AAPlayerBehaviour)
			{
				shell.tag = "player";
			}
			else if (_ship.behaviour is AAAlienShipBehaviour)
			{
				shell.tag = "alien";
			}
			
			shell.x = _ship.x - (Math.sin((_ship.rotation * Math.PI) / 180) * - 70);
			shell.y = _ship.y + (Math.cos((_ship.rotation * Math.PI) / 180) * - 70);
			
			_ship.universe.addChild(shell);
		}
		
		public function Destroy():void
		{
			_ship = null;
			_fireTimer.stop();
			_fireTimer = null;
		}
		
		public function get shotSound():Sound 
		{
			return _shotSound;
		}
		
		public function set shotSound(value:Sound):void 
		{
			_shotSound = value;
		}
	}
}