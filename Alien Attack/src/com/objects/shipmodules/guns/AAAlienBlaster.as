package com.objects.shipmodules.guns 
{
	import com.objects.shipmodules.guns.AAGunAbstract;
	import com.objects.spaceobjects.bullets.AABlasterShell;
	import com.objects.spaceobjects.ships.AASpaceShip;
	import flash.media.Sound;
	
	/**
	 * ...
	 * @author Eugene Tkachenko
	 */
	public class AAAlienBlaster extends AAGunAbstract 
	{
		
		[Embed(source="../../../../lib/sounds/guns/blaster_shot.mp3")]
		public var SoundClass:Class;
		
		public function AAAlienBlaster(ship:AASpaceShip) 
		{
			super(ship);
			
			this.shotSound = new SoundClass() as Sound;
			
			_spreading = 5;
			_fireRate = 4;
			_shellType = AABlasterShell;
		}
		
	}

}