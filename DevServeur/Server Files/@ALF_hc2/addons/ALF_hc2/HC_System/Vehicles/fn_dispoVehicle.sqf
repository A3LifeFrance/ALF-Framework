/*
	File: fn_dispoVehicle.sqf
	Author: ALF Team
*/
params[
	["_classname","",[""]],
	["_unit",objNull,[objNull]]
];
if(_classname isEqualTo "" OR {isNull _unit}) exitWith {};

private _result = [format["SELECT dispo FROM shop WHERE classname='%1'",_classname],2] call HC_fnc_asyncCall;

_result params[
	["_dispo",0,[0]]
];

[_classname,_dispo] remoteExec ["life_fnc_dispoVehicle",_unit];
