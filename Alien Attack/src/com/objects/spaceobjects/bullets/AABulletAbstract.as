package com.objects.spaceobjects.bullets 
{
	import com.behaviours.AABulletBehaviour;
	import com.objects.spaceobjects.AASpaceObject;
	import com.universe.AAUniverse;
	import com.utilities.AAGlobalTimer;
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
		protected var _tag:String;
		
		[Embed(source="../../../../lib/images/bullets/blaster_shell.png")]
		private var ShellView:Class;
		
		public function AABulletAbstract(universe:AAUniverse,  angle:Number = 0) 
		{
			super(universe);
			this.behaviour = AABulletBehaviour.SharedInstance();
			
			this.rotation = angle;
			
			this.addEventListener(Event.ADDED_TO_STAGE, OnAddingToStage);
		}
		
//{ EVENT HANDLERS
		private function OnAddingToStage(e:Event):void 
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, OnAddingToStage);
			
			this.mass = 0;
			this.velocity = new Point(_startVelocity * Math.sin((this.rotation * Math.PI) / 180), -_startVelocity * Math.cos((this.rotation * Math.PI) / 180));
			
			this._lifeTimer = AAGlobalTimer.SharedInstance();
			this._lifeTimer.addEventListener(TimerEvent.TIMER, OnTimer);
		}
		
		private function OnTimer(e:TimerEvent):void 
		{			
			this._lifeTimeInMS -= this._lifeTimer.delay;
			if (this._lifeTimeInMS < 0)
			{
				this.DestroyShell();
			}
		}
//}


		public function DestroyShell() : void
		{
			this._lifeTimer.removeEventListener(TimerEvent.TIMER, OnTimer);
			this._lifeTimer = null;
			this.Destroy();
		}
		
		
//{ GETTERS AND SETTERS
		public function get damage():Number 
		{
			return _damage;
		}
		
		public function set damage(value:Number):void 
		{
			_damage = value;
		}
		
		public function get tag():String 
		{
			return _tag;
		}
		
		public function set tag(value:String):void 
		{
			_tag = value;
		}
	}
//}
}