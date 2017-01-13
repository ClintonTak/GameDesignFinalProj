package states{
	import flash.display.Bitmap;
	import starling.textures.Texture;
	import states.InstructionState;
	import states.PlayState;
	import citrus.core.CitrusEngine; 
	import citrus.core.starling.StarlingState;
	import starling.text.TextField;
	import Assets;
	import utils.Config;
	import starling.display.Button;
	import starling.events.Event;
	import citrus.objects.CitrusSprite;
	import utils.Config;
	import utils.SoundManager;
	
	public class MainMenuState extends StarlingState{
		private var _titleScreenSFX:utils.SoundManager = new utils.SoundManager("./sounds/titlescreen.mp3");
		
		public function MainMenuState(){
			super(); 
		}
		
		override public function initialize():void{
			super.initialize(); 
			_titleScreenSFX.playSound();
			
			var background:CitrusSprite = new CitrusSprite("bg", {x: 0, y: 0, width: Config.WORLDWIDTH, height: Config.WORLDHEIGHT});
			background.view = Assets.getImage("fbBackground");
			add(background);
			
			var gameTitle:TextField;
			gameTitle = new TextField(200, 200, "Flappy Bird", "ChunkFive", 55, Config.LIMEGREEN);
			gameTitle.x = Config.CENTERX - gameTitle.width*.5;
			gameTitle.y = Config.CENTERY - 350;
			addChild(gameTitle);
			
			var playBtnUpTexture:Texture = Texture.fromBitmap(Assets.getImage("play")); 
			var playBtnDownTexture:Texture = Texture.fromBitmap(Assets.getImage("playhover")); 
			var playButton:Button = new Button(playBtnUpTexture, "", playBtnDownTexture, playBtnDownTexture);
			playButton.x = Config.CENTERX - playButton.width * .5; 
			playButton.y = gameTitle.y + playButton.height; 
			playButton.addEventListener(Event.TRIGGERED, onClickPlay); 
			addChild(playButton); 
			
			var instructionBtnUpTexture:Texture = Texture.fromBitmap(Assets.getImage("instructions"));
			var instructionBtnDownTexture:Texture = Texture.fromBitmap(Assets.getImage("instructionshover")); 
			var instructionButton:Button = new Button(instructionBtnUpTexture, "", instructionBtnDownTexture, instructionBtnDownTexture); 
			instructionButton.scale = .55;
			instructionButton.x = Config.CENTERX - instructionButton.width * .5; 
			instructionButton.y = playButton.y + instructionButton.height + 150; 
			instructionButton.addEventListener(Event.TRIGGERED, onClickInstruction);
			addChild(instructionButton); 
		}
		
		public function onClickPlay(e:Event):void{
			_titleScreenSFX.stopSound();
			CitrusEngine.getInstance().state = new PlayState();
		}
		
		public function onClickInstruction(e:Event):void{ 
			_titleScreenSFX.stopSound();
			CitrusEngine.getInstance().state = new InstructionState();
		}	
	}
}