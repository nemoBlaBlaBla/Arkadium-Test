package com.objects.shipmodules.guns 
{
	import com.objects.spaceobjects.ships.AASpaceShip;
	import com.objects.spaceobjects.bullets.AAHeavyBlasterShell;
	/**
	 * ...
	 * @author Eugene Tkachenko
	 */
	public class AAHeavyBlaster extends AAGunAbstract 
	{
		
		public function AAHeavyBlaster(ship:AASpaceShip) 
		{
			super(ship);
			
			_spreading = 7;
			_fireRate = 2;
			_shellType = AAHeavyBlasterShell;
		}
		
	}

}