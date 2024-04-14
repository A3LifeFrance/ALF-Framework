/*
	File: fn_stabilize.sqf
	Author: ALF Team
*/

_target = param [0,objNull,[objNull]];

if (isNull _target) exitWith {};
if (life_action_inUse) exitWith {};	
		
while {(!life_interrupted && (_target getVariable ["ReviveMedic", false]) && !([player] call ALF_fnc_checkMenotter) && !([player] call ALF_fnc_checkSurrender) && (player distance _target < 3))} do {
	player playAction "medicStart";

	uiSleep 6;

	player playAction "medicStop";

	if (life_interrupted) exitWith {};

	if (random(100) <= 1) exitWith {
		[player] remoteExec ["life_fnc_revived", _target];
	};
};

life_action_inUse = false;