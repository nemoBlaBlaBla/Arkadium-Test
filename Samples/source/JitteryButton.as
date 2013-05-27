package {
	
	import flash.display.Sprite;
	import flash.display.SimpleButton;
	import flash.display.BitmapData;
	import flash.display.BitmapDataChannel;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.filters.DisplacementMapFilter;
	import flash.filters.DisplacementMapFilterMode;
	import flash.geom.Point;
	import flash.media.Sound;
	
	
	import caurina.transitions.Tweener;
	
	public class JitteryButton extends Sprite{
		
		private var myButton:SimpleButton;

		private var staticTimes:int;
		private var fuzzMin:int;
		private var fuzzMax:int;

		private var dmFilter:DisplacementMapFilter = createDMFilter();
		private var staticSound:Sound = new StaticSound();


		// CLASS CONSTRUCTOR
		public function JitteryButton(button:SimpleButton) {
			myButton = button;
			
			// add the rollover event listeners to the button
			myButton.addEventListener(MouseEvent.ROLL_OVER, onButtonRollOver);
			myButton.addEventListener(MouseEvent.ROLL_OUT, onButtonRollOut);
			
			// start displaying the static effect
			addEventListener(Event.ENTER_FRAME, displayStatic);
		}

		
		// increase the intensity of the static to HIGH
		private function setStaticHigh(e:MouseEvent = null):void {	
			fuzzMin = 12;
			fuzzMax = 25;
			staticTimes = 12;
		}
		
		// called on button ROLL_OVER
		private function onButtonRollOver(e:MouseEvent):void {
			Tweener.addTween(myButton, {scaleX: 1.1, time: .5, transition: "easeOutElastic"});
			setStaticHigh();
			staticSound.play();
		}
		
		// called on button ROLL_OOUT
		private function onButtonRollOut(e:MouseEvent):void {
			Tweener.addTween(myButton, {scaleX: 1, time: .5, transition: "easeOutElastic"});
			setStaticMedium();
		}
		
		// increase the intensity of the static to MEDIUM
		private function setStaticMedium(e:MouseEvent = null):void {
			fuzzMin = 2;
			fuzzMax = 6;
			staticTimes = randRange(8, 12);
		}

		// called on ENTER_FRAME
		private function displayStatic(e:Event):void {
			staticTimes --;
	
			dmFilter.scaleX = randRange(fuzzMin, fuzzMax);
			dmFilter.mapPoint = new Point(0, randRange(0, -160));
			myButton.filters = new Array(dmFilter);
	
			if(staticTimes <= 0){
				fuzzMin = 0;
				fuzzMax = 2;
			}
		}

		// create the displacement map filter
		private function createDMFilter():DisplacementMapFilter {
		
			var mapBitmap:BitmapData = new StaticMap(0,0); // use the bitmap data from our StaticMap image
			var mapPoint:Point       = new Point(0, 0);  // this is the position of the StaticMap image in relation to our button
			var channels:uint        = BitmapDataChannel.RED; // which color to use for displacement
			var componentX:uint      = channels;
			var componentY:uint      = channels;
			var scaleX:Number        = 5; // the amount of horizontal shift
			var scaleY:Number        = 1; // the amount of vertical shift
			var mode:String          = DisplacementMapFilterMode.COLOR;
			var color:uint           = 0;
			var alpha:Number         = 0;

			return new DisplacementMapFilter(
							mapBitmap,
							mapPoint,
							componentX,
							componentY,
							scaleX,
							scaleY,
							mode,
							color,
							alpha	);
	
		}
	
		// returns a random number between the specified range (inclusive)
		private function randRange(min:int, max:int):int {
		    var randomNum:int = Math.floor(Math.random() * (max - min + 1)) + min;
		    return randomNum;
		}
	
	}

}