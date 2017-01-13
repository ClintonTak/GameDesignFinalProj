package gameObjects{
	import citrus.objects.NapePhysicsObject;
	import nape.geom.Vec2;

	import flash.display.Bitmap;
	import flash.geom.Rectangle;
	import Assets;
	import starling.textures.Texture;
	import starling.display.Image;
	
	import flash.geom.Rectangle;
	
	public class Bird extends NapePhysicsObject{
		public var _bounds:Rectangle;
		
		public function Bird(name:String, params:Object=null){
			super(name, params);
			view = new Image(Texture.fromBitmap(Assets.getImage("topWall")));
		}
		
		public function setBounds(bounds:Rectangle):void{
			_bounds = bounds; 
		}
		
		override public function destroy():void{
			super.destroy(); 
		}
		
		public function fly():void{
			var vector:Vec2 = new Vec2(0, -75);
			_body.velocity.set(vector);
		}
		
		override public function update(timeDelta:Number):void{
			super.update(timeDelta);
		}
	}
}