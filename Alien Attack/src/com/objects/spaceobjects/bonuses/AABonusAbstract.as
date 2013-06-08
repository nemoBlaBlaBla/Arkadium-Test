package com.objects.spaceobjects.bonuses 
{
	import com.behaviours.AABonusBehaviour;
	import com.objects.spaceobjects.AASpaceObject;
	import com.objects.spaceobjects.ships.AAPlayerShip;
	import com.universe.AAUniverse;
	
	/**
	 * ...
	 * @author Eugene Tkachenko
	 */
	public class AABonusAbstract extends AASpaceObject 
	{
		
		public function AABonusAbstract(universe:AAUniverse) 
		{
			super(universe);
			this.behaviour = new AABonusBehaviour();
			this.mass = 0;
		}
		
		//will be overrided in inheriting classes
		public function ApplyBonus(player:AAPlayerShip):void
		{
			
		}
		
	}

}