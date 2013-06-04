package com.behaviours 
{
	import com.fx.explosions.AASmallExplosion;
	import com.behaviours.AAISpaceObjectBehaviour;
	import com.objects.spaceobjects.AASpaceObject;
	
	/**
	 * ...
	 * @author Eugene Tkachenko
	 */
	public class AABulletBehaviour implements AAISpaceObjectBehaviour 
	{
		
		public function AABulletBehaviour() 
		{
			
		}
		
		/* INTERFACE com.objects.spaceobjects.AAISpaceObjectBehaviour */
		
		public function Update(currentObject:AASpaceObject):void 
		{
			
		}
		
		public function OnHit(currentObject:AASpaceObject, hittedObject:AASpaceObject):void 
		{
			
		}
		
		public function OnDestroy(currentObject:AASpaceObject):void 
		{
			var explosion:AASmallExplosion = new AASmallExplosion(currentObject.universe);
			explosion.x = currentObject.x;
			explosion.y = currentObject.y;
			explosion.Explode();
			explosion = null;
			currentObject = null;
		}
		
	}

}