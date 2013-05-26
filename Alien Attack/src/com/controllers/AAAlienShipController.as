package com.controllers 
{
	import com.objects.spaceobjects.AACannonShell;
	import com.objects.spaceobjects.AAISpaceObjectDelegate;
	import com.objects.spaceobjects.AAPlayerShip;
	import com.objects.spaceobjects.AASpaceObject;
	import com.objects.spaceobjects.AASpaceShip;
	import flash.events.Event;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author Eugene Tkachenko
	 */
	public class AAAlienShipController extends Controller implements AAISpaceObjectDelegate 
	{
		
		public function AAAlienShipController(ship:AASpaceShip) 
		{
			super(ship);
			addEventListener(Event.ADDED_TO_STAGE, OnAddToStage);
		}
		
		private function OnAddToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, OnAddToStage);
			trace("Added to stage  " + stage.stageHeight);
		}
		
		/* INTERFACE com.objects.spaceobjects.AAISpaceObjectDelegate */
		
		public function Update(currentObject:AASpaceObject):void 
		{
			_ship.MoveBackward(true);
			
			if (stage && (localToGlobal(new Point(0, _ship.y)).y > stage.stageHeight + 300))
			{
				_ship.Destroy();
			}
		}
		
		public function OnHit(currentObject:AASpaceObject, hittedObject:AASpaceObject):void 
		{
			if (hittedObject is AACannonShell)
			{
				_ship.health -= (hittedObject as AACannonShell).damage;
				hittedObject.Destroy();
			}
			else if (hittedObject is AAPlayerShip) 
			{
				_ship.health -= 100;
			}
			//trace("HEALTH = " + _ship.health);
			
			if (_ship.health <= 0)
			{
				_ship.Destroy();
			}
		}
		
		public function OnDestroy(currentObject:AASpaceObject):void 
		{
			trace("DESTROYED!!!");
		}
		
	}

}