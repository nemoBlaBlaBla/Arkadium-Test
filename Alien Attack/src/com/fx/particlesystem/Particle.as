package com.fx.particlesystem
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import mx.controls.NumericStepper;
	import mx.formatters.NumberBaseRoundType;
	import utilities.GlobalTimer;
	
	/**
	 * ...
	 * @author Eugene
	 */
	public class Particle extends Sprite
	{
		[Embed(source="/lib/BlueFireParticleTest3.svg")]
		public var ParticleView:Class;
		
		//properties
		private var _particleBitmapView:Sprite = new ParticleView();
		
		private var _particleLifeTime:Number = 1000;
		
		private var _particleStartVelocity:Number = 0;
		private var _particleEndVelocity:Number = 0
		
		private var _particleStartAlpha:Number = 1;
		private var _particleEndAlpha:Number = 1;
		
		private var _particleStartScale:Number = 1;
		private var _particleEndScale:Number = 1;
		
		//private fields
		private var _particleTimer:Timer;
		
		private var _numberOfIterations:int = 0;
		private var _velocityDelta:Number;
		private var _alphaDelta:Number;
		private var _scaleDelta:Number;
		
		private var _currentVelocity:Number = 0;
		private var _currentIteration:int = 0;
		
		public function Particle()
		{
			//this._lifeTimeInMS = lifeTimeInMS;
			//this._startScale = startScale;
			//this._finishScale = finishScale;
			//this._startAlpha = startAlpha;
			//this._finishAlpha = finishAlpha;
			//this._startVelocity = startVelocity;
			//this._finishVelocity = finishVelosity;
			
			this.addEventListener(Event.ADDED_TO_STAGE, onAddingToStage);
			
			//_view.cacheAsBitmap = true;
			
			
			
		}
		
		private function onAddingToStage(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddingToStage);
			
			this.particleBitmapView.x = -this.particleBitmapView.width / 2;
			this.particleBitmapView.y = -this.particleBitmapView.height / 2;
			
			_numberOfIterations = this.particleLifeTime / 20;
			_alphaDelta = (this.particleEndAlpha - this.particleStartAlpha) / _numberOfIterations;
			_scaleDelta = (this.particleEndScale - this.particleStartScale) / _numberOfIterations;
			_velocityDelta = (this.particleEndVelocity - this.particleStartVelocity) / _numberOfIterations;
			_currentVelocity = this.particleStartVelocity;
			
			this.scaleX = this._particleStartScale;
			this.scaleY = this._particleStartScale;
			
			_particleTimer = new Timer(20, _numberOfIterations);
			_particleTimer.addEventListener(TimerEvent.TIMER, OnTimerTick);
			
			
			_particleTimer = new Timer(20, _numberOfIterations);
			_particleTimer.addEventListener(TimerEvent.TIMER, OnTimerTick);
			_particleTimer.start();
			this.addChild(this.particleBitmapView);
		}
		
		private function OnTimerTick(e:Event):void
		{
			this.alpha += _alphaDelta;
			this.scaleX += _scaleDelta;
			this.scaleY += _scaleDelta;
			this._currentVelocity += _velocityDelta;
			
			this.x += (Math.sin((this.rotation * Math.PI) / 180) * _currentVelocity);
			this.y += (Math.cos((this.rotation * Math.PI) / 180) * _currentVelocity);

			//this.y += _currentVelocity;
			_currentIteration += 1;
			if (_currentIteration >= _numberOfIterations)
			{
				this.Destroy();
			}
		}
		
		private function Destroy() : void
		{
			_particleTimer.removeEventListener(TimerEvent.TIMER, OnTimerTick);
			parent.removeChild(this);
			trace("particle destroyed");
		}
		
//{PROPERTIES GETTERS AND SETTERS	
		public function get particleBitmapView():Sprite 
		{
			return _particleBitmapView;
		}
		
		public function set particleBitmapView(value:Sprite):void 
		{
			_particleBitmapView = value;
		}
		
		public function get particleLifeTime():Number 
		{
			return _particleLifeTime;
		}
		
		public function set particleLifeTime(value:Number):void 
		{
			_particleLifeTime = value;
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
//}
		
	}

}