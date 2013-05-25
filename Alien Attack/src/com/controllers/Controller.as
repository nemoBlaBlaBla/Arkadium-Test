package com.controllers
{
	import com.objects.spaceobjects.AASpaceShip;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Eugene
	 */
	public class Controller extends Sprite
	{
		
		protected var _ship:AASpaceShip;
		
		public function Controller(ship:AASpaceShip)
		{
			_ship = ship;
		}
	}

}