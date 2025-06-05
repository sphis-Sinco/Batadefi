package;

import sinlib.utilities.FileManager;


class PlayState extends MusicState
{
	public var FIGHT_JSON:Fight;

	public var FIGHT_STARTED:Bool = false;
	public var FIGHT_ENDED:Bool = false;

	override public function new(?songname:String = 'test')
	{
		super();

		FIGHT_JSON = FileManager.getJSON(FileManager.getDataFile('fights/${songname}.json'));

		Conductor.mapBPMChanges(FIGHT_JSON);
		Conductor.changeBPM(FIGHT_JSON.bpm);

		Conductor.songPosition = 0;
	}

	override public function create():Void
	{
		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if (!FIGHT_ENDED)
			Conductor.songPosition += elapsed * 1000;

		if (Conductor.songPosition > 0 && !FIGHT_STARTED)
		{
			FIGHT_STARTED = true;
		}
	}
	override function beatHit()
	{
		super.beatHit();

		if (this.curBeat == this.FIGHT_JSON.end_beat)
		{
			trace('End of song');
			FlxG.resetState();
		}
	}
}
