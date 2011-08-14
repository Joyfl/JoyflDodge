package managers
{
	import flash.display.Bitmap;

	public class AssetManager
	{
		[Embed( source="/../assets/zet.png" )]
		private static const _zetImage : Class;
		public static const zetImage : Bitmap = new _zetImage;
		
		[Embed( source="/../assets/bullet.png" )]
		private static const _bulletImage : Class;
		public static const bulletImage : Bitmap = new _bulletImage;
		
		public function AssetManager()
		{
			
		}
	}
}