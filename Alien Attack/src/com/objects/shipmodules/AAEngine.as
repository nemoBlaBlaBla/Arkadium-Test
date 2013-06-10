package com.objects.shipmodules
{
	import com.fx.particlesystem.AAParticleSystem;
	import com.objects.spaceobjects.ships.AASpaceShip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.geom.Point;
	import flash.utils.Timer;
	
	/**
	 * ...
	 * @author Eugene
	 */
	public class AAEngine extends Sprite
	{	
		private var _maxThrustForce : Number = 0;
		private var _currentThrustForce : Number = 0;
		
		private var _maxRotationForce : Number = 0;
		private var _currentRotationForce : Number = 0;
		
		protected var _particleSystem1:AAParticleSystem; 
		protected var _particleSystem2:AAParticleSystem; 
		
		private var _ship:AASpaceShip;
		
		public function AAEngine(ship:AASpaceShip, maxThrustForce:Number = 0, maxRotationForce:Number = 0)
		{
			_ship = ship;
			_maxThrustForce = maxThrustForce;
			_maxRotationForce = maxRotationForce;
			
			addEventListener(Event.ENTER_FRAME, OnEnterFrame);
		}
		
//{ EVENT HANDLERS

		
		
		private function OnEnterFrame(e:Event):void
		{
			_ship.force = new Point(_ship.thrustForceVector.x * _currentThrustForce, _ship.thrustForceVector.y * currentThrustForce);
			_ship.angularForce = _ship.rotationForceFactor * _currentRotationForce;
		}
//}
		
		public function MaximumThrust():void
		{	
			this.currentThrustForce = this.maxThrustForce;
		}
		
		public function MaximumTurn() : void 
		{
			this.currentRotationForce = this.maxRotationForce;
		}
		
		public function StopTurn():void
		{
			this.currentRotationForce = 0;
		}
		
		
		public function StopEngine():void
		{
			//_particleSystem1.particleVelocity = 0;
			//_particleSystem2.particleVelocity = 0;
		}
		
		public function Destroy():void
		{
			removeEventListener(Event.ENTER_FRAME, OnEnterFrame);
		}

//{ PROPERTIES GETTERS AND SETTERS			
		public function get maxThrustForce():Number 
		{
			return _maxThrustForce;
		}
		
		public function set maxThrustForce(value:Number):void 
		{
			_maxThrustForce = value;
		}
		
		public function get currentThrustForce():Number 
		{
			return _currentThrustForce;
		}
		
		public function set currentThrustForce(value:Number):void 
		{
			if (value > this._maxThrustForce)
			{
				_currentThrustForce = _maxThrustForce;
			}
			else
			{
				_currentThrustForce = value;
			}
		}
		
		public function get maxRotationForce():Number 
		{
			return _maxRotationForce;
		}
		
		public function set maxRotationForce(value:Number):void 
		{
			_maxRotationForce = value;
		}
		
		public function get currentRotationForce():Number 
		{
			return _currentRotationForce;
		}
		
		public function set currentRotationForce(value:Number):void 
		{
			if (value > this._maxRotationForce)
			{
				_currentRotationForce = _maxRotationForce;
			}
			else
			{
				_currentRotationForce = value;
			}
		}
	}
//}

}