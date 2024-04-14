/*
	File: fn_copEnter.sqf
*/
private ["_position","_veh"];
_position = _this select 3;

switch (_position) do
{
	case "driver":
	{
		cursorObject lock false;
		player action ["getInDriver", cursorObject];
		cursorObject lock true;
	};
	case "passenger":
	{
		cursorObject lock false;
		player action ["getInCargo", cursorObject];
		cursorObject lock true;
	};
	case "exit":
	{
		_veh = vehicle player;
		_veh lock false;
		player action ["getOut", _veh];
		_veh lock true;
	};
};