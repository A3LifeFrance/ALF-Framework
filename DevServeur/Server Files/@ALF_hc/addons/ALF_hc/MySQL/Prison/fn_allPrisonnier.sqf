#include "\ALF_hc\hc_macros.hpp"
/*
	File: fn_allPrisonnier.sqf
	Author: ALF Team
*/
_queryResult = ["SELECT name, jailtime, jailcoffre FROM players WHERE jail='1' AND jailtime > 0",2,true] call HC_fnc_asyncCall;

if (_queryResult isEqualType "") exitWith {[[]] remoteExecCall ["ALF_fnc_menuAllPrisonnier",remoteExecutedOwner]};

[1,_queryResult] remoteExecCall ["ALF_fnc_menuAllPrisonnier",remoteExecutedOwner];