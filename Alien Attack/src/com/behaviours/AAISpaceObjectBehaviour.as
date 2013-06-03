package com.behaviours 
{
	import com.objects.spaceobjects.AASpaceObject
	
	/**
	 * ...
	 * @author Eugene Tkachenko
	 */
	public interface AAISpaceObjectBehaviour 
	{
		function Update(currentObject:AASpaceObject) : void;
		
		function OnHit(currentObject:AASpaceObject, hittedObject:AASpaceObject) : void;
		
		function OnDestroy(currentObject:AASpaceObject) : void;
	}
	
}