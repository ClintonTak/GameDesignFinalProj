package {
	import citrus.core.State;
	import citrus.core.starling.StarlingCitrusEngine;
	import citrus.core.starling.StarlingState;
	import feathers.controls.NumericStepper;
	import states.PlayState;
	import states.MainMenuState;
	import states.GameOverState;
	import states.InstructionState;
    import starling.core.Starling;
	
	[SWF(frameRate = "60", width = "400", height = "680")]
	public class Main extends StarlingCitrusEngine {
		public static const MENU_STATE:Number = 0;
		public static const PLAY_STATE:Number = 1;
		public static const GAME_OVER_STATE:Number = 2;
		public static const INSTRUCTION_STATE:Number = 3; 
		
		private var _currentState:StarlingState; 
		
		public function Main(){
			super();
			Starling.handleLostContext = true; 
		}
		
		override public function initialize():void {
			setUpStarling(true);
		}
		
		override public function handleStarlingReady():void
		{
			state = new MainMenuState();
			//state = new PlayState(); 
		}
	}
}

