package com.fx.explosions 
{
	import com.fx.particlesystem.AAParticle;
	import com.fx.particlesystem.AAParticleSystem;
	import com.universe.AAUniverse;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	
	/**
	 * ...
	 * @author Eugene Tkachenko
	 */
	public class AASmallExplosion extends AAExplosionAbstract 
	{
		[Embed(source="/lib/images/explosions/explosion_fast_sparcles.png")]
		public var ExplosionFastSparclesView:Class;
		
		[Embed(source="/lib/images/explosions/explosion_fire.png")]
		public var ExplosionFireView:Class;
		
		[Embed(source="/lib/sounds/explosions/small_explosion_sound.mp3")]
		private var SoundClass:Class;
		
		private var _sparcles:AAParticleSystem = new AAParticleSystem();
		private var _fires:AAParticleSystem = new AAParticleSystem();
		
		public function AASmallExplosion(universe:AAUniverse) 
		{
			super(universe);
			
			this.explosionSound = new SoundClass() as Sound;
			
			this._sparcles = new AAParticleSystem(4000);
			this._sparcles.xRange = 2;
			this._sparcles.yRange = 2;
			this._sparcles.particleStartScale = 1;
			this._sparcles.particleEndScale = 0;
			this._sparcles.particleLifeTime = 100;
			this._sparcles.emitFromAngle = 0;
			this._sparcles.emitToAngle = 180;
			this._sparcles.particleStartVelocity = 10;
			this._sparcles.particleEndVelocity = 0;
			this._sparcles.ParticleView = ExplosionFastSparclesView;
			this._sparcles.particlesPerEmission = 5;
			this._universe.addChild(_sparcles);
			
			
			this._fires = new AAParticleSystem(4000);
			this._fires.xRange = 2;
			this._fires.yRange = 2;
			this._fires.particleStartScale = 0.3;
			this._fires.particleEndScale = 0.1;
			this._fires.particleStartAlpha = 1;
			this._fires.particleEndAlpha = 0;
			this._fires.particleLifeTime = 500;
			this._fires.emitFromAngle = 0;
			this._fires.emitToAngle = 360;
			this._fires.particleStartVelocity = 1;
			this._fires.particleEndVelocity = 0;
			this._fires.ParticleView = ExplosionFireView;
			this._fires.particlesPerEmission = 3;
			this._universe.addChild(_fires);
		}
		
		override public function Explode():void
		{
			this._sparcles.x = this.x;
			this._sparcles.y = this.y;
			
			this._fires.x = this.x;
			this._fires.y = this.y;
			
			this._sparcles.EmitParticles();
			this._fires.EmitParticles();
			
			this._universe.removeChild(_sparcles);
			this._universe.removeChild(_fires);
			
			this._sparcles = null;
			this._fires = null;
			
			super.Explode();
		}
		
	}

}