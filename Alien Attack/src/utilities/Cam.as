package utilities 
{
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Eugene
	 */
	public class Cam extends Sprite 
	{
		
		public function Cam() 
		{
			this.graphics.lineStyle(2, 0xff0000, 0.5);
			this.graphics.drawRect(0, 0, 240, 180);
		}
		
	}

}