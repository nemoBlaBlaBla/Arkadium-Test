package com.universe
{
	import com.objects.spaceobjects.AACannonShell;
	import com.objects.spaceobjects.AASpaceObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.geom.Rectangle;
	import flash.utils.Timer;
	import utilities.Cam;
	import utilities.GlobalTimer;
	
	/**
	 * ...
	 * @author Eugene
	 */
	public class Universe extends Sprite
	{
		protected var _focusObject:AASpaceObject;
		
		public function Universe()
		{	
			//this.addEventListener(Event.ADDED_TO_STAGE, onAdding);
		}
		
		public function SetCameraTo(object:AASpaceObject):void
		{
			_focusObject = object;
		}
		
		//private function onAdding(e:Event):void
		//{
			//trace(parent.name);
			//trace(stage.stageHeight);
		//}
	
	}
}