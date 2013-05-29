package com.fx.particlesystem
{
	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.geom.Point;
	import flash.utils.Timer;
	import mx.controls.NumericStepper;
	import mx.formatters.NumberBaseRoundType;
	
	/**
	 * ...
	 * @author Eugene
	 */
	public class ParticleSystem extends Sprite
	{
		[Embed(source="/lib/BlueFireParticleTest3.svg")]
		public var ParticleView:Class;
		
		//properties
		private var _particleBitmapView:Sprite = new ParticleView();
		
		private var _particlesPerSecond:int = 10;
		
		private var _particleLifeTime:int = 1000;
		
		private var _xRange:uint = 0;
		private var _yRange:uint = 0;
		
		private var _particleStartVelocity:Number = 0;
		private var _particleEndVelocity:Number = 0
		
		private var _particleStartAlpha:Number = 1;
		private var _particleEndAlpha:Number = 1;
		
		private var _particleStartScale:Number = 0;
		private var _particleEndScale:Number = 0;
		
		private var _emitFromAngle:Number = 0;
		private var _emitToAngle:Number = 0;
		
		//private fields
		private var _tickEvery:Number = 0;
		private var _timer:Timer;
		
		public function ParticleSystem(particlesPerSecond:int = 20, particleVelocity:int = 0, xRange:uint = 0, yRange:uint = 0)
		{
			//this.addEventListener(Event.ADDED_TO_STAGE, onAddingToStage);
			_particlesPerSecond = particlesPerSecond;
			
			_tickEvery = 1000 / _particlesPerSecond;
			
			_particleStartVelocity = particleVelocity;
			_particleEndVelocity = particleVelocity;
			
			_xRange = xRange;
			_yRange = yRange;
			
			_timer = new Timer(_tickEvery);
			_timer.start();
		}
		
		public function Start():void
		{
			_timer.addEventListener(TimerEvent.TIMER, OnTimerTick);
		}
		
		private function OnTimerTick(e:Event):void
		{	
			var p:Particle = new Particle();
			p.particleLifeTime = this.particleLifeTime;
			
			p.particleStartVelocity = this.particleStartVelocity;
			p.particleEndVelocity = this.particleEndVelocity;
			
			p.particleStartAlpha = this.particleStartAlpha;
			p.particleEndAlpha = this.particleEndAlpha;
			
			p.particleStartScale = this.particleStartScale;
			p.particleEndScale = this.particleEndScale;
			
			//p.x = this.x + (_xRange / 2) - _xRange * Math.random();
			//p.y = this.y + (_yRange / 2) - _yRange * Math.random();
			
			p.x = this.x;
			p.y = this.y;
			
			p.rotation = this.emitFromAngle + (this.emitFromAngle - this.emitToAngle) * Math.random();

			parent.addChild(p);
		}
		
		public function Stop():void
		{
			_timer.stop();
			//_timer.removeEventListener(TimerEvent.TIMER, onTimerTick);
		}
		
//{ PROPERTIES GETTERS AND SETTERS

		public function get particleBitmapView():Sprite 
		{
			return _particleBitmapView;
		}
		
		public function set particleBitmapView(value:Sprite):void 
		{
			_particleBitmapView = value;
		}

		public function get particlesPerSecond():int 
		{
			return _particlesPerSecond;
		}
		
		public function set particlesPerSecond(value:int):void 
		{
			_particlesPerSecond = value;
		}
		
		public function get particleLifeTime():int 
		{
			return _particleLifeTime;
		}
		
		public function set particleLifeTime(value:int):void 
		{
			_particleLifeTime = value;
		}
		
		public function get xRange():uint 
		{
			return _xRange;
		}
		
		public function set xRange(value:uint):void 
		{
			_xRange = value;
		}
		
		public function get yRange():uint 
		{
			return _yRange;
		}
		
		public function set yRange(value:uint):void 
		{
			_yRange = value;
		}
		
		public function get particleStartVelocity():Number 
		{
			return _particleStartVelocity;
		}
		
		public function set particleStartVelocity(value:Number):void 
		{
			_particleStartVelocity = value;
		}
		
		public function get particleEndVelocity():Number 
		{
			return _particleEndVelocity;
		}
		
		public function set particleEndVelocity(value:Number):void 
		{
			_particleEndVelocity = value;
		}
		
		public function get particleStartAlpha():Number 
		{
			return _particleStartAlpha;
		}
		
		public function set particleStartAlpha(value:Number):void 
		{
			_particleStartAlpha = value;
		}
		
		public function get particleEndAlpha():Number 
		{
			return _particleEndAlpha;
		}
		
		public function set particleEndAlpha(value:Number):void 
		{
			_particleEndAlpha = value;
		}
		
		public function get particleStartScale():Number 
		{
			return _particleStartScale;
		}
		
		public function set particleStartScale(value:Number):void 
		{
			_particleStartScale = value;
		}
		
		public function get particleEndScale():Number 
		{
			return _particleEndScale;
		}
		
		public function set particleEndScale(value:Number):void 
		{
			_particleEndScale = value;
		}
		
		public function get emitFromAngle():Number 
		{
			return _emitFromAngle;
		}
		
		public function set emitFromAngle(value:Number):void 
		{
			_emitFromAngle = value;
		}
		
		public function get emitToAngle():Number 
		{
			return _emitToAngle;
		}
		
		public function set emitToAngle(value:Number):void 
		{
			_emitToAngle = value;
		}
//}}
	
	}

}