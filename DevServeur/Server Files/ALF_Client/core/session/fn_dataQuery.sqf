/*
	File: fn_dataQuery.sqf
	Author: ALF TEAM
*/
if(life_session_completed) exitWith {};

[getPlayerUID player,player] remoteExec ["HC_fnc_queryRequest",HC_Life];
