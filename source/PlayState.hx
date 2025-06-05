package;

import sinlib.utilities.FileManager;


class PlayState extends MusicState
{
	public var SONG_JSON:Song;

	override public function new(?songname:String = 'test')
	{
		super();

		SONG_JSON = FileManager.getJSON(FileManager.getDataFile('fights/${songname}.json'));
	}

	override public function create():Void
	{
		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
	override function beatHit()
	{
		super.beatHit();

		if (this.curBeat == this.SONG_JSON.end_beat)
		{
			trace('End of song');
			FlxG.resetState();
		}
	}
}
