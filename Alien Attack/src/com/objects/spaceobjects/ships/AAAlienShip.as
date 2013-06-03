package com.objects.spaceobjects.ships 
{
	import com.behaviours.AAAlienShipBehaviour;
	import com.universe.AAUniverse;
	import com.objects.shipmodules.AAEngine;
	import com.objects.shipmodules.guns.AAAlienBlaster;
	/**
	 * ...
	 * @author Eugene Tkachenko
	 */
	public class AAAlienShip extends AASpaceShip 
	{
		[Embed(source = "/lib/images/ships/alien_spacecraft.png")]
		
		private var ShipView:Class;
		
		public function AAAlienShip(universe:AAUniverse) 
		{
			super(universe);
			
			this.health = 10;
			this.mass = 1000;
			this.resistanceFactor = 50;
			this.angularResistanceFactor = 70;
			this.engine = new AAEngine(this, 125, 300);
			this.addChild(this.engine);
			
			this.view = new ShipView();
			view.x = -view.width / 2;
			view.y = -view.height / 2;
			this.addChild(view);
			
			this.gun = new AAAlienBlaster(this);
			
			this.behaviour = new AAAlienShipBehaviour();
			
		}
		
	}

}