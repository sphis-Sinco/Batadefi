package music;

/**
 * Song JSON
 */
typedef Song =
{
	var name:String;
	var bpm:Float;
	var attacks:Array<AttackData>;
}

typedef AttackData =
{
	var beat:Int;
	var step:Int;

	var event:String;
	var succeed_event:String;
	var fail_event:String;
}
