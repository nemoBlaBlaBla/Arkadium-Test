package com.fx.explosions 
{
	import com.universe.AAUniverse;
	import flash.display.Sprite;
	import com.fx.particlesystem.AAParticleSystem;
	import flash.media.Sound;
	
	/**
	 * ...
	 * @author Eugene Tkachenko
	 */
	public class AABigExplosion extends AAExplosionAbstract 
	{
		[Embed(source="/lib/images/explosions/blast_wave.png")]
		public var BlastWaveView:Class;
		
		[Embed(source="/lib/images/explosions/explosion_fire.png")]
		public var ExplosionFireView:Class;
		
		[Embed(source="/lib/images/explosions/explosion_fast_sparcles.png")]
		public var ExplosionFastSparclesView:Class;
		
		[Embed(source="/lib/images/explosions/explosion_slow_sparcles.png")]
		public var ExplosionSlowSparclesView:Class;
		
		[Embed(source="/lib/sounds/explosions/big_explosion_sound.mp3")]
		private var SoundClass:Class;
		
		
		private var _fastSparcles1:AAParticleSystem;
		private var _fastSparcles2:AAParticleSystem;
		private var _explosionFires:AAParticleSystem;
		private var _slowSparcles:AAParticleSystem;
		private var _blastWave:AAParticleSystem;
		
		public function AABigExplosion(universe:AAUniverse) 
		{
			super(universe);
			
			this.explosionSound = new SoundClass() as Sound;
			
			this._fastSparcles1 = new AAParticleSystem();
			this._fastSparcles1.xRange = 20;
			this._fastSparcles1.yRange = 20;
			this._fastSparcles1.particleStartScale = 1;
			this._fastSparcles1.particleEndScale = 0;
			this._fastSparcles1.particleLifeTime = 300;
			this._fastSparcles1.emitFromAngle = 0;
			this._fastSparcles1.emitToAngle = 360;
			this._fastSparcles1.particleStartVelocity = 20;
			this._fastSparcles1.particleEndVelocity = 5;
			this._fastSparcles1.ParticleView = ExplosionFastSparclesView;
			this._fastSparcles1.particlesPerEmission = 6;
			this._universe.addChild(_fastSparcles1);
			
			
			this._fastSparcles2 = new AAParticleSystem();
			this._fastSparcles2.xRange = 20;
			this._fastSparcles2.yRange = 20;
			this._fastSparcles2.particleStartScale = 1;
			this._fastSparcles2.particleEndScale = 0;
			this._fastSparcles2.particleLifeTime = 350;
			this._fastSparcles2.emitFromAngle = 0;
			this._fastSparcles2.emitToAngle = 360;
			this._fastSparcles2.particleStartVelocity = 15;
			this._fastSparcles2.particleEndVelocity = 3;
			this._fastSparcles2.ParticleView = ExplosionFastSparclesView;
			this._fastSparcles2.particlesPerEmission = 6;
			this._universe.addChild(_fastSparcles2);
			
			
			this._explosionFires = new AAParticleSystem();
			this._explosionFires.xRange = 50;
			this._explosionFires.yRange = 50;
			this._explosionFires.particleStartScale = 1;
			this._explosionFires.particleEndScale = 0.7;
			this._explosionFires.particleStartAlpha = 1;
			this._explosionFires.particleEndAlpha = 0;
			this._explosionFires.particleLifeTime = 1000;
			this._explosionFires.emitFromAngle = 0;
			this._explosionFires.emitToAngle = 360;
			this._explosionFires.particleStartVelocity = 1;
			this._explosionFires.particleEndVelocity = 0;
			this._explosionFires.ParticleView = ExplosionFireView;
			this._explosionFires.particlesPerEmission = 6;
			this._universe.addChild(_explosionFires);
			
			
			this._slowSparcles = new AAParticleSystem();
			this._slowSparcles.xRange = 70;
			this._slowSparcles.yRange = 70;
			this._slowSparcles.particleStartScale = 1;
			this._slowSparcles.particleEndScale = 0.4;
			this._slowSparcles.particleStartAlpha = 1;
			this._slowSparcles.particleEndAlpha = 0
			this._slowSparcles.particleLifeTime = 2000;
			this._slowSparcles.emitFromAngle = 0;
			this._slowSparcles.emitToAngle = 360;
			this._slowSparcles.particleStartVelocity = 2;
			this._slowSparcles.particleEndVelocity = 0;
			this._slowSparcles.ParticleView = ExplosionSlowSparclesView;
			this._slowSparcles.particlesPerEmission = 5;
			this._universe.addChild(_slowSparcles);
			
			
			this._blastWave = new AAParticleSystem();
			this._blastWave.xRange = 0;
			this._blastWave.yRange = 0;
			this._blastWave.particleStartScale = 0.1;
			this._blastWave.particleEndScale = 1.3;
			this._blastWave.particleStartAlpha = 1;
			this._blastWave.particleEndAlpha = 0
			this._blastWave.particleLifeTime = 400;
			this._blastWave.emitFromAngle = 0;
			this._blastWave.emitToAngle = 360;
			this._blastWave.particleStartVelocity = 0;
			this._blastWave.particleEndVelocity = 0;
			this._blastWave.ParticleView = BlastWaveView;
			this._blastWave.particlesPerEmission = 1;
			this._universe.addChild(_blastWave);
		}
		
		override public function Explode():void
		{
			this._fastSparcles1.x = this.x;
			this._fastSparcles1.y = this.y;
			
			this._fastSparcles2.x = this.x;
			this._fastSparcles2.y = this.y;
			
			this._explosionFires.x = this.x;
			this._explosionFires.y = this.y;
			
			this._slowSparcles.x = this.x;
			this._slowSparcles.y = this.y;
			
			this._blastWave.x = this.x;
			this._blastWave.y = this.y;
			
			
			this._blastWave.EmitParticles();
			this._explosionFires.EmitParticles();
			this._fastSparcles1.EmitParticles();
			this._fastSparcles2.EmitParticles();
			this._slowSparcles.EmitParticles();
			
			
			this._universe.removeChild(_fastSparcles1);
			this._universe.removeChild(_fastSparcles2);
			this._universe.removeChild(_explosionFires);
			this._universe.removeChild(_slowSparcles);
			this._universe.removeChild(_blastWave);
			
			this._fastSparcles1 = null;
			this._fastSparcles2 = null;
			this._explosionFires = null;
			this._slowSparcles = null;
			this._blastWave = null;
			
			super.Explode();
		}
		
	}

}