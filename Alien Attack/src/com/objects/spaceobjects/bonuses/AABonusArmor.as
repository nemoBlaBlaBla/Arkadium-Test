package com.objects.spaceobjects.bonuses 
{
	import com.universe.AAUniverse;
	import com.objects.spaceobjects.ships.AAPlayerShip;
	
	/**
	 * ...
	 * @author Eugene Tkachenko
	 */
	public class AABonusArmor extends AABonusAbstract 
	{
		[Embed(source="../../../../lib/images/bonuses/bonus_armor.png")]
		public var BonusView:Class;
		
		public function AABonusArmor(universe:AAUniverse) 
		{
			super(universe);
			this.view = new BonusView();
		}
		
		override public function ApplyBonus(player:AAPlayerShip):void
		{
			player.health += 20;
		}
		
	}

}