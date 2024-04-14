/*
	File: fn_changerPlaque.sqf
	Author: ALF Team
*/
params [
	["_veh",objNull,[objNull]],
	["_pfinal",[],[[]]]
];
if (isNull _veh || {_pfinal isEqualTo []}) exitWith {};

private _var = _veh getVariable ["dbInfo",[]];
_var set[1,_pfinal];
_veh setVariable ["dbInfo",_var];