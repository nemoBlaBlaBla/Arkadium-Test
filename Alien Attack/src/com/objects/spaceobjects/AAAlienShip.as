package com.objects.spaceobjects 
{
	import com.universe.Universe;
	/**
	 * ...
	 * @author Eugene Tkachenko
	 */
	public class AAAlienShip extends AASpaceShip 
	{
		
		[Embed(source = "/lib/AlienSpaceCraft_v2small.svg")]
		private var ShipView:Class;
		
		public function AAAlienShip(universe:Universe) 
		{
			super(universe);
			
			this.mass = 1000;
			this.resistanceFactor = 50;
			this.angularResistanceFactor = 70;
			this.engine = new AAEngine(this, 200, 300);
			this.addChild(this.engine);
			
			var view:Sprite = new ShipView();
			view.x = -view.width / 2;
			view.y = -view.height / 2;
			this.addChild(view);
			
		}
		
	}

}