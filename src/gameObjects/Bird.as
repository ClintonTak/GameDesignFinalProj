package gameObjects{
	import citrus.objects.CitrusSprite;
	import cmodule.AwayPhysics.CVoidTypemap;
	import flash.display.Bitmap;
	import flash.geom.Rectangle;
	import Assets;
	import starling.textures.Texture;
	import starling.display.Image;
	
	public class Bird extends CitrusSprite {
		
		public var _bounds:Rectangle;
		
		public function Bird(name:String, params:Object=null){
			super(name, params);
			view = new Image(Texture.fromBitmap(Assets.getImage("bird")));
		}
		
		public function setBounds(bounds:Rectangle):void{
			_bounds = bounds; 
		}
		
		override public function destroy():void{
			super.destroy(); 
		}
		
		override public function update(timeDelta:Number):void{
			super.update(timeDelta);
		}
	}

}