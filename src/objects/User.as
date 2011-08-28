package objects
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.system.LoaderContext;
	import flash.system.Security;

	public class User extends EventDispatcher
	{
		public var id : String;
		[Bindable] public var name : String;
		[Bindable] public var score : int;
		public var date : String;
		[Bindable] public var picture : BitmapData;
		
		[Bindable] public var selected : Boolean;
		
		private var _callback : Function;
		
		public function User()
		{
		}
		
		public function loadPicture( url : String, callback : Function ) : void
		{
			_callback = callback;
			
			var profileLoader : Loader = new Loader;
			profileLoader.load( new URLRequest( url ), new LoaderContext( true ) );
			profileLoader.contentLoaderInfo.addEventListener( Event.COMPLETE, onProfileLoadComplete );
		}
		
		private function onProfileLoadComplete( e : Event ) : void
		{
			e.target.removeEventListener( Event.COMPLETE, onProfileLoadComplete );
			
			picture = e.target.content.bitmapData;
			
			var scoreLoader : URLLoader = new URLLoader;
			scoreLoader.addEventListener( Event.COMPLETE, onScoreLoadComplete );
			scoreLoader.load( new URLRequest( JoyflDodge.USER_REQ_URL + "?type=get&id=" + id ) );
		}
		
		private function onScoreLoadComplete( e : Event ) : void
		{
			e.target.removeEventListener( Event.COMPLETE, onScoreLoadComplete );
			
			score = e.target.data != "FAIL" ? e.target.data.split( ":" )[1] : 0;
			_callback( this );
		}
	}
}