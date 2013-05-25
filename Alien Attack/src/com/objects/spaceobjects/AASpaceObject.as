package com.objects.spaceobjects
{
	import com.universe.Universe;
	import flash.display.Sprite;
	import flash.events.TimerEvent;
	import flash.geom.Point;
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
		private var _universe:Universe;
		
		private var _mass:Number = 0;
		
		private var _force : Point = new Point(0, 0);
		private var _acceleration : Point = new Point(0, 0);
		private var _velocity : Point = new Point(0, 0);
		private var _resistanceFactor : Number = 0;
		private var _resistanceForce : Point= new Point(0, 0);
		
		private var _angularForce : Number = 0;
		private var _angularAcceleration : Number = 0;
		private var _angularVelocity : Number = 0;
		private var _angularResistanceFactor : Number = 0;
		private var _angularResistanceForce : Number = 0;
		//*********************************************
		
		
		public function AASpaceObject(universe:Universe)
		{
			_universe = universe;
			
			var updateTimer:GlobalTimer = GlobalTimer.GetInstance();
			updateTimer.start();
			updateTimer.addEventListener(TimerEvent.TIMER, OnTimerTick);
		}
		
		
		private function UpdateValues():void
		{
			this.resistanceForce = new Point(this.velocity.x * this.resistanceFactor, this.velocity.y * this.resistanceFactor);
			this.acceleration =  new Point(this.force.subtract(this.resistanceForce).x / this.mass, this.force.subtract(this.resistanceForce).y / this.mass); 
			this.velocity = this.velocity.add(this.acceleration);
			
			this._angularResistanceForce = angularVelocity * this._angularResistanceFactor;
			this.angularAcceleration = (this.angularForce - this.angularResistanceForce) / mass;
			this.angularVelocity += this.angularAcceleration;
		}
		
		
		private function PositionUpdate() : void
		{
			UpdateValues();
			this.x += this.velocity.x;
			this.y += this.velocity.y;
			this.rotation += angularVelocity;
			
			trace("Force X - " + this.force.x + "\n");
			//trace("Velocity X - " + this.velocity.x + "\n");
			//trace("Position X - " + this.x);
		}
		
		
		private function OnTimerTick(evt : TimerEvent) : void
		{
			this.PositionUpdate();
			
			// maybe, there will be delegate metod "Update(spaceObject : SpaceObject)" call
		}
		
//{ PROPERTIES GETTERS AND SETTERS		
		
		public function get mass():Number 
		{
			return _mass;
		}
		
		public function set mass(value:Number):void 
		{
			_mass = value;
		}
		
		public function get acceleration():Point 
		{
			return _acceleration;
		}
		
		public function set acceleration(value:Point):void 
		{
			_acceleration = value;
		}
		
		public function get velocity():Point 
		{
			return _velocity;
		}
		
		public function set velocity(value:Point):void 
		{
			_velocity = value;
		}
		
		public function get resistanceFactor():Number
		{
			return _resistanceFactor;
		}
		
		public function set resistanceFactor(value:Number):void 
		{
			_resistanceFactor = value;
		}
		
		public function get angularForce():Number 
		{
			return _angularForce;
		}
		
		public function set angularForce(value:Number):void 
		{
			_angularForce = value;
		}
		
		public function get angularAcceleration():Number 
		{
			return _angularAcceleration;
		}
		
		public function set angularAcceleration(value:Number):void 
		{
			_angularAcceleration = value;
		}
		
		public function get angularVelocity():Number 
		{
			return _angularVelocity;
		}
		
		public function set angularVelocity(value:Number):void 
		{
			_angularVelocity = value;
		}
		
		public function get angularResistanceFactor():Number 
		{
			return _angularResistanceFactor;
		}
		
		public function set angularResistanceFactor(value:Number):void 
		{
			_angularResistanceFactor = value;
		}
		
		public function get resistanceForce():Point 
		{
			return _resistanceForce;
		}
		
		public function set resistanceForce(value:Point):void 
		{
			_resistanceForce = value;
		}
		
		public function get angularResistanceForce():Number 
		{
			return _angularResistanceForce;
		}
		
		public function set angularResistanceForce(value:Number):void 
		{
			_angularResistanceForce = value;
		}
		
		public function get force():Point 
		{
			return _force;
		}
		
		public function set force(value:Point):void 
		{
			_force = value;
		}
//}
	}
}