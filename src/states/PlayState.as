package states {
	import citrus.core.starling.StarlingState;
	import citrus.objects.CitrusSprite;
	import citrus.physics.nape.Nape;
	import gameObjects.Bird;
	import nape.geom.Vec2;
	import starling.display.Image;
	import citrus.core.CitrusEngine;
	import starling.text.TextField;
	import citrus.input.controllers.Keyboard;
	import starling.display.Sprite;
	import starling.utils.AssetManager;
	import Assets;
	import utils.Config;
	import states.GameOverState;
	import flash.geom.Rectangle;
	import utils.SoundManager;
	import gameObjects.Wall;
	
	public class PlayState extends StarlingState{
		private var ce:CitrusEngine;
		private var _kb:Keyboard;

		//sets up walls
		private var _wall1top:Wall;
		private var _wall1bot:Wall;
		private var _wall2top:Wall;
		private var _wall2bot:Wall;
		private var _wallYLoc:Number;
	
		//for bird
		private var _bird:Bird
		private var _birdBounds:Rectangle;
		
		//game stuff
		private var _gameStarted:Boolean;
		private var _scoreCounter:TextField;
		public static var _score:Number = 0;
		
		//used to pause the game 
		private var _paused:Boolean = false; 
		private var _frameCount:Number = 0;
		private var _pauseLabel:TextField = new TextField(300, 300, "The game is paused. \n Press Escape to resume the game.", "ChunkFive", 40, Config.BLUE);
			
		//game sounds
		private var _pointSFX:utils.SoundManager = new utils.SoundManager("./sounds/scorePoint.mp3");
		private var _flapSFX:utils.SoundManager = new utils.SoundManager("./sounds/flapsound.mp3"); 
		private var _backgroundSFX:utils.SoundManager = new utils.SoundManager("./sounds/backgroundmusic.mp3");
		public function PlayState(){
			super();
		}
		
		override public function initialize():void{
			super.initialize();
			ce = CitrusEngine.getInstance();
			var physics:Nape = new Nape("napePhysics");
			physics.gravity = new Vec2(0, 100);
			add(physics);
			 
			//setup background
			var background:CitrusSprite = new CitrusSprite("backGround", {x: 0, y: 0, width: 400, height: 680});
			background.view = Assets.getImage("fbBackground");
			add(background);
			
			_kb = ce.input.keyboard;
			_kb.addKeyAction("fly", Keyboard.SPACE);
			_kb.addKeyAction("togglePause", Keyboard.ESCAPE);
			_backgroundSFX.playSound();
			startGame();
		}
		
		public function startGame():void{
			//sets up first wall
			randomizeYLoc();
			_wall1bot = new Wall(false, "wall1Bot", {parallaxX:.75, parallaxY:.75, x: 380, y: 600, width: Config.WALLWIDTH, height: Config.BOTTOMWALLHEIGHT}); 
			_wall1top = new Wall(true, "wall1Top", {parallaxX:.75, parallaxY:.75, x: 380, y: -50, width: Config.WALLWIDTH, height: Config.TOPWALLHEIGHT});
			add(_wall1bot);
			add(_wall1top);
			
			//sets up second wall
			randomizeYLoc();
			_wall2bot = new Wall(false, "wall2Bot", {parallaxX:.75, parallaxY:.75, x: 620, y: 800, width: Config.WALLWIDTH, height: Config.BOTTOMWALLHEIGHT});
			_wall2top = new Wall(true, "wall2top", {parallaxX:.75, parallaxY:.75, x: 620, y: 150, width: Config.WALLWIDTH, height: Config.TOPWALLHEIGHT });
			add(_wall2bot); 
			add(_wall2top); 
			
			//sets up bird
			_bird = new Bird("bird", {x:100, y:200, width:Config.BIRDWIDTH, height:Config.BIRDHEIGHT});
			add(_bird);
			_bird.setBounds(_birdBounds); 
			
			//score setup
			_scoreCounter = new TextField(300, 50, "Score: 0", "ChunkFive", 20, Config.BLUE);
			_scoreCounter.x = 180;
			_scoreCounter.y = 0;
			addChild(_scoreCounter);
			_score = 0;
			_gameStarted = true;
			}
		
		private function randomizeYLoc():void{
			_wallYLoc = new Number(Math.floor(Math.random() *(900-550+1))+ 500);
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
		
		override public function update(timeDelta:Number):void{
			super.update(timeDelta);
			_frameCount += 1; 
			
			//pauses game
			if (ce.input.justDid("togglePause") && (_frameCount > 10) && _paused == false){
				pauseGame();
			}
			//resumes game
			if (ce.input.justDid("togglePause") && (_frameCount > 10) && _paused == true){
				resumeGame();
			}
			if (_paused == true){
				return;
			}
			if (_gameStarted){	
				_wall1bot.stabilize();
				_wall1top.stabilize();
				_wall2top.stabilize();
				_wall2bot.stabilize();
				//keeps bird in the game
				if (_bird.y <= 0) {
					_bird.y = 0; 
				}
				if (_bird.y >= 620) {
					_bird.y = 620; 
				}
				//moves wall1 if the wall falls off the map
				if (_wall1bot.x <= -130 ){
					randomizeYLoc(); 
					_wall1bot.updateYLoc(380, _wallYLoc);
					_wall1top.updateYLoc(380, _wallYLoc - 650);
				}
				//moves wall2 if the wall falls off the map
				if (_wall2bot.x <= -130 ){
					randomizeYLoc(); 
					_wall2bot.updateYLoc(380, _wallYLoc);
					_wall2top.updateYLoc(380, _wallYLoc - 650);
				}
				//counts score
				if ((_wall1bot.x - _bird.x < 2 && (_wall1bot.x - _bird.x > 0)) || (_wall2bot.x - _bird.x < 2 && (_wall2bot.x - _bird.x > 0))){//comparing directly wasn't accurate enough, had to provide a range
					_score++;
					_scoreCounter.text = String("Score: " + _score);
					_pointSFX.playSound();
				}
				//makes the bird fly
				if (ce.input.justDid("fly")){
					_bird.fly();
					_flapSFX.playSound();
				}
				if (_bird.x < 0){
					_backgroundSFX.stopSound();
					CitrusEngine.getInstance().state = new GameOverState();	
				}
			}
		}
		
		override public function destroy():void{
			super.destroy(); 
		}
	}
}