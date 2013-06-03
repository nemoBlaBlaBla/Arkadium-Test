package com.fx.explosions 
{
	import com.universe.AAUniverse;
	import flash.display.Sprite;
	import com.fx.particlesystem.AAParticleSystem;
	
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
		
		
		private var _fastSparcles1:AAParticleSystem;
		private var _fastSparcles2:AAParticleSystem;
		private var _explosionFires:AAParticleSystem;
		private var _slowSparcles:AAParticleSystem;
		private var _blastWave:AAParticleSystem;
		
		public function AABigExplosion(universe:AAUniverse) 
		{
			super(universe);
			
			_fastSparcles1 = new AAParticleSystem();
			_fastSparcles1.xRange = 20;
			_fastSparcles1.yRange = 20;
			_fastSparcles1.particleStartScale = 1;
			_fastSparcles1.particleEndScale = 0;
			_fastSparcles1.particleLifeTime = 300;
			_fastSparcles1.emitFromAngle = 0;
			_fastSparcles1.emitToAngle = 360;
			_fastSparcles1.particleStartVelocity = 20;
			_fastSparcles1.particleEndVelocity = 5;
			_fastSparcles1.ParticleView = ExplosionFastSparclesView;
			_fastSparcles1.particlesPerEmission = 6;
			_universe.addChild(_fastSparcles1);
			
			
			_fastSparcles2 = new AAParticleSystem();
			_fastSparcles2.xRange = 20;
			_fastSparcles2.yRange = 20;
			_fastSparcles2.particleStartScale = 1;
			_fastSparcles2.particleEndScale = 0;
			_fastSparcles2.particleLifeTime = 350;
			_fastSparcles2.emitFromAngle = 0;
			_fastSparcles2.emitToAngle = 360;
			_fastSparcles2.particleStartVelocity = 15;
			_fastSparcles2.particleEndVelocity = 3;
			_fastSparcles2.ParticleView = ExplosionFastSparclesView;
			_fastSparcles2.particlesPerEmission = 6;
			_universe.addChild(_fastSparcles2);
			
			
			_explosionFires = new AAParticleSystem();
			_explosionFires.xRange = 50;
			_explosionFires.yRange = 50;
			_explosionFires.particleStartScale = 1;
			_explosionFires.particleEndScale = 0.7;
			_explosionFires.particleStartAlpha = 1;
			_explosionFires.particleEndAlpha = 0;
			_explosionFires.particleLifeTime = 1000;
			_explosionFires.emitFromAngle = 0;
			_explosionFires.emitToAngle = 360;
			_explosionFires.particleStartVelocity = 1;
			_explosionFires.particleEndVelocity = 0;
			_explosionFires.ParticleView = ExplosionFireView;
			_explosionFires.particlesPerEmission = 6;
			_universe.addChild(_explosionFires);
			
			
			_slowSparcles = new AAParticleSystem();
			_slowSparcles.xRange = 70;
			_slowSparcles.yRange = 70;
			_slowSparcles.particleStartScale = 1;
			_slowSparcles.particleEndScale = 0.4;
			_slowSparcles.particleStartAlpha = 1;
			_slowSparcles.particleEndAlpha = 0
			_slowSparcles.particleLifeTime = 2000;
			_slowSparcles.emitFromAngle = 0;
			_slowSparcles.emitToAngle = 360;
			_slowSparcles.particleStartVelocity = 2;
			_slowSparcles.particleEndVelocity = 0;
			_slowSparcles.ParticleView = ExplosionSlowSparclesView;
			_slowSparcles.particlesPerEmission = 5;
			_universe.addChild(_slowSparcles);
			
			
			_blastWave = new AAParticleSystem();
			_blastWave.xRange = 0;
			_blastWave.yRange = 0;
			_blastWave.particleStartScale = 0.1;
			_blastWave.particleEndScale = 1.3;
			_blastWave.particleStartAlpha = 1;
			_blastWave.particleEndAlpha = 0
			_blastWave.particleLifeTime = 400;
			_blastWave.emitFromAngle = 0;
			_blastWave.emitToAngle = 360;
			_blastWave.particleStartVelocity = 0;
			_blastWave.particleEndVelocity = 0;
			_blastWave.ParticleView = BlastWaveView;
			_blastWave.particlesPerEmission = 1;
			_universe.addChild(_blastWave);
		}
		
		override public function Explode():void
		{
			_fastSparcles1.x = this.x;
			_fastSparcles1.y = this.y;
			
			_fastSparcles2.x = this.x;
			_fastSparcles2.y = this.y;
			
			_explosionFires.x = this.x;
			_explosionFires.y = this.y;
			
			_slowSparcles.x = this.x;
			_slowSparcles.y = this.y;
			
			_blastWave.x = this.x;
			_blastWave.y = this.y;
			
			
			_blastWave.EmitParticles();
			_explosionFires.EmitParticles();
			_fastSparcles1.EmitParticles();
			_fastSparcles2.EmitParticles();
			_slowSparcles.EmitParticles();
			
			
			_universe.removeChild(_fastSparcles1);
			_universe.removeChild(_fastSparcles2);
			_universe.removeChild(_explosionFires);
			_universe.removeChild(_slowSparcles);
			_universe.removeChild(_blastWave);
			
			_fastSparcles1 = null;
			_fastSparcles2 = null;
			_explosionFires = null;
			_slowSparcles = null;
			_blastWave = null;
		}
		
	}

}