/*
	File: fn_playSonnetteHouse.sqf
	Author: ALF Team
*/
params [
	["_h",objNull,[objNull]]
];
if(isNull _h) exitWith {};

private _var = _h getVariable ["house_owner",[]];
if (_var isEqualTo []) exitWith {};
private _hid = _var select 0;
_target = playableUnits select {(getPlayerUID _x) isEqualTo _hid};
if !(_target isEqualTo []) then {
	[life_pInact_curTarget] remoteExecCall ["life_fnc_sonnetteHouse",(_target select 0)];
};
