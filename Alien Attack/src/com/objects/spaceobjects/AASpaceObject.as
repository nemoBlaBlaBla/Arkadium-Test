package com.objects.spaceobjects
{
	import com.behaviours.AAISpaceObjectBehaviour;
	import com.universe.AAUniverse;
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author Eugene
	 */
	public class AASpaceObject extends Sprite
	{
		private var _universe:AAUniverse;
		
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
		
		private var _view : Bitmap = new Bitmap();
		private var _behaviour:AAISpaceObjectBehaviour;
		
		public function AASpaceObject(universe:AAUniverse)
		{
			_universe = universe;
			this.addEventListener(Event.ENTER_FRAME, OnEnterFrame);
		}
		
		public function Destroy() : void
		{
			if (behaviour)
			{
				behaviour.OnDestroy(this);
			}
			
			if (parent)
			{
				parent.removeChild(this);
			}
			this.removeEventListener(Event.ENTER_FRAME, OnEnterFrame);
			view.bitmapData.dispose();
			view = null;
		}
		
		private function OnEnterFrame(e:Event):void 
		{
			if (behaviour)
			{
				behaviour.Update(this);
			}
			
			this.PositionUpdate();
			
			for (var i:int = 0; i < universe.numChildren; i++) 
			{
				try 
				{
					if (hitTestObject(universe.getChildAt(i)) && (universe.getChildAt(i) is AASpaceObject) && i != universe.getChildIndex(this))
					{
						if (behaviour)
						{
							behaviour.OnHit(this, universe.getChildAt(i) as AASpaceObject);
						}
					}
				}
				catch (err:Error)
				{
					trace(err.name);
					trace(err.message);
					trace(err.getStackTrace());
				}
			}
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
			if (this.mass != 0)
			{
				UpdateValues();
				this.rotation += angularVelocity;
			}
			this.x += this.velocity.x;
			this.y += this.velocity.y;
		}
		
		public function DrawBounds() : void
		{
			this.graphics.lineStyle(2, 0x00FF00, 1);
			this.graphics.drawRect(view.x, view.y, view.width, view.height);
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
		
		public function get view():Bitmap 
		{
			return _view;
		}
		
		public function set view(value:Bitmap):void 
		{
			_view = value;
		}
		
		public function get universe():AAUniverse 
		{
			return _universe;
		}
		
		public function get behaviour():AAISpaceObjectBehaviour 
		{
			return _behaviour;
		}
		
		public function set behaviour(value:AAISpaceObjectBehaviour):void 
		{
			_behaviour = value;
		}
//}
	}
}