package com.objects.shipmodules.guns 
{
	import com.objects.shipmodules.guns.AAGunAbstract;
	import com.objects.spaceobjects.bullets.AABlasterShell;
	import com.objects.spaceobjects.ships.AASpaceShip;
	
	/**
	 * ...
	 * @author Eugene Tkachenko
	 */
	public class AAAlienBlaster extends AAGunAbstract 
	{
		
		public function AAAlienBlaster(ship:AASpaceShip) 
		{
			super(ship);
			
			_spreading = 5;
			_fireRate = 2;
			_shellType = AABlasterShell;
		}
		
	}

}