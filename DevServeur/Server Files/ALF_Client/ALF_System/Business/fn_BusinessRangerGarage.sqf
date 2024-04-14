/*
	File: fn_businessRangerGarage.sqf
*/
private _building = _this select 0;
private _var = _building getVariable ["business",[]];
if(count _var isEqualTo 0) exitWith {};
if !((vehicle player) isEqualTo player) exitWith {["INFO","Il faut descendre du véhicule.","warning"] spawn ALF_fnc_doMsg;};
private _owner = _var select 0;
private _membres = _var select 5;
private _uid = getPlayerUID player;
private _exit = false;
{
	private _memberuid = _x select 1;
	if(_memberuid isEqualTo _uid) exitWith {_exit = true;};
} forEach _membres;
if !(_exit) exitWith {};

[_owner] call ALF_fnc_BusinessStoreVehicle;
