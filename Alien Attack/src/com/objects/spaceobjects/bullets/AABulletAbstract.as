package com.objects.spaceobjects.bullets 
{
	import com.behaviours.AABulletBehaviour;
	import com.objects.spaceobjects.AASpaceObject;
	import com.universe.AAUniverse;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.geom.Point;
	import flash.utils.Timer;
	
	/**
	 * ...
	 * @author Eugene Tkachenko
	 */
	public class AABulletAbstract extends AASpaceObject 
	{
		protected var _damage : Number = 3;
		protected var _lifeTimeInMS : Number = 750;
		private var _lifeTimer:Timer;
		protected var _startVelocity : Number = 0;
		
		[Embed(source="../../../../lib/images/bullets/blaster_shell.png")]
		private var ShellView:Class;
		
		public function AABulletAbstract(universe:AAUniverse,  angle:Number = 0) 
		{
			super(universe);
			this.behaviour = new AABulletBehaviour();
			
			this.rotation = angle;
			
			this.addEventListener(Event.ADDED_TO_STAGE, OnAddingToStage);
		}
		
		private function OnAddingToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, OnAddingToStage);
			
			this.mass = 0;
			this.velocity = new Point(_startVelocity * Math.sin((this.rotation * Math.PI) / 180), -_startVelocity * Math.cos((this.rotation * Math.PI) / 180));
			this.view.x = -view.width / 2;
			this.view.y = -view.height / 2;
			this.addChild(this.view);
			
			_lifeTimer = new Timer(_lifeTimeInMS, 1);
			_lifeTimer.addEventListener(TimerEvent.TIMER, OnTimer);
			_lifeTimer.start();
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
			_lifeTimer.removeEventListener(TimerEvent.TIMER, OnTimer);
			_lifeTimer.stop();
			_lifeTimer = null;
			this.Destroy();
		}
	}
}