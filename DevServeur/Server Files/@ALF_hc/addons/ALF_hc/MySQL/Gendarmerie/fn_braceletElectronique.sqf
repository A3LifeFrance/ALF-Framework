/*
	File: fn_braceletElectronique.sqf
	Author : NiiRoZz
*/
params [
	["_temps",-5,[0]],
	["_unit",objNull,[objNull]]
];

if (isNull _unit || _temps isEqualTo -5) exitWith {};

[format["UPDATE players SET bracelet='1', bracelettime='%2' WHERE playerid='%1'",(getPlayerUID _unit),_temps],1] call HC_fnc_asyncCall;

_array = missionNamespace getVariable ["ALF_AllBracelets",[]];
_array pushBack _unit;
missionNamespace setVariable ["ALF_AllBracelets",_array,true];
[[_temps * 60],"\ALF_Client\core\fsm\bracelet.fsm"] remoteExecCall ["execFSM",_unit];