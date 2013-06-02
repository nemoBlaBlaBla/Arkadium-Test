package com.objects.spaceobjects.shells 
{
	import com.objects.spaceobjects.AACannonShell;
	import com.universe.Universe;
	
	/**
	 * ...
	 * @author Eugene Tkachenko
	 */
	public class AAGunBullet extends AACannonShell 
	{
		
		[Embed(source = "/lib/gun_bullet.png")]
		private var ShellView:Class;
		
		public function AAGunBullet(universe:Universe, angle:Number=0) 
		{
			super(universe, angle);
			
			this._startVelocity = 25;
			this.damage = 3;
			this._lifeTimeInMS = 1200;
			this.view = new ShellView();
		}
		
	}

}