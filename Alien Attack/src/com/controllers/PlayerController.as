package com.controllers
{
	import com.objects.spaceobjects.AAISpaceObjectDelegate;
	import com.objects.spaceobjects.AASpaceObject;
	import com.objects.spaceobjects.AASpaceShip;
	import flash.display.Sprite;
	import flash.events.KeyboardEvent;
	import flash.geom.Point;
	import flash.ui.Keyboard;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
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
		}
		
		/* INTERFACE com.objects.spaceobjects.AAISpaceObjectDelegate */
		
		public function OnHit(currentObject:AASpaceObject, hittedObject:AASpaceObject):void 
		{
			//trace("HIT!!! HIT!!! HIT!!!");
			(currentObject as AASpaceShip).health -= 1;
			trace("Health = " + (currentObject as AASpaceShip).health);
			if ((currentObject as AASpaceShip).health < 0)
			{
				(currentObject as AASpaceShip).Destroy();
			}
		}
		
		public function OnDestroy(currentObject:AASpaceObject):void 
		{
			trace("Destroyed!!!");
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