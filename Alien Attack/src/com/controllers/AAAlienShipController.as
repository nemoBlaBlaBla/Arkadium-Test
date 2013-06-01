package com.controllers 
{
	import com.objects.spaceobjects.AACannonShell;
	import com.objects.spaceobjects.AAISpaceObjectDelegate;
	import com.objects.spaceobjects.AAPlayerShip;
	import com.objects.spaceobjects.AASpaceObject;
	import com.objects.spaceobjects.AASpaceShip;
	import flash.events.Event;
	import flash.geom.Point;
	import views.GameView;
	import utilities.AAGameParameters;
	
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
			if (Math.random() - 0.5 > 0)
			{
				_ship.MoveLeft(true);
				_ship.MoveRight(false);
			}
			else
			{
				_ship.MoveLeft(false);
				_ship.MoveRight(true);
			}
			
			if (stage && (currentObject.y > stage.stageHeight + 100))
			{
				_ship.Destroy();
			}
		}
		
		public function OnHit(currentObject:AASpaceObject, hittedObject:AASpaceObject):void 
		{
			if (hittedObject is AACannonShell)
			{
				_ship.health -= (hittedObject as AACannonShell).damage;
				
				(hittedObject as AACannonShell).DestroyShell();
			}
			else if (hittedObject is AAPlayerShip) 
			{
				AAGameParameters.sharedInstance().playerScore -= 100;
				_ship.health -= 100;
			}
			
			if (_ship.health <= 0)
			{
				AAGameParameters.sharedInstance().playerScore += 30;
				_ship.Destroy();
			}
		}
		
		public function OnDestroy(currentObject:AASpaceObject):void 
		{
			_ship.engine.Destroy();
			trace("DESTROYED!!!");
		}
		
	}

}