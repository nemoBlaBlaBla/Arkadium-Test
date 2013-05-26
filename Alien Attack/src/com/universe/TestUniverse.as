package com.universe
{
	import com.objects.spaceobjects.AAPlayerShip;
	import flash.display.Bitmap;
	import flash.events.MouseEvent;
	import com.objects.spaceobjects.AACannonShell;
	
	/**
	 * ...
	 * @author Eugene
	 */
	public class TestUniverse extends Universe
	{
		
		[Embed(source="/lib/CheckersTexture.png")]
		public var CheckersTexture:Class;
		
		public function TestUniverse()
		{
			//var tex:Bitmap = new CheckersTexture();
			
			var texarr:Array = new Array(10);
			
			for (var i:int = 0; i < 10; i++)
			{
				texarr[i] = new Array(10);
				for (var j:int = 0; j < 10; j++)
				{
					texarr[i][j] = new CheckersTexture();
					texarr[i][j].x = texarr[i][j].width * i;
					texarr[i][j].y = texarr[i][j].height * j;
					this.addChild(texarr[i][j]);
				}
			}
			
			//this.addEventListener(MouseEvent.CLICK, OnClick);
		}
		
		
		//private function OnClick(e:MouseEvent):void 
		//{
			//var brl:AACannonShell = new AACannonShell(this, 25, 10);
			//var brl:AAPlayerShip = new AAPlayerShip(this);
			//brl.x = mouseX;
			//brl.y = mouseY;
			//brl.rotation = 30;
			//this.addChild(brl);
		//}
	}
}