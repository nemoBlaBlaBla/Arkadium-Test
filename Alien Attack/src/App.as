package
{
	import com.controllers.PlayerController;
	import com.fx.particlesystem.ParticleSystem;
	import com.fx.particlesystem.TestParticle;
	import com.objects.spaceobjects.AAPlayerShip;
	import com.objects.spaceobjects.AASpaceObject;
	import com.objects.spaceobjects.AASpaceShip;
	import com.universe.TestUniverse;
	import com.universe.Universe;
	import flash.display.MovieClip;
	import flash.display.Sprite;
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
		
		public function App()
		{
			//var u:Universe = new Universe();
			var u:Universe = new TestUniverse();
			var so:AASpaceShip = new AAPlayerShip(u);
			
			u.addChild(so);
			
			var game:Game = new Game(u);
			game.focusObject = so;
			
			
			/*
			var ps:ParticleSystem = new ParticleSystem(this, 20, 20, 20, 0);
			this.addChild(ps);
			ps.Start();
			*/
			this.addChild(game);
			//this.addChild(u);
			so.rotation = 0;
			//u.SetCameraTo(so);
			this.addChild(hud);
			//trace(stage.stageHeight);
		}
	}
}