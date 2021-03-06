package states{
	import states.MainMenuState;
	import citrus.core.CitrusEngine; 
	import citrus.core.starling.StarlingState;
	import starling.textures.Texture;
	import starling.display.Button;
	import starling.events.Event;
	import starling.text.TextField;
	import Assets;
	import citrus.objects.CitrusSprite;
	import utils.Config;
	
	public class InstructionState extends StarlingState{
		private var _background:CitrusSprite;
		private var _instructions:TextField;
		private var _backButton:Button
		public function InstructionState() {
			super(); 
		}
		
		override public function initialize():void{
			super.initialize(); 
			
			_background = new CitrusSprite("backGround", {x: 0, y: 0, width: Config.WORLDWIDTH, height: Config.WORLDHEIGHT});
			_background.view = Assets.getImage("fbBackground");
			add(_background);
			
			_instructions = new TextField(300, 300, "The object of this game is to stay in the game for as long as possible. \n Dodge the pipes, and collect points. \n Press space to make your bird fly up and let gravity do the rest. ", "ChunkFive", 20, 0x123456);
			_instructions.x = Config.CENTERX - _instructions.width*.5;
			_instructions.y = Config.CENTERY - 350;
			addChild(_instructions);
			
			var backBtnTexture:Texture = Texture.fromBitmap(Assets.getImage("back"));  
			_backButton = new Button(backBtnTexture, "");
			_backButton.x = Config.CENTERX - _backButton.width * .5; 
			_backButton.y = _instructions.y + _backButton.height; 
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
			removeChild(_instructions);
			removeChild(_backButton);
		}
	}
}