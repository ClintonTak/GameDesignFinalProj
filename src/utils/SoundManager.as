package utils{
	import flash.events.Event;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	import flash.net.URLRequest;

	public class SoundManager {
		private var _sound:Sound;
		private var _channel:SoundChannel; 
		
		public function SoundManager(url:String){
			super();
			trace(url);
			_sound = new Sound(new URLRequest(url));
		}
		
		public function playSound ():void{
			_channel =  _sound.play(); 
			var transform:SoundTransform = new SoundTransform(1, 0); 
			_channel.soundTransform = transform; 
		}
		
		public function stopSound():void{
			_channel.stop();
		}
		
		public function update():void{
		}

		public function destroy():void{
			_sound = null; 
			_channel = null; 
		}
	}
}