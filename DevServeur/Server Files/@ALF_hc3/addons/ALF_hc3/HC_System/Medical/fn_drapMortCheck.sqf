/*
	File : fn_drapMort.sqf
	Author: ALF Dev Team
*/
params [
	["_player",objNull,[objNull]],
	["_obj",objNull,[objNull]]
];

if (isNull _player) exitWith {};
if (isNull _obj) exitWith {};

waitUntil{(isNull _player) || (isNull _obj)};

if (!(isNull _obj)) exitWith {
	deleteVehicle _obj;
};