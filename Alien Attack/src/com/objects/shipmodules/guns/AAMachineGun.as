package com.objects.shipmodules.guns 
{
	import com.objects.shipmodules.guns.AAGunAbstract;
	import com.objects.spaceobjects.bullets.AAGunBullet;
	import com.objects.spaceobjects.ships.AASpaceShip;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	/**
	 * ...
	 * @author Eugene Tkachenko
	 */
	public class AAMachineGun extends AAGunAbstract 
	{
		[Embed(source="../../../../lib/sounds/guns/machine_gun_shot.mp3")]
		public var SoundClass:Class;
		
		public function AAMachineGun(ship:AASpaceShip) 
		{
			super(ship);
			
			this.shotSound = new SoundClass() as Sound;
			this._spreading = 4;
			this._fireRate = 8;
			this._shellType = AAGunBullet;
		}
		
	}

}