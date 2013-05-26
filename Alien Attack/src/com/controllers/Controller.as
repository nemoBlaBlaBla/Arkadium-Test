package com.controllers
{
	import com.objects.spaceobjects.AASpaceShip;
	import flash.display.Sprite;
	
	import flash.events.TimerEvent;
	import flash.events.Event;
	import flash.utils.Timer;
	import utilities.GlobalTimer;
	
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
			_ship.addChild(this);
		}
	}

}