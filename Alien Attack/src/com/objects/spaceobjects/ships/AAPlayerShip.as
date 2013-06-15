package com.objects.spaceobjects.ships 
{
	import com.objects.shipmodules.guns.AAAlienBlaster;
	import com.objects.shipmodules.guns.AAGunAbstract;
	import com.objects.shipmodules.guns.AAMachineGun;
	import flash.display.Sprite
	import com.behaviours.AAPlayerBehaviour;
	import com.universe.AAUniverse;
	import com.objects.shipmodules.AAEngine;
	
	/**
	 * ...
	 * @author Eugene Tkachenko
	 */
	public class AAPlayerShip extends AASpaceShip 
	{
		[Embed(source="../../../../lib/images/ships/space_ship.png")]
		private var ShipView:Class;
		
		public function AAPlayerShip(universe:AAUniverse) 
		{
			super(universe);
			this.view = new ShipView();
			
			this.mass = 1000;
			this.resistanceFactor = 50;
			this.angularResistanceFactor = 300;
			this.engine = new AAEngine(this, 500, 700);
			this.addChild(this.engine);
			
			this.gun = new AAMachineGun(this);
			this.behaviour = new AAPlayerBehaviour(this);
			
			
		}
		
	}

}