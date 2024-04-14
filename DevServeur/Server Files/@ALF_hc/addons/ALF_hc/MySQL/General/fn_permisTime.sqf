/*
	Author: ALF Team
*/
_uid = _this select 0;
if(isNil "_uid") exitWith {};
[format["UPDATE players SET permis_time='2' WHERE playerid='%1'",_uid],1] call HC_fnc_asyncCall;
