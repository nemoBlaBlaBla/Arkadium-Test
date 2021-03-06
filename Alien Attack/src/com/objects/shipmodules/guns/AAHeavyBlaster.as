package com.objects.shipmodules.guns 
{
	import com.objects.spaceobjects.ships.AASpaceShip;
	import com.objects.spaceobjects.bullets.AAHeavyBlasterShell;
	import flash.media.Sound;

	/**
	 * ...
	 * @author Eugene Tkachenko
	 */
	public class AAHeavyBlaster extends AAGunAbstract 
	{
		
		[Embed(source="../../../../lib/sounds/guns/heavy_blaster_shot.mp3")]
		public var SoundClass:Class;
		
		public function AAHeavyBlaster(ship:AASpaceShip) 
		{
			super(ship);
			
			this.shotSound = new SoundClass() as Sound;
			
			this._spreading = 7;
			this._fireRate = 2;
			this._shellType = AAHeavyBlasterShell;
		}
		
	}

}