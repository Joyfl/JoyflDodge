package objects
{
	import kr.joyfl.joyflic.animators.CellAnimator;
	import kr.joyfl.joyflic.objects.GameObject;
	
	import managers.AssetManager;

	public class Zet extends GameObject
	{
		public var speed : Number = 3;
		
		public function Zet()
		{
			animator = new CellAnimator( AssetManager.zetImage.bitmapData, 1, 1, 0, false );
		}
	}
}