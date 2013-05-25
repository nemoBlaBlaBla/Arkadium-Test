package com.objects.spaceobjects 
{
	import com.controllers.Controller;
	import com.objects.shipmodules.AAEngine;
	import com.universe.Universe;
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.TimerEvent;
	import flash.geom.Point;
	import utilities.GlobalTimer;
	
	/**
	 * ...
	 * @author Eugene
	 */
	public class AASpaceShip extends AASpaceObject 
	{
		private const POINT_UP : Point = new Point(0, -1);
		private const POINT_DOWN : Point = new Point(0, 1);
		private const POINT_LEFT : Point = new Point(-1, 0);
		private const POINT_RIGHT : Point = new Point(1, 0);
		
		private var _thrustForceVector : Point = new Point(0, 0);
		private var _rotationForceFactor : Number = 0;
		
		private var _engine:AAEngine;
		//private var _canon:
		private var _controller:Controller;
		
		private var _shipTimer:GlobalTimer = GlobalTimer.GetInstance();
		
		public function AASpaceShip(universe:Universe) 
		{
			super(universe);
			_shipTimer.addEventListener(TimerEvent.TIMER, onTimerTick);
		}
		
		
//{ MOVEMENT METHODS
		public function MoveForward(isTrue : Boolean) : void
		{
			this._engine.MaximumThrust();
			if (isTrue)
			{
				this.thrustForceVector = this.thrustForceVector.add(POINT_UP);
			}
			else
			{
				this.thrustForceVector = this.thrustForceVector.subtract(POINT_UP);
			}
		}
		
		
		public function MoveBackward(isTrue : Boolean) : void
		{
			this._engine.MaximumThrust();
			if (isTrue)
			{
				this.thrustForceVector = this.thrustForceVector.add(POINT_DOWN);
			}
			else
			{
				this.thrustForceVector = this.thrustForceVector.subtract(POINT_DOWN);
			}
		}
		
		
		public function MoveLeft(isTrue : Boolean) : void
		{
			this._engine.MaximumThrust();
			if (isTrue)
			{
				this.thrustForceVector = this.thrustForceVector.add(POINT_LEFT);
			}
			else
			{
				this.thrustForceVector = this.thrustForceVector.subtract(POINT_LEFT);
			}
		}
		
		
		public function MoveRight(isTrue : Boolean) : void
		{
			this._engine.MaximumThrust();
			if (isTrue)
			{
				this.thrustForceVector = this.thrustForceVector.add(POINT_RIGHT);
			}
			else
			{
				this.thrustForceVector = this.thrustForceVector.subtract(POINT_RIGHT);
			}
		}
		
		
		public function TurnLeft(isTrue : Boolean) : void
		{
			this._engine.MaximumTurn();
			if (isTrue)
			{
				this.rotationForceFactor = -1;
			}
			else
			{
				this.rotationForceFactor = 0;
			}
		}
		
		
		public function TurnRight(isTrue : Boolean) : void
		{
			this._engine.MaximumTurn();
			if (isTrue)
			{
				this.rotationForceFactor = 1;
			}
			else
			{
				this.rotationForceFactor = 0;
			}
		}
		
		
		public function Stop() : void
		{
			this._engine.StopEngine();
		}
		
		public function StopTurn() : void
		{
			this._engine.StopTurn();
			this.rotationForceFactor = 0;
		}
		
//}
		

//{ PROPERTIES GETTERS AND SETTERS
		private function onTimerTick(e:TimerEvent):void 
		{	
			
		}
		
		public function get controller():Controller 
		{
			return _controller;
		}
		
		public function set controller(value:Controller):void 
		{
			_controller = value;
		}
		
		public function get thrustForceVector():Point 
		{
			return _thrustForceVector;
		}
		
		public function set thrustForceVector(value:Point):void 
		{	
			_thrustForceVector = value;
			
			if (_thrustForceVector.x > 1)
			{
				_thrustForceVector.x = 1;
			}
			else if (_thrustForceVector.x < -1)
			{
				_thrustForceVector.x = -1;
			}
			
			if (_thrustForceVector.y > 1)
			{
				_thrustForceVector.y = 1;
			}
			else if (_thrustForceVector.y < -1)
			{
				_thrustForceVector.y = -1;
			}
		}
		
		public function get rotationForceFactor():Number 
		{
			return _rotationForceFactor;
		}
		
		public function set rotationForceFactor(value:Number):void 
		{
			if (value > 1)
			{
				value = 1
			}
			else if (value < -1)
			{
				value = -1
			}
			_rotationForceFactor = value;
		}
		
		public function get engine():AAEngine 
		{
			return _engine;
		}
		
		public function set engine(value:AAEngine):void 
		{
			_engine = value;
		}
//}
	}
}