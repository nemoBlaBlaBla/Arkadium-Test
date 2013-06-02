package com.objects.shipmodules 
{
	import com.objects.spaceobjects.AACannonShell;
	import com.objects.spaceobjects.AASpaceShip;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	/**
	 * ...
	 * @author Eugene Tkachenko
	 */
	public class AACannon 
	{
		
		protected var _fireRate : Number = 5;
		private var _ship : AASpaceShip;
		protected var _spreading : Number = 5;
		protected var _shellType:Class = AACannonShell;
		
		private var _fireTimer:Timer;
		
		public function AACannon(ship : AASpaceShip) 
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
			Math.random();
			
			//var shell:AACannonShell = _shell
			var shell:AACannonShell = new _shellType(_ship.universe, _ship.rotation + ((Math.random() * _spreading) - _spreading / 2));
			
			shell.x = _ship.x - (Math.sin((_ship.rotation * Math.PI) / 180) * - 70);
			shell.y = _ship.y + (Math.cos((_ship.rotation * Math.PI) / 180) * - 70);
			
			_ship.universe.addChild(shell);
		}
		
	}

}