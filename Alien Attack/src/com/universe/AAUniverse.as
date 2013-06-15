package com.universe
{
	import com.fx.particlesystem.AAParticleSystem;
	import com.objects.spaceobjects.AASpaceObject;
	import flash.display.Bitmap;
	import flash.display.DisplayObject;
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
		
		[Embed(source="../../lib/images/universe/space_texture.jpg")]
		public var SpaceTexture:Class;
		
		private var _meteors1:AAParticleSystem = new AAParticleSystem();
		private var _meteors2:AAParticleSystem = new AAParticleSystem();
		
		//properties
		private var _backgroundTexture:Bitmap;
		
		public function AAUniverse()
		{	
			this.addEventListener(Event.ADDED_TO_STAGE, OnAddingToStage);
			
			this.backgroundTexture = new SpaceTexture();
		}	
		
		
//{ EVENT HANDLERS
		private function OnAddingToStage(e:Event):void 
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, OnAddingToStage);
			this.addEventListener(Event.REMOVED_FROM_STAGE, OnRemovingFromStage)
			
			this._backgroundTexture.scaleX = stage.stageWidth / _backgroundTexture.width;
			this._backgroundTexture.scaleY = _backgroundTexture.scaleX;
			
			this.addChildAt(_backgroundTexture, 0);
			
			this._meteors1.ParticleView = MeteorView;
			this._meteors1.x = stage.stageWidth / 2;
			this._meteors1.y = - stage.stageHeight;
			this._meteors1.xRange = stage.stageWidth;
			this._meteors1.yRange = stage.stageHeight / 4;
			this._meteors1.particleLifeTime = 15000;
			this._meteors1.particlesPerEmission = 4;
			this._meteors1.emitFromAngle = 0;
			this._meteors1.emitToAngle = 0;
			this._meteors1.particleStartAlpha = 1;
			this._meteors1.particleEndAlpha = 1;
			this._meteors1.particleStartScale = 0.2;
			this._meteors1.particleEndScale = 0.2;
			this._meteors1.emissionDelayInMS = 3000;
			
			this.addChild(_meteors1);
			this._meteors1.Start();
			
			this.addEventListener(Event.ENTER_FRAME, OnEnterFrame);
		}
		
		
		private function OnRemovingFromStage(e:Event):void 
		{
			for (var i:uint = 0; i < this.numChildren; i++)
			{
				var child:DisplayObject = this.getChildAt(i)
				if (child is AASpaceObject)
				{
					(child as AASpaceObject).Destroy();
				}
				this.removeChildAt(i);
			}
			this.removeEventListener(Event.ENTER_FRAME, OnEnterFrame);
		}
		
		private function OnEnterFrame(e:Event):void 
		{
			this._meteors1.particleStartVelocity = 2 + (Math.random() * 2);
			this._meteors1.particleEndVelocity = _meteors1.particleStartVelocity;
			
			this._meteors1.particleStartScale = 0.2 + (Math.random() * 0.2);
			this._meteors1.particleEndScale = _meteors1.particleStartScale;
		}
//}
		
//{ GETTERS AND SETTERS
		public function get backgroundTexture():Bitmap 
		{
			return _backgroundTexture;
		}
		
		public function set backgroundTexture(value:Bitmap):void 
		{
			_backgroundTexture = value;
		}
	}
//}
}