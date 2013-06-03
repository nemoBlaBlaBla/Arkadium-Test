package com.universe
{
	/**
	 * ...
	 * @author Eugene
	 */
	public class AATestUniverse extends AAUniverse
	{		
		[Embed(source="../../lib/images/universe/space_texture.jpg")]
		public var SpaceTexture:Class;
		
		public function AATestUniverse()
		{
			this.backgroundTexture = new SpaceTexture();
		}
	}
}