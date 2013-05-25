package com.objects.spaceobjects 
{
	import flash.display.Sprite
	import com.controllers.PlayerController;
	import com.universe.Universe;
	import com.objects.shipmodules.AAEngine;
	
	/**
	 * ...
	 * @author Eugene Tkachenko
	 */
	public class AAPlayerShip extends AASpaceShip 
	{
		
		[Embed(source = "/lib/SpaceShip_v2small.svg")]
		private var ShipView:Class;
		
		public function AAPlayerShip(universe:Universe) 
		{
			super(universe);
			
			this.mass = 1000;
			this.resistanceFactor = 50;
			this.angularResistanceFactor = 70;
			this.engine = new AAEngine(this, 500, 300);
			this.controller = new PlayerController(this);
			
			var view:Sprite = new ShipView();
			this.addChild(this.engine);
			view.x = -view.width / 2;
			view.y = -view.height / 2;
			this.addChild(view);
		}
		
	}

}