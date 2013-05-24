package utilities
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.filters.GlowFilter;
	import flash.sampler.NewObjectSample;
	import flash.text.Font;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import mx.effects.Glow;
	
	/**
	 * ...
	 * @author Eugene
	 */
	public class HUD extends Sprite
	{
		public var _tf:TextField = new TextField();
		
		//[Embed(source = "../../bin/OCR_OneCTT.swf", fontFamily = "OCR_OneCTT")]
		//public var MyFont2:Class;
		//[Embed(source="../../bin/Pixel10.swf", fontFamily="Pixel10")]
		//public var MyFont:Class;
		
		public function HUD()
		{
			this.addEventListener(Event.ADDED_TO_STAGE, onAddingToStage);
		}
		
		private function onAddingToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddingToStage);
			
			var FilterArray:Array = new Array(1);
			//FilterArray[0] = new GlowFilter(0x00ff00, 2, 3, 3, 1, 3);
			//var tformat:TextFormat = new TextFormat("Consolas", 16, 0x99ff99);
			_tf.antiAliasType = "advanced";
			_tf.embedFonts = true;
			//_tf.filters = FilterArray;
			_tf.textColor = 0xffffff;
			_tf.width = 400;
			_tf.height = 600;
			//_tf.defaultTextFormat = (tformat);
			this.addChild(_tf);
			var fpsCounter:FPSCounter = new FPSCounter();
			fpsCounter.y = 0;
			fpsCounter.x = stage.stageWidth - fpsCounter.width;
			this.addChild(fpsCounter);
		}
	}
}