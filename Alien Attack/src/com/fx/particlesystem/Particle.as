package com.fx.particlesystem
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import utilities.GlobalTimer;
	
	/**
	 * ...
	 * @author Eugene
	 */
	public class Particle extends Sprite
	{
		protected var _view:Sprite = new Sprite();
		
		protected var _lifeTimeInMS:int = 0;
		
		protected var _startScale:Number = 0;
		protected var _finishScale:Number = 0;
		
		protected var _startAlpha:Number = 0;
		protected var _finishAlpha:Number = 0;
		
		protected var _startVelocity:Number = 0;
		protected var _finishVelocity:Number = 0;
		
		protected var _scaleDelta:Number = 0;
		protected var _alphaDelta:Number = 0;
		protected var _velocityDelta:Number = 0;
		protected var _numberOfIterations:int = 0;
		protected var _currentIteration:int = 0;
		protected var _currentVelocity:int = 0;
		
		protected var _particleTimer:GlobalTimer;
		
		public function Particle(lifeTimeInMS:int = 2000, startScale:Number = 1, finishScale:Number = 1, startAlpha:Number = 1, finishAlpha:Number = 1, startVelocity:Number = 0, finishVelosity:Number = 0)
		{
			this._lifeTimeInMS = lifeTimeInMS;
			this._startScale = startScale;
			this._finishScale = finishScale;
			this._startAlpha = startAlpha;
			this._finishAlpha = finishAlpha;
			this._startVelocity = startVelocity;
			this._finishVelocity = finishVelosity;
			
			this.addEventListener(Event.ADDED_TO_STAGE, onAddingToStage);
			
			//_view.cacheAsBitmap = true;
			
			
			_numberOfIterations = _lifeTimeInMS / 20;
			_alphaDelta = (_finishAlpha - _startAlpha) / _numberOfIterations;
			_scaleDelta = (_finishScale - _startScale) / _numberOfIterations;
			_currentVelocity = _startVelocity;
		}
		
		private function onAddingToStage(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddingToStage);
			_particleTimer = GlobalTimer.GetInstance();
			_particleTimer.addEventListener(TimerEvent.TIMER, onTimerTick);
			this.addChild(_view);
		}
		
		private function onTimerTick(e:Event):void
		{
			_velocityDelta = (_finishVelocity - _startVelocity) / _numberOfIterations;
			this.alpha += _alphaDelta;
			this.scaleX += _scaleDelta;
			this._currentVelocity += _velocityDelta;
			this.y += _currentVelocity;
			_currentIteration += 1;
			if (_currentIteration >= _numberOfIterations)
			{
				_particleTimer.removeEventListener(TimerEvent.TIMER, onTimerTick);
				parent.removeChild(this);
			}
		}
		
		public function get view():Sprite
		{
			return _view;
		}
		
		public function set view(value:Sprite):void
		{
			_view = value;
		}
		
		public function get lifeTimInMS():int
		{
			return _lifeTimeInMS;
		}
		
		public function set lifeTimInMS(value:int):void
		{
			_lifeTimeInMS = value;
		}
		
		public function get startScale():Number
		{
			return _startScale;
		}
		
		public function set startScale(value:Number):void
		{
			_startScale = value;
		}
		
		public function get finishScale():Number
		{
			return _finishScale;
		}
		
		public function set finishScale(value:Number):void
		{
			_finishScale = value;
		}
		
		public function get startAlpha():Number
		{
			return _startAlpha;
		}
		
		public function set startAlpha(value:Number):void
		{
			_startAlpha = value;
		}
		
		public function get finishAlpha():Number
		{
			return _finishAlpha;
		}
		
		public function set finishAlpha(value:Number):void
		{
			_finishAlpha = value;
		}
		
		public function get startVelocity():Number
		{
			return _startVelocity;
		}
		
		public function set startVelocity(value:Number):void
		{
			_startVelocity = value;
			_currentVelocity = _startVelocity;
		}
		
		public function get finishVelocity():Number
		{
			return _finishVelocity;
		}
		
		public function set finishVelocity(value:Number):void
		{
			_finishVelocity = value;
		}
	
	}

}