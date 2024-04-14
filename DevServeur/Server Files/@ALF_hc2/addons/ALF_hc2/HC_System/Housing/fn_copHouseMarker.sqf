/*
	File: fn_copHouseMarker.sqf
	Author: ALF NiiRoZz
*/
params [
	["_h",objNull,[objNull]]
];
if (isNull _h) exitWith {};

private _uid = (_h getVariable "house_owner") select 0;
[_h,_uid] remoteExecCall ["ALF_fnc_copHouseMarker",playableUnits];