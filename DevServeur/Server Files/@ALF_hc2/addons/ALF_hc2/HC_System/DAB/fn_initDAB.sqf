/*
	File: fn_initDAB.sqf
	Author: ALF Dev Team
*/
private["_atms","_atm"];

_atms = [];

{
	_atms pushBack _x;
} forEach (nearestObjects [[7575.64, 7425.88,0], ["Land_ALF_ATM"], 20000]);

ALF_ATMS = _atms;

if(count _atms isEqualTo 0) exitWith {};
{
	if !(isNull _x) then {
		if ((floor random 10) < 2) then {
			_x setVariable ["dispo",10000];
		} else {
			_x setVariable ["dispo",100000];
		};
	};
} forEach _atms;
