package com.objects.spaceobjects.bullets 
{
	import com.objects.spaceobjects.bullets.AABulletAbstract;
	import com.universe.AAUniverse;
	
	/**
	 * ...
	 * @author Eugene Tkachenko
	 */
	public class AABlasterShell extends AABulletAbstract 
	{
		[Embed(source="../../../../lib/images/bullets/blaster_shell.png")]
		private var ShellView:Class;
		
		public function AABlasterShell(universe:AAUniverse, angle:Number=0) 
		{
			super(universe, angle);
			
			this._lifeTimeInMS = 2000;
			this._startVelocity = 12;
			this.damage = 5;
			this.view = new ShellView();
		}
		
	}

}