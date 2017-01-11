package states 
{
	import states.InstructionState;
	import states.PlayState;
	import citrus.core.CitrusEngine; 
	import citrus.core.starling.StarlingState;
	import starling.text.TextField;
	import Assets;
	//import feathers.controls.Label;
	//import ui.Label;
	import flash.events.MouseEvent;
	import utils.Config;
	//import flash.display.SimpleButton;
	import starling.display.Button;
	//import flash.text.TextFormat;
	//import flash.text.FontStyle;
	
	
	public class MainMenuState extends StarlingState
	{
		//private var _gameTitle:Label = new Label ("Flappy Bird!", 124, Config.getColor("limegreen", "color") , Config.getSetting("font", "settings"), true); 
		
		/*private var _playButton:Button = new Button(Assets.getImage("play"), 
							Assets.getImage("playhover"), Assets.getImage("playhover"), Assets.getImage("play")); 
		private var _instructionButton:Button = new Button(Assets.getImage("instructions"), 
							Assets.getImage("instructionshover"), Assets.getImage("instructionshover"), Assets.getImage("instructions")); 
							*/
		public function MainMenuState() 
		{
			super(); 
		}
		
		override public function initialize():void{
			super.initialize(); 
			var textField:TextField;
			textField = new TextField(200, 200, "CLICK TO FLY", "Flappy", 20, 0x123456);
			textField.x = 200;
			textField.y = 200;
			trace("landed");
			addChild(textField);
			
			//var label:Label = new Label(); 
			//label.text = "test"; 
			//this.addChild(label); 
			//trace(utils.Config.getNumber("center_x", "world"));
			//label. = new TextFormat( "Helvetica", 20, 0x3c3c3c );
			//label.x = 200 - label.width/2; 
			//label.y = 340 - 100; 
			
			
			/*addChild(_playButton);
			_playButton.x = Config.getNumber("center_x", "world") - _playButton.width * .5; 
			_playButton.y = _gameTitle.y + _gameTitle.textHeight + 100;
			_playButton.addEventListener(MouseEvent.CLICK, onClickPlay); 
			
			addChild(_instructionButton); 
			_instructionButton.x = Config.getNumber("center_x", "world") - _instructionButton.width * .5; 
			_instructionButton.y = _playButton.y + _playButton.height; 
			_instructionButton.width = _instructionButton.width ; 
			_instructionButton.addEventListener(MouseEvent.CLICK, onClickInstruction); 
		*/
		}
		
		public function onClickPlay(e:MouseEvent):void {
			CitrusEngine.getInstance().state = new PlayState();
		}
		
		public function onClickInstruction(e:MouseEvent):void{
			CitrusEngine.getInstance().state = new InstructionState();
		}
	}

}