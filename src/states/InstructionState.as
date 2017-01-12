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
	public class InstructionState extends StarlingState
	{
		private var _background:CitrusSprite;
		private var _instructions:TextField;
		private var _backButton:Button
		public function InstructionState() 
		{
			super(); 
		}
		
		override public function initialize():void{
			super.initialize(); 
			
			_background = new CitrusSprite("backGround", {x: 0, y: 0, width: 400, height: 680});
			_background.view = Assets.getImage("fbBackground");
			add(_background);
			
			
			_instructions = new TextField(300, 300, "The object of this game is to get as far as possible. \n\n Press space to make your bird fly up and let gravity do the rest. ", "ChunkFive", 20, 0x123456);
			_instructions.x = 200 - _instructions.width*.5;
			_instructions.y = 340 - 350;
			addChild(_instructions);
			
			var backBtnTexture:Texture = Texture.fromBitmap(Assets.getImage("back"));  
			_backButton = new Button(backBtnTexture, "");
			_backButton.x = 200 - _backButton.width * .5; 
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