package pixi.loaders;

@:native("PIXI.JsonLoader")
extern class JsonLoader {
	
	/**
	 * The json file loader is used to load in JSON data and parse it
	 * When loaded this class will dispatch a 'loaded' event
	 * If loading fails this class will dispatch an 'error' event
	 *
	 * @class JsonLoader
	 * @uses EventTarget
	 * @constructor
	 * @param url {String} The url of the JSON file
	 * @param crossorigin {Boolean} Whether requests should be treated as crossorigin
	 */
	function new (url,:String, ?crossorigin:Bool);
	
	/**
	 * The url of the bitmap font data
	 */
	var url:String;
	
	/**
	 * Whether the requests should be treated as cross origin
	 */
	var crossorigin:Bool;
	
	/**
	 * [read-only] The base url of the bitmap font data
	 */
	var baseUrl:String;
	
	/**
	 * [read-only] Whether the data has loaded yet
	 */
	var loaded:Bool;

	/**
	 * Loads the JSON data
	 *
	 * @method load
	 */
	function load():Void;
}