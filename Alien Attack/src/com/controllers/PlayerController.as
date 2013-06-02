package com.controllers
{
	import com.objects.spaceobjects.AAAlienShip;
	import com.objects.spaceobjects.AAISpaceObjectDelegate;
	import com.objects.spaceobjects.AASpaceObject;
	import com.objects.spaceobjects.AASpaceShip;
	import flash.display.Sprite;
	import flash.events.KeyboardEvent;
	import flash.geom.Point;
	import flash.ui.Keyboard;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import utilities.AAGameParameters;
	import com.objects.spaceobjects.AACannonShell;
	import com.objects.spaceobjects.shells.AABlasterShell;
	
	/**
	 * ...
	 * @author Eugene
	 */
	public class PlayerController extends Controller implements AAISpaceObjectDelegate
	{
		
		//private var _ship:AASpaceShip;
		
		public function PlayerController(ship:AASpaceShip)
		{
			super(ship);
			//_ship = ship;
			//_ship.addChild(this);
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
			
			if (_ship.x < 0)
			{
				_ship.x = 0;
			}
			else if (_ship.x > stage.stageWidth)
			{
				_ship.x = stage.stageWidth;
			}
			
			AAGameParameters.sharedInstance().playerPosition.x = _ship.x;
			AAGameParameters.sharedInstance().playerPosition.y = _ship.y;
		}
		
		/* INTERFACE com.objects.spaceobjects.AAISpaceObjectDelegate */
		
		public function OnHit(currentObject:AASpaceObject, hittedObject:AASpaceObject):void 
		{
			if (hittedObject is AAAlienShip)
			{
				(currentObject as AASpaceShip).health -= 25;
				//trace("Health = " + (currentObject as AASpaceShip).health);
				if ((currentObject as AASpaceShip).health < 0)
				{
					(currentObject as AASpaceShip).Destroy();
				}
			}
			else if (hittedObject is AABlasterShell)
			{
				_ship.health -= (hittedObject as AACannonShell).damage;
				
				(hittedObject as AACannonShell).DestroyShell();
			}
		}
		
		public function OnDestroy(currentObject:AASpaceObject):void 
		{
			stage.removeEventListener(KeyboardEvent.KEY_DOWN, OnKeyDown);
			stage.removeEventListener(KeyboardEvent.KEY_UP, OnKeyUp);
			stage.removeEventListener(MouseEvent.MOUSE_DOWN, OnMouse);
			stage.removeEventListener(MouseEvent.MOUSE_UP, OnMouse);
			_ship.Fire(false);
			//trace("Destroyed!!!");
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