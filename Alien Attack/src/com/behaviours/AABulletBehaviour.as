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
		
		private static var _instance:AABulletBehaviour;
		
		public function AABulletBehaviour(privateClass:PrivateClass) 
		{
			
		}
		
		public static function SharedInstance():AABulletBehaviour
		{
			if (!_instance)
			{
				_instance = new AABulletBehaviour(new PrivateClass());
			}
			return _instance;
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
			if (currentObject.stage &&
				currentObject.x > 0 && 
				currentObject.x < currentObject.stage.stageWidth &&
				currentObject.y > 0 &&
				currentObject.y < currentObject.stage.stageHeight)
			{
				var explosion:AASmallExplosion = new AASmallExplosion(currentObject.universe);
				explosion.x = currentObject.x;
				explosion.y = currentObject.y;
				explosion.Explode();
				explosion = null;
			}
			currentObject = null;
		}
	}
}

class PrivateClass 
{
	public function PrivateClass()
	{
		
	}
}