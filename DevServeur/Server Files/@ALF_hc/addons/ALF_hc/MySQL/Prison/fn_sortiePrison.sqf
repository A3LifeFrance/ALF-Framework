/*
	File: fn_sortiePrison.sqf
	Author : NiiRoZz
*/
params [
	["_unit",objNull,[objNull]]
];

if (isNull _unit) exitWith {};

[format["UPDATE players SET jail='0', jailtime='0', jailcoffre='0' WHERE playerid='%1'",(getPlayerUID _unit)],1] call HC_fnc_asyncCall;
