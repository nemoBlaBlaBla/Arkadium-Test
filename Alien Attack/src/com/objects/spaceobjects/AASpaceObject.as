package com.objects.spaceobjects
{
	import com.universe.Universe;
	import flash.display.Sprite;
	import flash.events.TimerEvent;
	import flash.text.TextField;
	import flash.utils.Timer;
	import mx.controls.Label;
	import utilities.GlobalTimer;
	
	/**
	 * ...
	 * @author Eugene
	 */
	public class AASpaceObject extends Sprite
	{
		//*******************************************
		protected var _mass:Number = 0;
		
		protected var _verticalAcceleration:Number = 0;
		protected var _horizontalAcceleration:Number = 0;
		protected var _xAcceleration:Number = 0;
		protected var _yAcceleration:Number = 0;
		
		protected var _verticalThrustForce:Number = 0;
		protected var _horizontalThrustForce:Number = 0;
		protected var _xThrustForce:Number = 0;
		protected var _yThrustForce:Number = 0;
		
		protected var _verticalResistanceCoef:Number = 10;
		protected var _horizontalResistanceCoef:Number = 10;
		protected var _xResistanceCoef:Number = 0;
		protected var _yResistanceCoef:Number = 0;
		
		protected var _verticalResistanceForce:Number = 0;
		protected var _horizontalResistanceForce:Number = 0;
		protected var _xResistanceForce:Number = 0;
		protected var _yResistanceForce:Number = 0;
		
		protected var _verticalVelocity:Number = 0;
		protected var _horizontalVelocity:Number = 0;
		protected var _xVelocity:Number = 0;
		protected var _yVelocity:Number = 0;
		
		protected var _rotationForce:Number = 0;
		protected var _rotationResistanceCoef:Number = 70;
		protected var _rotationResistanceForce:Number = 0;
		protected var _rotationAcceleration:Number = 0;
		protected var _rotationSpeed:Number = 0;
		//*********************************************
		
		protected var _universe:Universe;
		
		private var _myTF:TextField = new TextField();
		
		public function AASpaceObject(universe:Universe)
		{
			_universe = universe;
			
			var positionUpdateTimer:GlobalTimer = GlobalTimer.GetInstance();
			positionUpdateTimer.start();
			positionUpdateTimer.addEventListener(TimerEvent.TIMER, PositionUpdate);
			_myTF.textColor = 0xffffff;
			this.addChild(_myTF);
		}
		
		private function CalculateValues():void
		{
			_xThrustForce = _horizontalThrustForce * Math.cos((this.rotation * Math.PI) / 180) + _verticalThrustForce * Math.sin((this.rotation * Math.PI) / 180);
			_yThrustForce = _horizontalThrustForce * Math.sin((this.rotation * Math.PI) / 180) - _verticalThrustForce * Math.cos((this.rotation * Math.PI) / 180);
			
			//calculating resistance fore using resistance coeficient and current value of velocity
			_verticalResistanceForce = _verticalResistanceCoef * _verticalVelocity; // * (Math.abs(_verticalVelocity));
			_horizontalResistanceForce = _horizontalResistanceCoef * _horizontalVelocity; // * (Math.abs(_horizontalVelocity));
			
			var coef:Number = Math.sqrt(Math.pow(_horizontalResistanceCoef, 2) + Math.pow(_verticalResistanceCoef, 2));
			
			
			//_xResistanceCoef = Math.abs(coef * Math.pow(Math.cos((this.rotation * Math.PI) / 180),2) + coef * Math.pow(Math.sin((this.rotation * Math.PI) / 180),2));
			//_yResistanceCoef = Math.abs(coef * Math.pow(Math.sin((this.rotation * Math.PI) / 180),2) + coef * Math.pow(Math.cos((this.rotation * Math.PI) / 180),2));
			
			
			
			_xResistanceCoef = Math.abs(_horizontalResistanceCoef * Math.pow(Math.cos((this.rotation * Math.PI) / 180),2) + _verticalResistanceCoef * Math.pow(Math.sin((this.rotation * Math.PI) / 180),2));
			_yResistanceCoef = Math.abs(_horizontalResistanceCoef * Math.pow(Math.sin((this.rotation * Math.PI) / 180),2) + _verticalResistanceCoef * Math.pow(Math.cos((this.rotation * Math.PI) / 180),2));
			
			
			//_xResistanceForce = _horizontalResistanceForce * Math.cos((this.rotation / 180) * Math.PI) + _verticalResistanceForce * Math.sin((this.rotation / 180) * Math.PI);
			//_yResistanceForce = _horizontalResistanceForce * Math.sin((this.rotation / 180) * Math.PI) - _verticalResistanceForce * Math.cos((this.rotation / 180) * Math.PI);
			
			
			_xResistanceForce = _xResistanceCoef * _xVelocity;
			_yResistanceForce = _yResistanceCoef * _yVelocity;
			
			
			_xAcceleration = (_xThrustForce - _xResistanceForce) / _mass;
			_yAcceleration = (_yThrustForce - _yResistanceForce) / _mass;
			
			_horizontalAcceleration = _xAcceleration * Math.cos((this.rotation / 180) * Math.PI) + _yAcceleration * Math.sin((this.rotation / 180) * Math.PI);
			_verticalAcceleration = _xAcceleration * Math.sin((this.rotation / 180) * Math.PI) - _yAcceleration * Math.cos((this.rotation / 180) * Math.PI);
			
			
			_xVelocity += _xAcceleration;
			_yVelocity += _yAcceleration;
			
			
			_horizontalVelocity = _xVelocity * Math.cos((this.rotation / 180) * Math.PI) + _yVelocity * Math.sin((this.rotation / 180) * Math.PI);
			_verticalVelocity = _xVelocity * Math.sin((this.rotation / 180) * Math.PI) - _yVelocity * Math.cos((this.rotation / 180) * Math.PI);
			
			
			_rotationResistanceForce = _rotationResistanceCoef * Math.abs(_rotationSpeed) * _rotationSpeed;
			_rotationAcceleration = (_rotationForce - _rotationResistanceForce) / _mass;
			_rotationSpeed += _rotationAcceleration;
			
			App.hud._tf.text = "Vertical velocity: " + _verticalVelocity.toFixed(4).toString() + "\n"
			+ "Horizontal velocity: " + _horizontalVelocity.toFixed(4).toString() + "\n"
			+ "X velocity: " + _xVelocity.toFixed(4).toString() + "\n"
			+ "Y velocity: " + _yVelocity.toFixed(4).toString() + "\n"
			+ "****************************************************" + "\n"
			+ "Vertical Thrust: " + _verticalThrustForce.toFixed(4).toString() + "\n"
			+ "Horizontal Thrust: " + _horizontalThrustForce.toFixed(4).toString() + "\n"
			+ "X Thrust: " + _xThrustForce.toFixed(4).toString() + "\n"
			+ "Y Thrust: " + _yThrustForce.toFixed(4).toString() + "\n"
			+ "****************************************************" + "\n"
			+ "Vertical Resistance Coef: " + _verticalResistanceCoef.toFixed(4).toString() + "\n"
			+ "Horizontal Resistance Coef: " + _horizontalResistanceCoef.toFixed(4).toString() + "\n"
			+ "X Resistance Coef: " + _xResistanceCoef.toFixed(4).toString() + "\n"
			+ "Y Resistance Coef: " + _yResistanceCoef.toFixed(4).toString() + "\n"
			+ "****************************************************" + "\n"
			+ "Vertical Resistance Force: " + _verticalResistanceForce.toFixed(4).toString() + "\n"
			+ "Horizontal Resistance Force: " + _horizontalResistanceForce.toFixed(4).toString() + "\n"
			+ "X Resistance Force: " + _xResistanceForce.toFixed(4).toString() + "\n"
			+ "Y Resistance Force: " + _yResistanceForce.toFixed(4).toString() + "\n"
			+ "****************************************************" + "\n"
			+ "Vertical Acceleration: " + _verticalAcceleration.toFixed(4).toString() + "\n"
			+ "Horizontal Acceleration: " + _horizontalAcceleration.toFixed(4).toString() + "\n"
			+ "X Resistance Acceleration: " + _xAcceleration.toFixed(4).toString() + "\n"
			+ "Y Resistance Acceleration: " + _yAcceleration.toFixed(4).toString() + "\n"
			+ "****************************************************" + "\n"
			+ "Rotation Acceleration: " + _rotationAcceleration.toFixed(4).toString() + "\n"
			+ "Rotation Resistance Coef: " + _rotationResistanceCoef.toFixed(4).toString() + "\n"
			+ "Rotation Resistance Force: " + _rotationResistanceForce.toFixed(4).toString() + "\n"
			+ "Rotation Speed: " + _rotationSpeed.toFixed(4).toString() + "\n"
			+ "coef: " + coef;
		}
		
		private function PositionUpdate(evt:TimerEvent):void
		{
			CalculateValues();
			this.y += _yVelocity;
			this.x += _xVelocity;
			
			this.rotation += _rotationSpeed;
			Test();
		}
		
		private function Test():void
		{
			//_myTF.text = ("_yVelocity : " + _yVelocity.toFixed(4) + "\n" + "_xVelocity : " + _xVelocity.toFixed(4) + "\n");
		}
		
		// GETTERS AND SETTERS
		public function get mass():Number
		{
			return _mass;
		}
		
		public function set mass(value:Number):void
		{
			_mass = value;
		}
		
		public function get verticalAcceleration():Number
		{
			return _verticalAcceleration;
		}
		
		public function get horizontalAcceleration():Number
		{
			return _horizontalAcceleration;
		}
		
		public function get xAcceleration():Number
		{
			return _xAcceleration;
		}
		
		public function get yAcceleration():Number
		{
			return _yAcceleration;
		}
		
		public function get verticalThrustForce():Number
		{
			return _verticalThrustForce;
		}
		
		public function set verticalThrustForce(value:Number):void
		{
			_verticalThrustForce = value;
		}
		
		public function get horizontalThrustForce():Number
		{
			return _horizontalThrustForce;
		}
		
		public function set horizontalThrustForce(value:Number):void
		{
			_horizontalThrustForce = value;
		}
		
		public function get verticalResistanceForce():Number
		{
			return _verticalResistanceForce;
		}
		
		public function get horizontalResistanceForce():Number
		{
			return _horizontalResistanceForce;
		}
		
		public function get verticalVelocity():Number
		{
			return _verticalVelocity;
		}
		
		public function get horizontalVelocity():Number
		{
			return _horizontalVelocity;
		}
		
		public function get xVelocity():Number
		{
			return _xVelocity;
		}
		
		public function get yVelocity():Number
		{
			return _yVelocity;
		}
		
		public function get rotationForce():Number
		{
			return _rotationForce;
		}
		
		public function set rotationForce(value:Number):void
		{
			_rotationForce = value;
		}
		
		public function get rotationAcceleration():Number
		{
			return _rotationAcceleration;
		}
		
		public function get rotationSpeed():Number
		{
			return _rotationSpeed;
		}
		
		public function get universe():Universe 
		{
			return _universe;
		}
	}
}