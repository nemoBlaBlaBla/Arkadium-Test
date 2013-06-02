package com.objects.spaceobjects.shells 
{
	import com.objects.spaceobjects.AACannonShell;
	import com.universe.Universe;
	
	/**
	 * ...
	 * @author Eugene Tkachenko
	 */
	public class AABlasterShell extends AACannonShell 
	{
		
		[Embed(source = "/lib/blaster_shell.png")]
		private var ShellView:Class;
		
		public function AABlasterShell(universe:Universe, angle:Number=0) 
		{
			super(universe, angle);
			
			this._lifeTimeInMS = 2000;
			this._startVelocity = 12;
			this.damage = 5;
			this.view = new ShellView();
		}
		
	}

}