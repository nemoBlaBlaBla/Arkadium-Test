package
{
	import com.objects.spaceobjects.*;
	import com.universe.*;
	import flash.display.*;
	import flash.events.*;
	import flash.utils.*;
	import utilities.*;
	import mx.containers.*;
	/**
	 * ...
	 * @author Eugene
	 */
	public class App extends MovieClip
	{
		/*
		[Embed(source="/lib/ship.svg")]
		public var ShipView:Class;
		*/
		
		public static var hud:HUD = new HUD();
		
		private var _universe:Universe;
		private var _delay:Number = 1000;
		
		public function App()
		{
			_universe = new TestUniverse();
			var game:Game = new Game(_universe);
			this.addChild(game);
			
			this.addEventListener(Event.ADDED_TO_STAGE, OnAddingToStage);

			var spawnTimer:Timer = new Timer(_delay, 0);
			spawnTimer.addEventListener(TimerEvent.TIMER, OnSpawnTimer);
			spawnTimer.start();
			
			//var mh:utilities.MyHUD = new utilities.MyHUD();
			//this.addChildAt(mh, 0);
		}
		
		private function OnAddingToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, OnAddingToStage);
			var so:AASpaceShip = new AAPlayerShip(_universe);
			so.rotation = 0;
			so.x = stage.stageWidth / 2;
			so.y = stage.stageHeight - 50;
			_universe.addChild(so);
		}
		
		private function OnSpawnTimer(e:TimerEvent):void 
		{
			var so2:AASpaceShip = new AAAlienShip(_universe);
			so2.rotation = 180;
			so2.y = -200;
			so2.x = Math.random() * stage.stageWidth;
			_universe.addChild(so2);
		}
	}
}