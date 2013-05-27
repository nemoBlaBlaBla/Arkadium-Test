package {
	import flash.display.MovieClip;

	public class Game extends MovieClip {
		
		private var startButton:JitteryButton;
		private var menuButton:JitteryButton;
		
		// CLASS CONSTRUCTOR
		public function Game() {
			// create the jittery buttons from the simple buttons on the stage
			startButton = new JitteryButton(button1);
			addChild(startButton);
			
			// adding new buttons is easy!
			menuButton = new JitteryButton(button2);
			addChild(menuButton);
		}
	
	}

}