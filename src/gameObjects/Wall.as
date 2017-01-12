package gameObjects{
	import citrus.objects.CitrusSprite;
	import dragonBones.objects.RectangleData;
	
	import flash.geom.Rectangle;
	import Assets;
	import starling.textures.Texture;
	import starling.display.Image;
	
	public class Wall extends CitrusSprite{
		public var _topBounds:Rectangle;
		public var _botBounds:Rectangle; 
		public function Wall(top:Boolean, name:String, params:Object=null) 
		{
			super(name, params);
			if (top == true){
				trace("top");
				view = new Image(Texture.fromBitmap(Assets.getImage("topwall")));
			}else{
				view = new Image(Texture.fromBitmap(Assets.getImage("botwall")));
				trace("bot");
			}
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
	}

}