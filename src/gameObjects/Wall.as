package gameObjects{
	import citrus.objects.NapePhysicsObject;
	import nape.geom.Vec2;
	
	import flash.geom.Rectangle;
	import Assets;
	import starling.textures.Texture;
	import starling.display.Image;
	
	
	public class Wall extends NapePhysicsObject{
		public var _topBounds:Rectangle;
		public var _botBounds:Rectangle; 
		
		public function Wall(top:Boolean, name:String, params:Object=null) {
			super(name, params);
			
			if (top == true){
				view = new Image(Texture.fromBitmap(Assets.getImage("topwall")));
			}else{
				view = new Image(Texture.fromBitmap(Assets.getImage("botwall")));
			}
		}
		
		public function stabilize():void{
			var vector:Vec2 = new Vec2( -30, -5);
			_body.velocity.set(vector);
		}
		
		public function setTopBounds(bounds:Rectangle):void{
			_topBounds = bounds; 
		}
		
		public function setBotBounds(bounds:Rectangle):void{
			_botBounds = bounds; 
		}
		
		override public function destroy():void{
			super.destroy(); 
		}
		
		override public function update(timeDelta:Number):void{
			super.update(timeDelta);
		}
		
		public function updateYLoc(xLoc:Number, yLoc:Number):void{
			var vector:Vec2 = new Vec2(xLoc, yLoc);
			_body.position.set(vector);
		}
	}
}