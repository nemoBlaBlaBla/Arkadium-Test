package com.behaviours 
{
	import com.objects.spaceobjects.AASpaceObject;
	import com.objects.spaceobjects.bonuses.AABonusAbstract;
	import com.objects.spaceobjects.ships.AAPlayerShip;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Eugene Tkachenko
	 */
	public class AABonusBehaviour implements AAISpaceObjectBehaviour 
	{
		
		public function AABonusBehaviour() 
		{
			
		}
		
		/* INTERFACE com.behaviours.AAISpaceObjectBehaviour */
		
		public function Update(currentObject:AASpaceObject):void 
		{
			currentObject.velocity = new Point(0, 3);
			if (currentObject.y > currentObject.stage.stageHeight)
			{
				(currentObject as AABonusAbstract).Destroy();
			}
		}
		
		public function OnHit(currentObject:AASpaceObject, hittedObject:AASpaceObject):void 
		{
			if (hittedObject is AAPlayerShip)
			{
				(currentObject as AABonusAbstract).ApplyBonus(hittedObject as AAPlayerShip);
				currentObject.Destroy();
			}
		}
		
		public function OnDestroy(currentObject:AASpaceObject):void 
		{
			
		}
		
	}

}