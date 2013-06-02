package com.controllers 
{
	import com.fx.explosions.AASmallExplosion;
	import com.objects.spaceobjects.AAISpaceObjectDelegate;
	import com.objects.spaceobjects.AASpaceObject;
	
	/**
	 * ...
	 * @author Eugene Tkachenko
	 */
	public class AACannonShellBehaviourDelegate implements AAISpaceObjectDelegate 
	{
		
		public function AACannonShellBehaviourDelegate() 
		{
			
		}
		
		/* INTERFACE com.objects.spaceobjects.AAISpaceObjectDelegate */
		
		public function Update(currentObject:AASpaceObject):void 
		{
			
		}
		
		public function OnHit(currentObject:AASpaceObject, hittedObject:AASpaceObject):void 
		{
			
		}
		
		public function OnDestroy(currentObject:AASpaceObject):void 
		{
			var explosion:AASmallExplosion  = new AASmallExplosion(currentObject.universe);
			explosion.x = currentObject.x;
			explosion.y = currentObject.y;
			explosion.Explode();
			explosion = null;
		}
		
	}

}