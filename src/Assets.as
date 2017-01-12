package 
{
	import flash.display.Bitmap;
	import starling.textures.Texture;
	public class Assets
	{
		
		// Embed the Atlas XML
		[Embed(source="assets/sprites.xml",mimeType="application/octet-stream")]
		public static const spritesXml:Class;
		
        // Embed the Atlas Texture:
		[Embed(source="assets/sprites.png")]
		public static const sprites:Class;
		
		// sounds
		[Embed(source="assets/whoosh.mp3")]
		public static const whoosh:Class;
		
		[Embed(source="assets/ding.mp3")]
		public static const ding:Class;
		
		[Embed(source="assets/smack.mp3")]
		public static const smack:Class;
		
		// font
		[Embed(source = "assets/fonts/ChunkFive.otf", embedAsCFF = "false", fontFamily = "ChunkFive")]
		public static const ChunkFive:Class; 
		
		// new stuff
		[Embed(source = "assets/images/botWall.png")]
		public static const BotWall:Class;
		[Embed(source = "assets/images/topWall.png")]
		public static const TopWall:Class;
		[Embed(source = "assets/images/titlescreen.png")]
		public static const FBBackground:Class; 
		[Embed(source = "assets/images/PlayButton.png")]
		private static const PlayButton:Class;
		[Embed(source = "assets/images/InstructionsButton.png")]
		private static const InstructionsButton:Class;
		[Embed(source = "assets/images/PlayButtonHover.png")]
		private static const PlayButtonHover:Class;
		[Embed(source = "assets/images/InstructionsButtonHover.png")]
		private static const InstructionsButtonHover:Class;
		[Embed(source = "assets/images/BackButton.png")]
		private static const BackButton:Class;
		[Embed(source = "assets/images/fpsprite.png")]
		public static const Bird:Class; 
		
		public static function getImage(n:String):Bitmap{
			var imgClass:Class = Bird; 
			if (n == "botwall"){
				imgClass = BotWall;
			} else if (n == "topwall"){
				imgClass = TopWall; 
			} else if ( n == "fbBackground"){
				imgClass = FBBackground; 
			} else if (n == "bird"){
				imgClass = Bird;
			} else if (n == "play"){
				imgClass = PlayButton;
			} else if (n == "instructions"){
				imgClass = InstructionsButton; 
			} else if (n == "playhover"){
				imgClass = PlayButtonHover; 
			} else if (n == "instructionshover"){
				imgClass = InstructionsButtonHover
			} else if (n == "back"){
				imgClass = BackButton;
			}
			return new imgClass() as Bitmap;
			
		}
	}
}