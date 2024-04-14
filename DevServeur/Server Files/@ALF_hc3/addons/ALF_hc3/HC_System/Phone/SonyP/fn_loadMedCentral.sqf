/*
	File: fn_loadMedCentral.sqf
	Author: ALF Team
*/
params [
	["_med",objNull,[objNull]]
];
if(isNull _med) exitWith {};

// Data des appels en attentes du central Pompier.
private _data1 = [];
{
	if(count(_x getVariable ["central_18_data",[]]) > 0 && {_x getVariable ["call_info",0] isEqualTo 1}) then {
		_data1 pushBack [_x getVariable ["central_18_data",[]],_x getVariable ["central_time",0]];
	};
} forEach playableUnits;

// Data des appels en charge du central Pompier.
private _data2 = [];
{
	if(count(_x getVariable ["central_18_data",[]]) > 0 && {_x getVariable ["call_info",0] isEqualTo 2}) then {
		private _callID = (_x getVariable ["central_18_data",[]]) select 0;
		private _count = {_x getVariable ["central_id",0] isEqualTo _callID} count playableUnits;
		_data2 pushBack [_x getVariable ["central_18_data",[]],_count];
	};
} forEach playableUnits;

[_data1,_data2] remoteExecCall ["ALF_fnc_SonyPLoadCentral",_med];
