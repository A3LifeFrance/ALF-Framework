/*
	File: fn_selectFipSony.sqf
	Author: ALF Nanou

	This file is for Nanou's HeadlessClient.
*/
private["_fipname","_unit","_query","_queryResult"];
_fipname = _this select 0;
_unit = _this select 1;

_fipname = toArray _fipname;
_query = format["SELECT motif FROM fpr WHERE name='%1' AND active='1'",_fipname];
_queryResult = [_query,2] call HC_fnc_asyncCall;

if(count _queryResult isEqualTo 0) then {
	_queryResult = "";
} else {
	_queryResult = toString(_queryResult select 0);
};

[_queryResult] remoteExec ["ALF_fnc_update1FipSony",_unit];
