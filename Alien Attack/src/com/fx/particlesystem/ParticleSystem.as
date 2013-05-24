package com.fx.particlesystem
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.geom.Point;
	import flash.utils.Timer;
	
	/**
	 * ...
	 * @author Eugene
	 */
	public class ParticleSystem extends Sprite
	{
		protected var _particle:TestParticle = new TestParticle();
		
		
		protected var _particlesPerSecond:int = 0;
		protected var _xRange:uint = 0;
		protected var _yRange:uint = 0;
		protected var _particleVelocity:int = 0;
		protected var _targetObject:Sprite;
		
		protected var _particleLifeTime:int = 0;
		
		private var _tickEvery:Number = 0;
		
		private var _timer:Timer;
		
		public function ParticleSystem(targetObject:Sprite, particlesPerSecond:int = 20, particleVelocity:int = 0, xRange:uint = 0, yRange:uint = 0)
		{
			//this.addEventListener(Event.ADDED_TO_STAGE, onAddingToStage);
			
			_particlesPerSecond = particlesPerSecond;
			_tickEvery = 1000 / _particlesPerSecond;
			
			_particleVelocity = particleVelocity;
			
			_targetObject = targetObject;
			
			_xRange = xRange;
			_yRange = yRange;
			
			_timer = new Timer(_tickEvery);
			_timer.start();
		}
		
		public function Start():void
		{
			_timer.addEventListener(TimerEvent.TIMER, onTimerTick);
		}
		
		private function onTimerTick(e:Event):void
		{
			var p:Particle = new TestParticle(100);
			p.startVelocity = _particleVelocity;
			p.finishVelocity = _particleVelocity;
			
			p.x = this.x;
			
			p.y = this.y;
			
			if (_xRange != 0)
			{
				p.x += (_xRange / 2) - _xRange * Math.random();
			}
			
			if (_yRange != 0) 
			{
				p.y += (_yRange / 2) - _xRange * Math.random();
			}
			_targetObject.addChild(p);
			p = null;
		}
		
		public function Stop():void
		{
			_timer.removeEventListener(TimerEvent.TIMER, onTimerTick);
		}
		
		public function get particleVelocity():int 
		{
			return _particleVelocity;
		}
		
		public function set particleVelocity(value:int):void 
		{
			_particleVelocity = value;
		}
	
	}

}