/*
	File: fn_enleverPoints.sqf
	Author: ALF Team
*/

private["_val","_u"];
_u = _this select 0;
_val = ctrlText 2752;

if(isNull _u) exitWith {};
if(!([_val] call TON_fnc_isnumber)) exitWith {};
if((parseNumber _val) > 12) exitWith {};

[player,parseNumber _val] remoteExec ["ALF_fnc_nextPoints",_u];
closeDialog 0;