/*
	File: fn_transfertLit.sqf
	Author: ALF Team
*/
params [
	["_player",objNull,[objNull]]
];

if (isNull _player) exitWith {};

private _lit = nearestObject [_player, "Land_ALF_H_bed"];

if (isNull _lit) exitWith {};

player setPosATL (_lit modelToWorld (_lit selectionPosition "pos_cargo"));
player setDir ((getDir _lit) - 180);
[player, "passenger_injured_medevac_truck01"] remoteExecCall ["ALF_fnc_switchMove",0];