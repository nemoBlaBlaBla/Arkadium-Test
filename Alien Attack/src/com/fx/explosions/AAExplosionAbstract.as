package com.fx.explosions 
{
	import flash.display.Sprite;
	import com.universe.AAUniverse;
	import flash.media.Sound;
	
	/**
	 * ...
	 * @author Eugene Tkachenko
	 */
	public class AAExplosionAbstract extends Sprite 
	{
		//properties
		private var _explosionSound:Sound;
		
		//private fields
		protected var _universe:AAUniverse;
		
		public function AAExplosionAbstract(universe:AAUniverse) 
		{
			_universe = universe;
		}
		
		
		public function Explode() : void
		{
			if (this.explosionSound)
			{
				this.explosionSound.play();
			}
		}
		
		
//{ SETTERS AND GETTERS
		public function get explosionSound():Sound 
		{
			return _explosionSound;
		}
		
		public function set explosionSound(value:Sound):void 
		{
			_explosionSound = value;
		}
	}
//}

}