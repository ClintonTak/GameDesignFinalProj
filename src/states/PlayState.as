package states 
{
	import citrus.core.starling.StarlingState;
	import citrus.objects.CitrusSprite;
	import gameObjects.Bird;
	import starling.display.DisplayObject;
	import starling.display.Image;
	import citrus.core.CitrusEngine;
	import starling.text.TextField;
	import starling.textures.Texture;
	import starling.utils.Color;
	import citrus.input.controllers.Keyboard;
	// Eaze Tween lib: http://code.google.com/p/eaze-tween/
	import aze.motion.eaze;
	import starling.display.Sprite;
	import starling.utils.AssetManager;
	import Assets;
	import utils.Key;
	import states.GameOverState;
	
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	
	
	
	public class PlayState extends StarlingState
	{
		private var ce:CitrusEngine;
		private var _kb:Keyboard;
		
		private var _assets:AssetManager;
		
		// we only need to use 2 pipes in the game
		private var _pipe1:CitrusSprite;
		private var _pipe2:CitrusSprite;
		// sets the Y position of the pipes
		private var _pipeY:Number;
	
		private var _bird:Bird; 
		private var _birdBounds:Rectangle;
		
		// make the character fly
		private var _flying:Boolean;
		private var _velocity:Number = 0;
		private var _gravity:Number = 0.4;
		
		private var _pipeBoundsTop1:Rectangle;
		private var _pipeBoundsBottom1:Rectangle;
		private var _pipeBoundsTop2:Rectangle;
		private var _pipeBoundsBottom2:Rectangle;
		private var _gameStarted:Boolean;
		private var scoreText:TextField;
		public static var _score:Number = 0;
		
		
		//used to pause the game 
		private var _paused:Boolean = false; 
		private var _frameCount:Number = 0;//makes sure the key isn't being reread too soon after pausing/resuming and canceling out the previous action 
		private var _pauseLabel:TextField = new TextField(300, 300, "The Game is Paused. \n Press Escape to resume the game.", "ChunkFive", 40, 0x123456);
			
		public function PlayState()
		{
			super();
		}
		
		override public function initialize():void
		{
			super.initialize();
			ce = CitrusEngine.getInstance();
			
			loadAssets();
			
			_kb = ce.input.keyboard;
			_kb.addKeyAction("fly", Keyboard.SPACE);
			_kb.addKeyAction("togglePause", Keyboard.ESCAPE);
			//if (Key.isDown(Key.FLY)){
			//	_bird.fly(); 
			//}
		}
		
		private function loadAssets():void {
			_assets = new AssetManager();
			_assets.verbose = true;
			_assets.enqueue(Assets);
			_assets.loadQueue(function(ratio:Number):void
				{
					trace("Loading assets, progress:", ratio);
					if (ratio == 1.0)
						// add game elements
						drawScreen();
				});
		}
		
		private function drawScreen():void
		{
			var background:CitrusSprite = new CitrusSprite("bg", {x: 0, y: 0, width: 400, height: 680});
			background.view = Assets.getImage("fbBackground");
			add(background);
			newGame();
		}

		public function newGame():void
		{
			// get a random Y position for first pipe
			randomizePipeY();
			_pipe1 = new CitrusSprite("pipe", {x: 380, y: _pipeY, width: 60, height: 900});
			_pipe1.view = new Image(_assets.getTexture("pipe.png"));
			add(_pipe1);
			_pipeBoundsTop1 = new Rectangle(0, 0, 50, 355);
			_pipeBoundsBottom1 = new Rectangle(0, 0, 50, 630);
			// get a random Y position for second pipe
			randomizePipeY();
			_pipe2 = new CitrusSprite("pipe2", {x: 620, y: _pipeY, width: 60, height: 900});
			_pipe2.view = new Image(_assets.getTexture("pipe.png"));
			add(_pipe2);
			_pipeBoundsTop2 = new Rectangle(0, 0, 50, 355);
			_pipeBoundsBottom2 = new Rectangle(0, 0, 50, 630);
			
			_bird = new Bird("bird", {x:100, y:200, width:30, height:35});
			add(_bird);
			
			_birdBounds = new Rectangle(0, 0, 30, 35);
			_bird.setBounds(_birdBounds); 

			scoreText = new TextField(300, 50, "Score: 0", "ChunkFive", 20, Color.NAVY);
			scoreText.hAlign = "right";
			scoreText.x = 10;
			scoreText.y = -10;
			addChild(scoreText);
			// a few more things
			_gameStarted = true;
			_score = 0;
			_velocity = -7;
		
		}
		
		// get a new Y position for a pipe
		private function randomizePipeY():void
		{
			_pipeY = new Number(Math.floor(Math.random() * -150) + -50);
		}
		
		private function pauseGame():void{
			_paused = true;
			addChild(_pauseLabel);
			_pauseLabel.x = 200 - _pauseLabel.width * .5; 
			_pauseLabel.y = 340 - _pauseLabel.height;
			_frameCount = 0;
		}
		
		private function resumeGame():void{
			removeChild(_pauseLabel); 
			_paused = false;
			_frameCount = 0;
		}
		
		override public function update(timeDelta:Number):void
		{
			super.update(timeDelta);
			_frameCount += 1; 
			if (ce.input.justDid("togglePause") && (_frameCount > 10) && _paused == false){
				pauseGame();
			}
			if (ce.input.justDid("togglePause") && (_frameCount > 10) && _paused == true){
				resumeGame();
			}
			if (_paused == true){
				return;
			}
			if (_gameStarted)
			{
				_pipe1.x -= 2;
				_pipe2.x -= 2;
				if (_pipe1.x <= -75)
				{
					randomizePipeY();
					_pipe1.x = 380;
					_pipe1.y = _pipeY;
				}
				if (_pipe2.x <= -75)
				{
					randomizePipeY();
					_pipe2.x = 380;
					_pipe2.y = _pipeY;
				}
				if (_pipe1.x == _bird.x || _pipe2.x == _bird.x) 
				{
					_score++;
					scoreText.text = String("Score" + _score);
					_assets.playSound("ding");
				}
				if (ce.input.justDid("fly"))
				{
					_velocity = -7;
					_assets.playSound("whoosh");
				}
				
				// character falls with gravity
				_velocity += _gravity;
				_bird.y += _velocity; 
				
				if (_bird.y <= 0) 
				{
					_bird.y = 0; 
				}
				if (_bird.y >= 620) 
				{
					_bird.y = 620; 
				}
				
				_bird._bounds.y = _bird.y + 2.5; 
				_bird._bounds.x = _bird.x + 2.5; 
				
				_pipeBoundsTop1.x = _pipe1.x + 5;
				_pipeBoundsTop1.y = _pipe1.y;
				_pipeBoundsBottom1.x = _pipe1.x + 5;
				_pipeBoundsBottom1.y = _pipe1.y + 495;
				
				_pipeBoundsTop2.x = _pipe2.x + 5;
				_pipeBoundsTop2.y = _pipe2.y;
				_pipeBoundsBottom2.x = _pipe2.x + 5;
				_pipeBoundsBottom2.y = _pipe2.y + 495;
				if (_bird._bounds.intersects(_pipeBoundsTop1) || _bird._bounds.intersects(_pipeBoundsBottom1)
				|| _bird._bounds.intersects(_pipeBoundsTop2) || _bird._bounds.intersects(_pipeBoundsBottom2))
				{
					_assets.playSound("smack");
					CitrusEngine.getInstance().state = new GameOverState();
				}
			}
		}
		
		override public function destroy():void{
			super.destroy(); 
		}
	}
}