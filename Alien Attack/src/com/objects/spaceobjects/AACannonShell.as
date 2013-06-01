package com.objects.spaceobjects 
{
	import com.controllers.AACannonShellBehaviourDelegate;
	import com.universe.Universe;
	import flash.events.TimerEvent;
	import flash.geom.Point;
	import flash.utils.Timer;
	
	/**
	 * ...
	 * @author Eugene Tkachenko
	 */
	public class AACannonShell extends AASpaceObject 
	{
		private var _damage : Number = 7;
		private var _lifeTime : Number = 0.75;
		private var _lifeTimer:Timer;
		private var _startVelocity : Number = 0;
		
		//[Embed(source = "/lib/FireParticleTest3.svg")]
		[Embed(source = "/lib/CanonShell.png")]
		private var ShellView:Class;
		
		public function AACannonShell(universe:Universe, startVelocity:Number, angle:Number = 0) 
		{
			super(universe);
			
			this.mass = 0;
			
			this.view = new ShellView();
			this.view.x = -view.width / 2;
			this.view.y = -view.height / 2;
			this.addChild(this.view);
			
			this.velocity = new Point(startVelocity * Math.sin((angle * Math.PI) / 180), -startVelocity * Math.cos((angle * Math.PI) / 180));
			this.rotation = angle;
			
			_lifeTimer = new Timer(_lifeTime * 1000, 1);
			_lifeTimer.addEventListener(TimerEvent.TIMER, OnTimer);
			_lifeTimer.start();
			
			
			this.delegate = new AACannonShellBehaviourDelegate();
		}
		
		private function OnTimer(e:TimerEvent):void 
		{
			this.DestroyShell();
		}
		
		public function get damage():Number 
		{
			return _damage;
		}
		
		public function set damage(value:Number):void 
		{
			_damage = value;
		}
		
		public function DestroyShell() : void
		{
			_lifeTimer.stop();
			_lifeTimer.removeEventListener(TimerEvent.TIMER, OnTimer);
			this.Destroy();
		}
	}
}