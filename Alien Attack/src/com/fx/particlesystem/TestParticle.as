package com.fx.particlesystem
{
	
	/**
	 * ...
	 * @author Eugene
	 */
	public class TestParticle extends Particle
	{
		[Embed(source="/lib/BlueFireParticleTest3.svg")]
		public var ParticleView:Class;
		
		public function TestParticle(lifeTimeInMS:int = 500, startScale:Number = 1, finishScale:Number = 0, startAlpha:Number = 1, finishAlpha:Number = 0, startVelocity:Number = 1, finishVelosity:Number = 1)
		{
			super(lifeTimeInMS, startScale, finishScale, startAlpha, finishAlpha, startVelocity, finishVelosity);
			_view = new ParticleView();
			_view.scaleX = 0.1;
			_view.scaleY = 0.1;
			
			_view.x = -_view.width / 2;
			_view.y = -_view.height / 2;
		}
	}
}