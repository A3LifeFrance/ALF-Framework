/*
	File: fn_savePlayerDisconnect.sqf
*/
params[
	["_pid","",[""]],
	["_pos",[],[[]]],
	["_gear",[],[[]]]
];
if(_pid isEqualTo "" OR {_pos isEqualTo []} OR {_gear isEqualTo []}) exitWith {};

_pos = [_pos] call HC_fnc_mresArray;
_gear = [_gear] call HC_fnc_mresArray;

[format["UPDATE players SET position='%1', gear='%2' WHERE playerid='%3'",_pos,_gear,_pid],1] call HC_fnc_asyncCall;
