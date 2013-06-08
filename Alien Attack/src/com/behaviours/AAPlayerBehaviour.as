package com.behaviours
{
	import com.behaviours.AAISpaceObjectBehaviour;
	import com.fx.explosions.AABigExplosion;
	import com.objects.spaceobjects.AASpaceObject;
	import com.objects.spaceobjects.bullets.AABlasterShell;
	import com.objects.spaceobjects.bullets.AABulletAbstract;
	import com.objects.spaceobjects.bullets.AAHeavyBlasterShell;
	import com.objects.spaceobjects.ships.AASpaceShip;
	import com.utilities.AAGameParameters;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.ui.Keyboard;
	
	/**
	 * ...
	 * @author Eugene
	 */
	public class AAPlayerBehaviour extends Sprite implements AAISpaceObjectBehaviour
	{
		
		public const TAG:String = "player";
		
		private var _ship:AASpaceShip = null;
		
		public function AAPlayerBehaviour(ship:AASpaceShip)
		{
			_ship = ship;
			_ship.addChild(this);
			addEventListener(Event.ADDED_TO_STAGE, OnAddToStage);
		}
		
		private function OnAddToStage(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, OnAddToStage);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, OnKeyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, OnKeyUp);
			stage.addEventListener(MouseEvent.MOUSE_DOWN, OnMouse);
			stage.addEventListener(MouseEvent.MOUSE_UP, OnMouse);
		}
		
		private function OnMouse(e:MouseEvent):void 
		{
			if (e.type == MouseEvent.MOUSE_DOWN)
			{
				_ship.Fire(true);
			}
			else
			{
				_ship.Fire(false);
			}
		}
		
		
		public function Update(currentObject:AASpaceObject) : void
		{
			var num:Number = Math.atan2(_ship.mouseY, _ship.mouseX);
			num = num + (90 * (Math.PI / 180));
			num = Math.sin(num);

			if (num < -0.1)
			{
				_ship.TurnLeft(true);
			}
			else if (num > 0.1)
			{
				_ship.TurnRight(true);
			}
			else if ((num < 0.05) && (num > -0.05))
			{
				_ship.StopTurn();
			}
			
			if (stage)
			{
				if (_ship.x < 0)
				{
					_ship.x = 0;
				}
				else if (_ship.x > stage.stageWidth)
				{
					_ship.x = stage.stageWidth;
				}
			}
			
			AAGameParameters.sharedInstance().playerPosition.x = _ship.x;
			AAGameParameters.sharedInstance().playerPosition.y = _ship.y;
		}
		
		/* INTERFACE com.objects.spaceobjects.AAISpaceObjectBehaviour */
		
		public function OnHit(currentObject:AASpaceObject, hittedObject:AASpaceObject):void 
		{
			if (hittedObject is AASpaceShip)
			{
				(currentObject as AASpaceShip).health -= 25;
			}
			else if (hittedObject is AABulletAbstract && ((hittedObject as AABulletAbstract).tag == "alien"))
			{
				_ship.health -= (hittedObject as AABulletAbstract).damage;
				
				(hittedObject as AABulletAbstract).DestroyShell();
			}
			
			if (_ship.health <= 0)
			{
				stage.removeEventListener(KeyboardEvent.KEY_DOWN, OnKeyDown);
				stage.removeEventListener(KeyboardEvent.KEY_UP, OnKeyUp);
				stage.removeEventListener(MouseEvent.MOUSE_DOWN, OnMouse);
				stage.removeEventListener(MouseEvent.MOUSE_UP, OnMouse);
				_ship.Destroy();
			}
		}
		
		public function OnDestroy(currentObject:AASpaceObject):void 
		{
			_ship.Fire(false);
			
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
			ship = null;
		}
		
		
//{ KEYBOARD HANDLERS
		private function OnKeyUp(e:KeyboardEvent):void
		{
			switch (e.keyCode) 
			{
				case Keyboard.W: 
				_ship.MoveForward(false);	
				break;
				
				case Keyboard.S: 
				_ship.MoveBackward(false);	
				break;
				
				case Keyboard.A: 
				_ship.MoveLeft(false);	
				break;
				
				case Keyboard.D: 
				_ship.MoveRight(false);	
				break;
				
				case Keyboard.Q: 
				_ship.TurnLeft(false);	
				break;
				
				case Keyboard.E: 
				_ship.TurnRight(false);	
				break;
				
				default:
				_ship.Stop();
			}
		}
		
		private function OnKeyDown(e:KeyboardEvent):void
		{
			switch (e.keyCode) 
			{
				case Keyboard.W: 
				_ship.MoveForward(true);	
				break;
				
				case Keyboard.S: 
				_ship.MoveBackward(true);	
				break;
				
				case Keyboard.A: 
				_ship.MoveLeft(true);	
				break;
				
				case Keyboard.D: 
				_ship.MoveRight(true);	
				break;
				
				case Keyboard.Q: 
				_ship.TurnLeft(true);	
				break;
				
				case Keyboard.E: 
				_ship.TurnRight(true);	
				break;
				
				default:
				_ship.Stop();
			}
		}
//}
	}
}