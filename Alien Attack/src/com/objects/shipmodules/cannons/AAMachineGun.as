package com.objects.shipmodules.cannons 
{
	import com.objects.shipmodules.AACannon;
	import com.objects.spaceobjects.shells.AAGunBullet;
	import com.objects.spaceobjects.AASpaceShip;
	/**
	 * ...
	 * @author Eugene Tkachenko
	 */
	public class AAMachineGun extends AACannon 
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