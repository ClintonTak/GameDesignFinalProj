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
		
		public function InstructionState() 
		{
			super(); 
		}
		
		override public function initialize():void{
			super.initialize(); 
			
			var bg:CitrusSprite = new CitrusSprite("bg", {x: 0, y: 0, width: 400, height: 680});
			bg.view = Assets.getImage("fbBackground");
			add(bg);
			
			var instructions:TextField;
			instructions = new TextField(300, 300, "The object of this game is to get as far as possible. \n\n Press space to make your bird fly up and let gravity do the rest. ", "ChunkFive", 20, 0x123456);
			instructions.x = 200 - instructions.width*.5;
			instructions.y = 340 - 350;
			trace("landed");
			addChild(instructions);
			
			var backBtnTexture:Texture = Texture.fromBitmap(Assets.getImage("back"));  
			var backButton:Button = new Button(backBtnTexture, "");
			backButton.x = 200 - backButton.width * .5; 
			backButton.y = instructions.y + backButton.height; 
			backButton.addEventListener(Event.TRIGGERED, onClickBack); 
			addChild(backButton); 
		}
		
		public function onClickBack(e:Event):void{
			CitrusEngine.getInstance().state = new MainMenuState();
		}
	}

}