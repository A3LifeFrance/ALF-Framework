#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_pulloutAction.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Pulls civilians out of a car if it's stopped.
*/
private["_veh","_crew"];
_veh = _this select 0;
if(isNil "_veh" OR {isNull _veh}) exitWith {};
if(player distance _veh > 8) exitWith {};
_crew = crew _veh;

{
	if !(isNull _x) then {
		[_x] remoteExecCall ["life_fnc_pulloutVeh",_x];
	};
} forEach _crew;
