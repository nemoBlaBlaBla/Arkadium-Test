package com.universe
{
	import com.fx.particlesystem.AAParticleSystem;
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Eugene
	 */
	public class AAUniverse extends Sprite
	{		
		
		[Embed(source="../../lib/images/universe/meteor.png")]
		public var MeteorView:Class;
		
		private var _meteors1:AAParticleSystem = new AAParticleSystem();
		private var _meteors2:AAParticleSystem = new AAParticleSystem();
		
		private var _backgroundTexture:Bitmap;
		
		public function AAUniverse()
		{	
			this.addEventListener(Event.ADDED_TO_STAGE, OnAddingToStage);
		}	
		
		private function OnAddingToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, OnAddingToStage);
			
			_backgroundTexture.scaleX = stage.stageWidth / _backgroundTexture.width;
			_backgroundTexture.scaleY = _backgroundTexture.scaleX;
			
			this.addChildAt(_backgroundTexture, 0);
			
			_meteors1.ParticleView = MeteorView;
			_meteors1.x = stage.stageWidth / 2;
			_meteors1.y = - stage.stageHeight;
			_meteors1.xRange = stage.stageWidth;
			_meteors1.yRange = stage.stageHeight / 4;
			_meteors1.particleLifeTime = 15000;
			_meteors1.particlesPerEmission = 4;
			_meteors1.emitFromAngle = 0;
			_meteors1.emitToAngle = 0;
			_meteors1.particleStartAlpha = 1;
			_meteors1.particleEndAlpha = 1;
			_meteors1.particleStartScale = 0.2;
			_meteors1.particleEndScale = 0.2;
			_meteors1.emissionDelayInMS = 3000;
			
			this.addChild(_meteors1);
			_meteors1.Start();
			
			this.addEventListener(Event.ENTER_FRAME, OnEnterFrame);
		}
		
		private function OnEnterFrame(e:Event):void 
		{
			_meteors1.particleStartVelocity = 2 + (Math.random() * 2);
			_meteors1.particleEndVelocity = _meteors1.particleStartVelocity;
			
			_meteors1.particleStartScale = 0.2 + (Math.random() * 0.2);
			_meteors1.particleEndScale = _meteors1.particleStartScale;
		}
		
		public function get backgroundTexture():Bitmap 
		{
			return _backgroundTexture;
		}
		
		public function set backgroundTexture(value:Bitmap):void 
		{
			_backgroundTexture = value;
		}
	}
}