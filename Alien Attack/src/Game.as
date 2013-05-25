package  
{
	import com.objects.spaceobjects.AASpaceObject;
	import com.universe.Universe;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import utilities.GlobalTimer;
	/**
	 * ...
	 * @author Eugene
	 */
	public class Game extends Sprite 
	{
		
		protected var _universe:Universe;
		protected var _focusObject:AASpaceObject;
				
		public function Game(universe:Universe)
		{
			_universe = universe;
			this.addChild(_universe);
			this.addEventListener(Event.ADDED_TO_STAGE, onAddingToStage);
		}
		
		private function onAddingToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddingToStage);

			
			var timer:GlobalTimer = GlobalTimer.GetInstance();
			timer.start();
			timer.addEventListener(TimerEvent.TIMER, onTimerTick);
		}
		
		private function onTimerTick(e:TimerEvent):void 
		{
			this.x = stage.stageWidth / 2;
			this.y = 4 * stage.stageHeight / 5;			
			//try 
			//{
				//_universe.x = - _focusObject.x;
				//_universe.y = - _focusObject.y;
				//this.rotation = - _focusObject.rotation;
			//}
			//catch (err:Error)
			//{
				//trace(err.getStackTrace().toString());
			//}
		}
		
		public function get focusObject():AASpaceObject 
		{
			return _focusObject;
		}
		
		public function set focusObject(value:AASpaceObject):void 
		{
			_focusObject = value;
		}
	}

}