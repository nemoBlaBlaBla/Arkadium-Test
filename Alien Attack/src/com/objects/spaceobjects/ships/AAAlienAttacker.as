package com.objects.spaceobjects.ships 
{
	import com.objects.shipmodules.guns.AAHeavyBlaster;
	import com.universe.AAUniverse;
	import com.objects.shipmodules.AAEngine;
	import com.behaviours.AAAlienShipBehaviour;
	
	/**
	 * ...
	 * @author Eugene Tkachenko
	 */
	public class AAAlienAttacker extends AASpaceShip 
	{
		[Embed(source = "/lib/images/ships/alien_attacker.png")]
		private var ShipView:Class;
		
		public function AAAlienAttacker(universe:AAUniverse) 
		{
			super(universe);
			
			this.health = 45;
			this.mass = 2300;
			this.resistanceFactor = 60;
			this.angularResistanceFactor = 70;
			this.engine = new AAEngine(this, 125, 300);
			this.addChild(this.engine);
			
			this.view = new ShipView();
			
			this.gun = new AAHeavyBlaster(this);
			this.pointsBounty = 65;
			
			this.behaviour = AAAlienShipBehaviour.SharedInstance();
		}
		
	}

}