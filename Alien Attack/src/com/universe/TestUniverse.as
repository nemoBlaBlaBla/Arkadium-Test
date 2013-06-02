package com.universe
{
	import com.fx.particlesystem.ParticleSystem;
	import com.objects.spaceobjects.AAPlayerShip;
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import com.objects.spaceobjects.AACannonShell;
	
	/**
	 * ...
	 * @author Eugene
	 */
	public class TestUniverse extends Universe
	{
		
		[Embed(source="/lib/space_texture.jpg")]
		public var SpaceTexture:Class;
		
		[Embed(source="/lib/screen_mask.svg")]
		public var ScreenMask:Class;
		
		[Embed(source="/lib/meteor.png")]
		public var MeteorView:Class;
		
		private var _tex:Bitmap = new SpaceTexture();
		private var _mask:Sprite = new ScreenMask();
		
		private var _meteors1:ParticleSystem = new ParticleSystem();
		private var _meteors2:ParticleSystem = new ParticleSystem();
		
		public function TestUniverse()
		{
			this.addEventListener(Event.ADDED_TO_STAGE, OnAddingToStage);
			
			//var texarr:Array = new Array(10);
			//
			//for (var i:int = 0; i < 10; i++)
			//{
				//texarr[i] = new Array(10);
				//for (var j:int = 0; j < 10; j++)
				//{
					//texarr[i][j] = new SpaceTexture();
					//texarr[i][j].x = texarr[i][j].width * i;
					//texarr[i][j].y = texarr[i][j].height * j;
					//this.addChild(texarr[i][j]);
				//}
			//}
			
			//this.addEventListener(MouseEvent.CLICK, OnClick);
		}
		
		private function OnAddingToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, OnAddingToStage);
			
			_tex.scaleX = stage.stageWidth / _tex.width;
			_tex.scaleY = _tex.scaleX;
			
			this.addChildAt(_tex, 0);
			
			_meteors1.ParticleView = MeteorView;
			_meteors1.x = stage.stageWidth / 2;
			_meteors1.y = - stage.stageHeight;
			_meteors1.xRange = stage.stageWidth;
			_meteors1.yRange = stage.stageHeight / 4;
			//_meteors1.particleStartVelocity = 10;
			//_meteors1.particleEndVelocity = 10;
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
		
		
		//private function OnClick(e:MouseEvent):void 
		//{
			//var brl:AACannonShell = new AACannonShell(this, 25, 10);
			//var brl:AAPlayerShip = new AAPlayerShip(this);
			//brl.x = mouseX;
			//brl.y = mouseY;
			//brl.rotation = 30;
			//this.addChild(brl);
		//}
	}
}