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
			if (_ship.mouseY < 0) 
			{
				if (num < -0.2)
				{
					LeftTurn();
				}
				else if (num > 0.2)
				{
					RightTurn();
				}
				else if ((num < 0.2) && (num > -0.2))
				{
					StopTurn();
				}
			}
			else
			{
				StopTurn();
			}
		}
		
		private function onKeyUp(e:KeyboardEvent):void
		{
			if (e.keyCode == Keyboard.W)
			{
				_ship._engine.StopEngine();
				trace("KeyUp W");
			}
			if (e.keyCode == Keyboard.S)
			{
				_ship._engine.StopEngine();
				trace("KeyUp S");
			}
			if (e.keyCode == Keyboard.A)
			{
				_ship._engine.StopEngine();
				trace("KeyUp A");
			}
			if (e.keyCode == Keyboard.D)
			{
				_ship._engine.StopEngine();
				trace("KeyUp D");
			}
			if (e.keyCode == Keyboard.Q)
			{
				_ship._engine.StopTurn();
				trace("KeyUp Q");
			}
			if (e.keyCode == Keyboard.E)
			{
				_ship._engine.StopTurn();
				trace("KeyUp E");
			}
		}
		
		private function onKeyDown(e:KeyboardEvent):void
		{
			if (e.keyCode == Keyboard.W)
			{
				this.MoveForward();
				trace("KeyDown W");
			}
			if (e.keyCode == Keyboard.S)
			{
				this.MoveBackward();
				trace("KeyDown S");
			}
			if (e.keyCode == Keyboard.A)
			{
				this.MoveLeft();
				trace("KeyDown A");
			}
			if (e.keyCode == Keyboard.D)
			{
				this.MoveRight();
				trace("KeyDown D");
			}
			if (e.keyCode == Keyboard.Q)
			{
				this.LeftTurn();
				trace("KeyDown Q");
			}
			if (e.keyCode == Keyboard.E)
			{
				this.RightTurn();
				trace("KeyDown E");
			}
		}
	
	}

}