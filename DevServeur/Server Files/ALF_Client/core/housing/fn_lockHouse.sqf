#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_lockHouse.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Unlocks / locks the house.
*/
private _house = param [0,objNull,[objNull]];
if(isNull _house OR !(_house isKindOf "House_F")) exitWith {};

private _mode = _this select 1;
if(isNil "_mode") exitWith {};

