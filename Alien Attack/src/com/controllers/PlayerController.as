package com.controllers
{
	import com.objects.spaceobjects.AASpaceShip;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.TimerEvent;
	import flash.geom.Point;
	import flash.ui.Keyboard;
	import flash.utils.Timer;
	import utilities.GlobalTimer;
	
	/**
	 * ...
	 * @author Eugene
	 */
	public class PlayerController extends Controller
	{
		
		public function PlayerController(ship:AASpaceShip)
		{
			super(ship);
			_ship.addChild(this);
			this.addEventListener(Event.ADDED_TO_STAGE, onAddToStage);
		}
		
		private function onAddToStage(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddToStage);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
			
			var controllerTimer:GlobalTimer = GlobalTimer.GetInstance();
			controllerTimer.addEventListener(TimerEvent.TIMER, onTimerTick);
		}
		
		private function onTimerTick(e:TimerEvent):void 
		{
			//trace(_ship.mouseX);
			
			var num:Number = Math.atan2(_ship.mouseY, _ship.mouseX);
			num = num + (90 * (Math.PI / 180));
			//trace(Math.sin(num));
			//trace(_ship.mouseY);
			num = Math.sin(num);
			//if (_ship.mouseY < 0) 
			//{
				if (num < -0.2)
				{
					_ship.TurnLeft(true);
				}
				else if (num > 0.05)
				{
					_ship.TurnRight(true);
				}
				else if ((num < 0.05) && (num > -0.2))
				{
					_ship.StopTurn();
				}
			//}
			//else
			//{
				//_ship.StopTurn();
			//}
		}
		
		private function onKeyUp(e:KeyboardEvent):void
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
		
		private function onKeyDown(e:KeyboardEvent):void
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
	
	}

}