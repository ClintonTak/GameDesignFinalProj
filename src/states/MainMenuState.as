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
	
	public class MainMenuState extends StarlingState{
		public function MainMenuState(){
			super(); 
		}
		
		override public function initialize():void{
			super.initialize(); 
			
			var background:CitrusSprite = new CitrusSprite("bg", {x: 0, y: 0, width: 400, height: 680});
			background.view = Assets.getImage("fbBackground");
			add(background);
			
			var gameTitle:TextField;
			gameTitle = new TextField(200, 200, "Flappy Bird", "ChunkFive", 40, 0xA0FF52);
			gameTitle.x = 200 - gameTitle.width*.5;
			gameTitle.y = 340 - 350;
			addChild(gameTitle);
			
			var playBtnUpTexture:Texture = Texture.fromBitmap(Assets.getImage("play")); 
			var playBtnDownTexture:Texture = Texture.fromBitmap(Assets.getImage("playhover")); 
			var playButton:Button = new Button(playBtnUpTexture, "", playBtnDownTexture, playBtnDownTexture);
			playButton.x = 200 - playButton.width * .5; 
			playButton.y = gameTitle.y + playButton.height; 
			playButton.addEventListener(Event.TRIGGERED, onClickPlay); 
			addChild(playButton); 
			
			var instructionBtnUpTexture:Texture = Texture.fromBitmap(Assets.getImage("instructions"));
			var instructionBtnDownTexture:Texture = Texture.fromBitmap(Assets.getImage("instructionshover")); 
			var instructionButton:Button = new Button(instructionBtnUpTexture, "", instructionBtnDownTexture, instructionBtnDownTexture); 
			instructionButton.scale = .55;
			instructionButton.x = 200 - instructionButton.width * .5; 
			instructionButton.y = playButton.y + instructionButton.height + 150; 
			instructionButton.addEventListener(Event.TRIGGERED, onClickInstruction);
			addChild(instructionButton); 
		}
		
		public function onClickPlay(e:Event):void{
			CitrusEngine.getInstance().state = new PlayState();
		}
		
		public function onClickInstruction(e:Event):void{ 
			CitrusEngine.getInstance().state = new InstructionState();
		}	
	}
}