package com.objects.shipmodules.cannons 
{
	import com.objects.spaceobjects.*;
	import com.objects.spaceobjects.shells.*;
	import com.objects.shipmodules.AACannon;
	
	/**
	 * ...
	 * @author Eugene Tkachenko
	 */
	public class AAAlienBlaster extends AACannon 
	{
		
		public function AAAlienBlaster(ship:AASpaceShip) 
		{
			super(ship);
			
			_spreading = 5;
			_fireRate = 2;
			_shellType = AABlasterShell;
		}
		
	}

}