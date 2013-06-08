package com.objects.spaceobjects.bonuses 
{
	import com.objects.shipmodules.guns.AAHeavyBlaster;
	import com.universe.AAUniverse;
	import com.objects.spaceobjects.ships.AAPlayerShip;

	
	/**
	 * ...
	 * @author Eugene Tkachenko
	 */
	public class AABonusHeavyBlaster extends AABonusAbstract 
	{
		[Embed(source="../../../../lib/images/bonuses/bonus_heavy_blaster.png")]
		public var BonusView:Class;
		
		public function AABonusHeavyBlaster(universe:AAUniverse) 
		{
			super(universe);
			this.view = new BonusView();
		}
		
		override public function ApplyBonus(player:AAPlayerShip):void
		{
			player.gun.Destroy();
			player.gun = new AAHeavyBlaster(player);
		}
	}

}