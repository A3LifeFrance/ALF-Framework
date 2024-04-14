/*
	File: fn_enleverBracelet.sqf
	Author : NiiRoZz
*/
params [
	["_unit",objNull,[objNull]]
];

if (isNull _unit) exitWith {};

[format["UPDATE players SET bracelet='0', bracelettime='0' WHERE playerid='%1'",(getPlayerUID _unit)],1] call HC_fnc_asyncCall;