package com.objects.spaceobjects.bullets 
{
	import com.objects.spaceobjects.bullets.AABulletAbstract;
	import com.universe.AAUniverse;
	
	/**
	 * ...
	 * @author Eugene Tkachenko
	 */
	public class AAGunBullet extends AABulletAbstract 
	{
		[Embed(source="../../../../lib/images/bullets/gun_bullet.png")]
		private var ShellView:Class;
		
		public function AAGunBullet(universe:AAUniverse, angle:Number=0) 
		{
			super(universe, angle);
			
			this._startVelocity = 25;
			this.damage = 3;
			this._lifeTimeInMS = 1200;
			this.view = new ShellView();
		}
		
	}

}