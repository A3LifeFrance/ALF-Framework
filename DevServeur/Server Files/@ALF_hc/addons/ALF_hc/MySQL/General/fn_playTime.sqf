/*
	File: fn_playeTime.sqf
*/
private["_uid","_playTime","_query"];
_uid = _this select 0;
_playTime = _this select 1;
if(isNil "_uid" OR {isNil "_playTime"}) exitWith {};

_query = format["UPDATE players SET playtime='%2' WHERE playerid='%1'",_uid,_playTime];
[_query,1] call HC_fnc_asyncCall;
