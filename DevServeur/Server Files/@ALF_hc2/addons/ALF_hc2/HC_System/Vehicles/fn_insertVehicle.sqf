/*
	File: fn_insertVehicle.sqf
	Author: Bryan "Tonic" Boardwine

	This file is for Nanou's HeadlessClient.

	Description:
	Inserts the vehicle into the database
*/
private["_query","_sql"];
_uid = _this select 0;
_type = _this select 1;
_className = _this select 2;
_plate = _this select 3;
_peinture = _this select 4;

//Stop bad data being passed.
if(_uid isEqualTo "" OR {_type isEqualTo ""} OR {_className isEqualTo ""}) exitWith {};
_plate = [_plate] call HC_fnc_mresArray;

_query = format["INSERT INTO vehicles (classname, type, pid, alive, active, plate, gear, position, damage, peinture) VALUES ('%1', '%2', '%3', '1', '1', '%4','""[]""','""[]""','""[]""', '%5')",_className,_type,_uid,_plate,_peinture];

[_query,1] call HC_fnc_asyncCall;

