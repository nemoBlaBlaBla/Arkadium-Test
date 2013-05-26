package com.objects.spaceobjects 
{
	
	/**
	 * ...
	 * @author Eugene Tkachenko
	 */
	public interface AAISpaceObjectDelegate 
	{
		function Update(currentObject:AASpaceObject) : void;
		
		function OnHit(currentObject:AASpaceObject, hittedObject:AASpaceObject) : void;
		
		function OnDestroy(currentObject:AASpaceObject) : void;
	}
	
}