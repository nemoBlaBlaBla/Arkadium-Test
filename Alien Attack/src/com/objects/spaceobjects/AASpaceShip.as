package com.objects.spaceobjects 
{
	import com.controllers.Controller;
	import com.objects.shipmodules.Engine;
	import com.universe.Universe;
	import flash.display.Sprite;
	import flash.events.TimerEvent;
	import utilities.GlobalTimer;
	
	/**
	 * ...
	 * @author Eugene
	 */
	public class AASpaceShip extends AASpaceObject 
	{
		[Embed(source="/lib/SpaceShip_v2.svg")]
		public var ShipView:Class;

		
		public var _engine:Engine;// = new Engine(this);
		protected var _controller:Controller;
		
		protected var _shipTimer:GlobalTimer = GlobalTimer.GetInstance();
		//protected var _view:Sprite;
		
		
		public function AASpaceShip(universe:Universe) 
		{
			super(universe);
			_engine = new Engine(this);
			var view:Sprite = new ShipView();
			view.scaleX = 0.25;
			view.scaleY = 0.25;
			this.addChild(_engine);
			view.x = -view.width / 2;
			view.y = -view.height / 2;
			this.addChild(view);
			
			
			_shipTimer.addEventListener(TimerEvent.TIMER, onTimerTick);
			
		}
		
		private function onTimerTick(e:TimerEvent):void 
		{	
			this.verticalThrustForce = _engine.currentVerticalThrustForce;
			this.horizontalThrustForce = _engine.currentHorizontalThrustForce;
			this.rotationForce = _engine.currentRotationForce;
		}
		
		public function get controller():Controller 
		{
			return _controller;
		}
		
		public function set controller(value:Controller):void 
		{
			_controller = value;
		}
		
		
		
	}

}