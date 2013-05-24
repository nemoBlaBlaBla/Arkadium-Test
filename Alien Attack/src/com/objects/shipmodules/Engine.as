package com.objects.shipmodules
{
	import com.fx.particlesystem.ParticleSystem;
	import com.objects.spaceobjects.AASpaceShip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import utilities.GlobalTimer;
	
	/**
	 * ...
	 * @author Eugene
	 */
	public class Engine extends Sprite
	{
		protected var _maxVerticalThrustForce:int = 100;
		protected var _minVerticalThrustForce:int = -100;
		protected var _currentVerticalThrustForce:int = 0;
		
		protected var _maxHorizontalThrustForce:int = 50;
		protected var _minHorizontalThrustForce:int = -50;
		protected var _currentHorizontalThrustForce:int = 0;
		
		protected var _maxRotationForce:int = 100;
		protected var _currentRotationForce:int = 0;
		
		protected var _globalTimer:GlobalTimer;
		
		protected var _particleSystem1:ParticleSystem; 
		protected var _particleSystem2:ParticleSystem; 
		
		private var _ship:AASpaceShip;
		
		public function Engine(ship:AASpaceShip)
		{
			_ship = ship;
			_particleSystem1 = new ParticleSystem(this, 50, 0, 2, 0);
			_particleSystem2 = new ParticleSystem(this, 50, 0, 2, 0);
			
			_particleSystem1.x = -6;
			_particleSystem1.y = 30;
			
			_particleSystem2.x = 7;
			_particleSystem2.y = 30;
			
			
			_globalTimer = GlobalTimer.GetInstance();
			_globalTimer.addEventListener(TimerEvent.TIMER, onTimerTick);
			this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
			this.addEventListener(Event.ADDED_TO_STAGE, onAddingToStage);
		}
		
		private function onAddingToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddingToStage);
			this.addChild(_particleSystem1);
			this.addChild(_particleSystem2);
			_particleSystem1.Start();
			_particleSystem2.Start();
		}
		
		private function onTimerTick(e:TimerEvent):void
		{
			//_ship.verticalThrustForce = _currentVerticalThrustForce;
			//_ship.horizontalThrustForce = _currentHorizontalThrustForce;
			//_ship.rotationForce = _currentRotationForce;
		}
		
		private function onEnterFrame(e:Event):void
		{
			//_ship.verticalThrustForce = _currentVerticalThrustForce;
			//_ship.horizontalThrustForce = _currentHorizontalThrustForce;
			//_ship.rotationForce = _currentRotationForce;
		}
		
		public function IncreaseVerticalThrustForce():void
		{
			if (_currentVerticalThrustForce < _maxVerticalThrustForce)
			{
				_currentVerticalThrustForce++;
				_ship.verticalThrustForce = _currentVerticalThrustForce;
			}
			else
			{
				_currentVerticalThrustForce = _maxVerticalThrustForce;
			}
		}
		
		public function DecreaseVerticalThrustForce():void
		{
			if (_currentVerticalThrustForce > _minVerticalThrustForce)
			{
				_currentVerticalThrustForce--;
				_ship.verticalThrustForce = _currentVerticalThrustForce;
			}
			else
			{
				_currentVerticalThrustForce = _minVerticalThrustForce;
			}
		}
		
		public function MaximumThrust():void
		{
			_currentVerticalThrustForce = _maxVerticalThrustForce;
			_particleSystem1.particleVelocity = 7;
			_particleSystem2.particleVelocity = 7;
		}
		
		public function MinimalThrust():void
		{
			_currentVerticalThrustForce = _minVerticalThrustForce;
		}
		
		public function RightStrafe():void
		{
			_currentHorizontalThrustForce = _maxHorizontalThrustForce;
		}
		
		public function LeftStrafe():void
		{
			_currentHorizontalThrustForce = _minHorizontalThrustForce;
		}
		
		public function TurnLeft():void
		{
			_currentRotationForce = -_maxRotationForce;
		}
		
		public function TurnRight():void
		{
			_currentRotationForce = _maxRotationForce;
		}
		
		public function StopTurn():void
		{
			_currentRotationForce = 0;
		}
		
		public function StopEngine():void
		{
			_currentVerticalThrustForce = 0;
			_currentHorizontalThrustForce = 0;
			_particleSystem1.particleVelocity = 0;
			_particleSystem2.particleVelocity = 0;
			//_ship.verticalThrustForce = 0;
		}
		
		public function get maxVerticalThrustForce():int
		{
			return _maxVerticalThrustForce;
		}
		
		public function get minVerticalThrustForce():int
		{
			return _minVerticalThrustForce;
		}
		
		public function get currentVerticalThrustForce():int
		{
			return _currentVerticalThrustForce;
		}
		
		public function get currentHorizontalThrustForce():int 
		{
			return _currentHorizontalThrustForce;
		}
		
		public function get currentRotationForce():int 
		{
			return _currentRotationForce;
		}
	
	}

}