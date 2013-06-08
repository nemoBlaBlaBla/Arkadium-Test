package com.objects.spaceobjects.bonuses 
{
	import com.objects.shipmodules.guns.AAAlienBlaster;
	import com.objects.shipmodules.guns.AAMachineGun;
	import com.universe.AAUniverse;
	import com.objects.spaceobjects.ships.AAPlayerShip;
	
	/**
	 * ...
	 * @author Eugene Tkachenko
	 */
	public class AABonusBlaster extends AABonusAbstract 
	{
		[Embed(source="../../../../lib/images/bonuses/bonus_blaster.png")]
		public var BonusView:Class;
		
		public function AABonusBlaster(universe:AAUniverse) 
		{
			super(universe);
			this.view = new BonusView();
		}
		
		override public function ApplyBonus(player:AAPlayerShip):void
		{
			player.gun.Destroy();
			player.gun = new AAAlienBlaster(player);
		}
	}

}