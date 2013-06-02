package com.fx.explosions 
{
	import com.fx.particlesystem.Particle;
	import com.fx.particlesystem.ParticleSystem;
	import com.universe.Universe;
	
	/**
	 * ...
	 * @author Eugene Tkachenko
	 */
	public class AASmallExplosion extends AAExplosion 
	{
		[Embed(source="/lib/explosion_fast_sparcles.png")]
		public var ExplosionFastSparclesView:Class;
		
		[Embed(source="/lib/explosion_fire.png")]
		public var ExplosionFireView:Class;
		
		private var _sparcles:ParticleSystem = new ParticleSystem();
		private var _fires:ParticleSystem = new ParticleSystem();
		
		public function AASmallExplosion(universe:Universe) 
		{
			super(universe);
			
			_sparcles = new ParticleSystem(4000);
			_sparcles.xRange = 2;
			_sparcles.yRange = 2;
			_sparcles.particleStartScale = 1;
			_sparcles.particleEndScale = 0;
			_sparcles.particleLifeTime = 100;
			_sparcles.emitFromAngle = 0;
			_sparcles.emitToAngle = 180;
			_sparcles.particleStartVelocity = 10;
			_sparcles.particleEndVelocity = 0;
			_sparcles.ParticleView = ExplosionFastSparclesView;
			_sparcles.particlesPerEmission = 5;
			_universe.addChild(_sparcles);
			
			
			_fires = new ParticleSystem(4000);
			_fires.xRange = 2;
			_fires.yRange = 2;
			_fires.particleStartScale = 0.3;
			_fires.particleEndScale = 0.1;
			_fires.particleStartAlpha = 1;
			_fires.particleEndAlpha = 0;
			_fires.particleLifeTime = 500;
			_fires.emitFromAngle = 0;
			_fires.emitToAngle = 360;
			_fires.particleStartVelocity = 1;
			_fires.particleEndVelocity = 0;
			_fires.ParticleView = ExplosionFireView;
			_fires.particlesPerEmission = 3;
			_universe.addChild(_fires);
		}
		
		override public function Explode():void
		{
			_sparcles.x = this.x;
			_sparcles.y = this.y;
			
			_fires.x = this.x;
			_fires.y = this.y;
			
			_sparcles.EmitParticles();
			_fires.EmitParticles();
			
			_universe.removeChild(_sparcles);
			_universe.removeChild(_fires);
			
			_sparcles = null;
			_fires = null;
			
		}
		
	}

}