package
{
	import com.controllers.PlayerController;
	import com.fx.particlesystem.ParticleSystem;
	import com.fx.particlesystem.TestParticle;
	import com.objects.spaceobjects.AAAlienShip;
	import com.objects.spaceobjects.AAPlayerShip;
	import com.objects.spaceobjects.AASpaceObject;
	import com.objects.spaceobjects.AASpaceShip;
	import com.universe.TestUniverse;
	import com.universe.Universe;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import utilities.HUD;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	
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