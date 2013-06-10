package com.objects.spaceobjects.bullets 
{
	import com.universe.AAUniverse;
	
	/**
	 * ...
	 * @author Eugene Tkachenko
	 */
	public class AAHeavyBlasterShell extends AABulletAbstract 
	{
		[Embed(source="/lib/images/bullets/heavy_blaster_shell.png")]
		private var ShellView:Class;
		
		public function AAHeavyBlasterShell(universe:AAUniverse, angle:Number=0) 
		{
			super(universe, angle);
			
			this._lifeTimeInMS = 2000;
			this._startVelocity = 9;
			this.damage = 20;
			this.view = new ShellView();
		}
	}

}