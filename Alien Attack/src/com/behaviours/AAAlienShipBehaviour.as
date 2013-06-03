package com.behaviours 
{
	import com.behaviours.AAISpaceObjectBehaviour;
	import com.fx.explosions.AABigExplosion;
	import com.objects.spaceobjects.AASpaceObject;
	import com.objects.spaceobjects.bullets.AABulletAbstract;
	import com.objects.spaceobjects.bullets.AAGunBullet;
	import com.objects.spaceobjects.ships.AAPlayerShip;
	import com.objects.spaceobjects.ships.AASpaceShip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	import com.utilities.AAGameParameters;
	
	/**
	 * ...
	 * @author Eugene Tkachenko
	 */
	public class AAAlienShipBehaviour extends Sprite implements AAISpaceObjectBehaviour 
	{
		
		public function AAAlienShipBehaviour() 
		{
			addEventListener(Event.ADDED_TO_STAGE, OnAddToStage);
		}
		
		private function OnAddToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, OnAddToStage);
		}
		
		/* INTERFACE com.objects.spaceobjects.AAISpaceObjectBehaviour */
		
		public function Update(currentObject:AASpaceObject):void 
		{
			var ship:AASpaceShip = currentObject as AASpaceShip;
			ship.MoveBackward(true);
			if (Math.random() - 0.5 > 0)
			{
				ship.MoveLeft(true);
				ship.MoveRight(false);
			}
			else
			{
				ship.MoveLeft(false);
				ship.MoveRight(true);
			}
			
			if (stage && (ship.y > stage.stageHeight + 100))
			{
				ship.universe.removeChild(ship);
				ship.Destroy();
			}
			
			var playerPos:Point = AAGameParameters.sharedInstance().playerPosition;
			if (Math.abs(playerPos.x - ship.x) < 50 && (playerPos.y > ship.y))
			{
				ship.Fire(true);
			}
			else
			{
				ship.Fire(false);
			}
		}
		
		public function OnHit(currentObject:AASpaceObject, hittedObject:AASpaceObject):void 
		{
			var ship:AASpaceShip = currentObject as AASpaceShip;
			if (hittedObject is AAGunBullet)
			{
				ship.health -= (hittedObject as AABulletAbstract).damage;
				
				(hittedObject as AABulletAbstract).DestroyShell();
			}
			else if (hittedObject is AAPlayerShip) 
			{
				AAGameParameters.sharedInstance().playerScore -= 100;
				ship.health -= 100;
			}
			
			if (ship.health <= 0)
			{
				AAGameParameters.sharedInstance().playerScore += 30;
				ship.Destroy();
			}
		}
		
		public function OnDestroy(currentObject:AASpaceObject):void 
		{
			var ship:AASpaceShip = currentObject as AASpaceShip;
			ship.engine.Destroy();
			ship.Fire(false);
			if (currentObject.stage && (currentObject.y < currentObject.stage.stageHeight + 100))
			{
				var explosion:AABigExplosion = new AABigExplosion(currentObject.universe);
				explosion.x = currentObject.x;
				explosion.y = currentObject.y;
				explosion.Explode();
				explosion = null;
			}
		}
		
	}

}