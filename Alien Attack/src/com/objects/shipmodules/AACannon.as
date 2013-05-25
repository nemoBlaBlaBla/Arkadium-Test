package com.objects.shipmodules 
{
	import com.objects.spaceobjects.AASpaceShip;
	/**
	 * ...
	 * @author Eugene Tkachenko
	 */
	public class AACannon 
	{
		
		private var _fireRate : Number = 0;
		private var _ship : AASpaceShip;
		//private var _shell : AACannonShell;
		
		public function AACannon(ship : AASpaceShip) 
		{
			_ship = ship;
		}
		
		public function SingleShot()
		{
			
		}
		
	}

}