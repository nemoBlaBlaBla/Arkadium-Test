package com.objects.spaceobjects 
{
	import com.objects.shipmodules.cannons.AAAlienBlaster;
	import com.objects.shipmodules.AACannon;
	import com.objects.shipmodules.cannons.AAMachineGun;
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
		
		[Embed(source = "/lib/SpaceShip_v2.png")]
		private var ShipView:Class;
		
		public function AAPlayerShip(universe:Universe) 
		{
			this.view = new ShipView();
			
			this.view.x = -view.width / 2;
			this.view.y = -view.height / 2;
			this.addChild(this.view);
			
			this.mass = 1000;
			this.resistanceFactor = 50;
			this.angularResistanceFactor = 300;
			this.engine = new AAEngine(this, 500, 700);
			this.addChild(this.engine);
			
			//this.cannon = new AACannon(this);
			//this.cannon = new AAAlienBlaster(this);
			this.cannon = new AAMachineGun(this);
			
			this.delegate = new PlayerController(this);
			
			super(universe);
		}
		
	}

}