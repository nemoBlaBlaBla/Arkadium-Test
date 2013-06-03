package com.fx.particlesystem
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import mx.controls.NumericStepper;
	import mx.formatters.NumberBaseRoundType;
	import com.utilities.AAGlobalTimer;
	
	/**
	 * ...
	 * @author Eugene
	 */
	public class AAParticle extends Sprite
	{
		[Embed(source="/lib/images/explosions/explosion_slow_sparcles.png")]
		public var ParticleView:Class;
		
		//properties
		private var _particleBitmapView:Bitmap = new ParticleView();
		
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
		
		public function AAParticle()
		{
			this.addEventListener(Event.ADDED_TO_STAGE, onAddingToStage);
		}
		
		private function onAddingToStage(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddingToStage);
			
			_particleTimer = new Timer(30, _numberOfIterations);
			_particleTimer.addEventListener(TimerEvent.TIMER, OnTimerTick);
			
			this.particleBitmapView.x = -this.particleBitmapView.width / 2;
			this.particleBitmapView.y = -this.particleBitmapView.height / 2;
			
			_numberOfIterations = this.particleLifeTime / _particleTimer.delay;
			_alphaDelta = (this.particleEndAlpha - this.particleStartAlpha) / _numberOfIterations;
			_scaleDelta = (this.particleEndScale - this.particleStartScale) / _numberOfIterations;
			_velocityDelta = (this.particleEndVelocity - this.particleStartVelocity) / _numberOfIterations;
			_currentVelocity = this.particleStartVelocity;
			
			this.scaleX = this._particleStartScale;
			this.scaleY = this._particleStartScale;
			
			_particleTimer.start();
			this.addChild(this.particleBitmapView);
		}
		
		private function OnTimerTick(e:Event):void
		{
			this.alpha += _alphaDelta;
			this.scaleX += _scaleDelta;
			this.scaleY = this.scaleX;
			this._currentVelocity += _velocityDelta;
			
			this.x += (Math.sin((this.rotation * Math.PI) / 180) * _currentVelocity);
			this.y += (Math.cos((this.rotation * Math.PI) / 180) * _currentVelocity);

			_currentIteration += 1;
			if (_currentIteration >= _numberOfIterations)
			{
				this.Destroy();
			}
		}
		
		private function Destroy() : void
		{
			_particleTimer.removeEventListener(TimerEvent.TIMER, OnTimerTick);
			_particleTimer.stop();
			_particleTimer = null;
			if (this.parent)
			{
				this.parent.removeChild(this);
			}
			this.particleBitmapView.bitmapData.dispose();
			this.particleBitmapView = null;
		}
		
//{PROPERTIES GETTERS AND SETTERS	
		public function get particleBitmapView():Bitmap 
		{
			return _particleBitmapView;
		}
		
		public function set particleBitmapView(value:Bitmap):void 
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