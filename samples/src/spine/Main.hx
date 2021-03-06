package spine;

import pixi.loaders.Loader;
import pixi.plugins.spine.Spine;
import pixi.core.Application;

class Main extends Application {

	var _loader:Loader;
	var _spine:Spine;

	public function new() {
		var options:ApplicationOptions = {
			backgroundColor: 0x00FF66
		};
		super(options);
		super.start();

		stage.interactive = true;
		var assetsToLoader:Array<String> = [];

		_loader = new Loader();
		_loader.add("spineboy", "assets/spine/data/spineboy.json");
		_loader.load(onAssetsLoaded);
	}

	function onAssetsLoaded() {
		_spine = new Spine(Reflect.field(_loader.resources, "spineboy").spineData);

		_spine.position.set(renderer.width / 2, renderer.height);

		_spine.scale.set(1.5);

		_spine.stateData.setMix("walk", "jump", 0.2);
		_spine.stateData.setMix("jump", "walk", 0.4);

		_spine.state.setAnimation(0, "walk", true);

		stage.addChild(_spine);

		stage.on("click", _stageOnClick);
		stage.on("tap", _stageOnClick);
	}

	function _stageOnClick() {
		_spine.state.setAnimation(0, "jump", false);
		_spine.state.addAnimation(0, "walk", true, 0);
	}

	static function main() {
		new Main();
	}
}