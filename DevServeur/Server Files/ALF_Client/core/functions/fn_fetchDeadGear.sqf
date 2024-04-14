#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_fetchDeadGear.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Fetches gear off of a body.
*/
params [
	["_unit",objNull,[objNull]]
];
if(isNull _unit) exitWith {};

getUnitLoadout _unit