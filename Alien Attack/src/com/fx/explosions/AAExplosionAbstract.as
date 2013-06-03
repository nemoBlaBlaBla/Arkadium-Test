package com.fx.explosions 
{
	import flash.display.Sprite;
	import com.universe.AAUniverse;
	
	/**
	 * ...
	 * @author Eugene Tkachenko
	 */
	public class AAExplosionAbstract extends Sprite 
	{
		protected var _universe:AAUniverse;
		
		public function AAExplosionAbstract(universe:AAUniverse) 
		{
			_universe = universe;
		}
		
		
		public function Explode() : void
		{
			
		}
	}

}