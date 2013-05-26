package com.objects.spaceobjects 
{
	import com.controllers.AAAlienShipController;
	import com.universe.Universe;
	import com.objects.shipmodules.AAEngine;
	/**
	 * ...
	 * @author Eugene Tkachenko
	 */
	public class AAAlienShip extends AASpaceShip 
	{
		
		[Embed(source = "/lib/AlienSpaceCraft_v2.png")]
		private var ShipView:Class;
		
		public function AAAlienShip(universe:Universe) 
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
			
			
			this.delegate = new AAAlienShipController(this);
			
		}
		
	}

}