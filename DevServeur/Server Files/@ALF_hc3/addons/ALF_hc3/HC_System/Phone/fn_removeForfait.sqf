/*
	File: fn_removeForfait.sqf
	Author: ALF Team
	Description:

*/
params[
	["_uid","",[""]],
	["_unit",objNull,[objNull]]
];
if(_uid isEqualTo "" OR {isNull _unit}) exitWith {};

[format["UPDATE phone SET offre='0' WHERE playerid='%1'",_uid],1] call HC_fnc_asyncCall;

uiSleep 0.25;

["CALL deleteOldForfait",1] call HC_fnc_asyncCall;

[] remoteExecCall ["ALF_fnc_menuForfait",_unit];
