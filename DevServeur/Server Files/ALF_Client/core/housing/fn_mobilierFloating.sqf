#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_mobilierFloating.sqf
	Author: ALF - NiiRoZz
*/
params [
	["_mobilier",objNull,[objNull]]
];

if (isNull _mobilier) exitWith {};

private _pos = AGLtoASL (_mobilier modelToWorld [0,0,0]);

_ins = lineIntersectsSurfaces [
	_pos,
	(_pos vectorAdd [0,0,-50]),
	_mobilier,
	player,
	true,
	1,
	"GEOM",
	"NONE"
];
if (count _ins == 0) exitWith {10000000};
(_ins select 0 select 0) distance _pos