package states 
{
	import citrus.core.starling.StarlingState;
	import cmodule.AwayPhysics.CVoidTypemap;
	
	import Assets;
	import ui.Label;
	import flash.events.MouseEvent;
	import Config;
	//import flash.display.SimpleButton;
	import starling.display.Button;
	
	public class MainMenuState extends StarlingState
	{
		/*private var _gameTitle:Label = new Label ("Flappy Bird!", 124, Config.getColor("limegreen", "color") , Config.getSetting("font", "settings"), true); 
		private var _playButton:Button = new Button(Assets.getImage("play"), 
							Assets.getImage("playhover"), Assets.getImage("playhover"), Assets.getImage("play")); 
		private var _instructionButton:Button = new Button(Assets.getImage("instructions"), 
							Assets.getImage("instructionshover"), Assets.getImage("instructionshover"), Assets.getImage("instructions")); 
							*/
		public function MainMenuState() 
		{
			super(); 
		}
		
		/*public function intitialize():void{
			super.initialize(); 
			 
			addChild(_gameTitle); 
			_gameTitle.x = Config.getNumber("center_x", "world") - _gameTitle.textWidth * .5; 
			_gameTitle.y = Config.getNumber("center_y", "world") - 250;
			
			addChild(_playButton);
			_playButton.x = Config.getNumber("center_x", "world") - _playButton.width * .5; 
			_playButton.y = _gameTitle.y + _gameTitle.textHeight + 100;
			_playButton.addEventListener(MouseEvent.CLICK, onClickPlay); 
			
			addChild(_instructionButton); 
			_instructionButton.x = Config.getNumber("center_x", "world") - _instructionButton.width * .5; 
			_instructionButton.y = _playButton.y + _playButton.height; 
			_instructionButton.width = _instructionButton.width ; 
			_instructionButton.addEventListener(MouseEvent.CLICK, onClickInstruction); 
		
		}
		
		public function onClickPlay(e:MouseEvent):void {
			//_startSFX.playSound(); 
			_fsm.changeState(Game.PLAY_STATE); 
		}
		
		public function onClickInstruction(e:MouseEvent):void{
			_fsm.changeState(Game.INSTRUCTION_STATE); 
		}*/
	}

}