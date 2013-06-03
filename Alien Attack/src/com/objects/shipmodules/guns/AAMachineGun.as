package com.objects.shipmodules.guns 
{
	import com.objects.shipmodules.guns.AAGunAbstract;
	import com.objects.spaceobjects.bullets.AAGunBullet;
	import com.objects.spaceobjects.ships.AASpaceShip;
	/**
	 * ...
	 * @author Eugene Tkachenko
	 */
	public class AAMachineGun extends AAGunAbstract 
	{
		
		public function AAMachineGun(ship:AASpaceShip) 
		{
			super(ship);
			
			_spreading = 4;
			_fireRate = 8;
			_shellType = AAGunBullet;
		}
		
	}

}