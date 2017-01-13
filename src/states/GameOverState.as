package states {
	import citrus.core.starling.StarlingState;
	import citrus.objects.CitrusSprite;
	import starling.text.TextField;
	import states.PlayState;
	import Assets;
	import starling.display.Button;
	import starling.events.Event;
	import starling.textures.Texture;
	import citrus.core.CitrusEngine;
	import utils.Config;
	
	public class GameOverState extends StarlingState{
		private var _background:CitrusSprite; 
		private var _gameOver:TextField;
		private var _score:TextField; 
		private var _backButton:Button 
		
		public function GameOverState() {
			super(); 
		}
		
		override public function initialize():void{
			super.initialize(); 
			
			_background = new CitrusSprite("bg", {x: 0, y: 0, width: 400, height: 680});
			_background.view = Assets.getImage("fbBackground");
			add(_background);
			
			_gameOver = new TextField(300, 300, "Game Over! Your score was: ", "ChunkFive", 20, 0x123456);
			_gameOver.x = 200 - _gameOver.width*.5;
			_gameOver.y = 340 - 350;
			addChild(_gameOver);
			
			_score = new TextField(300, 300, String(PlayState._score), "ChunkFive", 60, 0x123456); 
			_score.x = Config.CENTERX - _gameOver.width * .5; 
			_score.y = _gameOver.y + _score.width *.5; 
			addChild(_score); 
			
			var backBtnTexture:Texture = Texture.fromBitmap(Assets.getImage("back"));  
			_backButton= new Button(backBtnTexture, "");
			_backButton.x = Config.CENTERX - _backButton.width * .5; 
			_backButton.y = _score.y + _backButton.height; 
			_backButton.addEventListener(Event.TRIGGERED, onClickBack); 
			addChild(_backButton); 
		}
		
		public function onClickBack(e:Event):void{
			CitrusEngine.getInstance().state = new MainMenuState();
		}
		
		override public function update(timeDelta:Number):void{
			super.update(timeDelta);
		}
		
		override public function destroy():void{
			super.destroy(); 
			remove(_background);
			removeChild(_gameOver); 
			removeChild(_backButton); 
			removeChild(_score);
		}
	}
}