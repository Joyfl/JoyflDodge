package objects
{
	import flash.display.BitmapData;
	
	import kr.joyfl.joyflic.animators.CellAnimator;
	import kr.joyfl.joyflic.objects.GameObject;
	
	import managers.AssetManager;
	
	public class Bullet extends GameObject
	{
		public var speed : Number;
		public var shooted : Boolean;
		
		public function Bullet()
		{
			animator = new CellAnimator( AssetManager.bulletImage.bitmapData, 1, 1, 0, false ); 
		}
	}
}