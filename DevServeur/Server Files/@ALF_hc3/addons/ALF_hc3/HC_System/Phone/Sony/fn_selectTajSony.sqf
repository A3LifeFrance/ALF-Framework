/*
	File: fn_selectTajSony.sqf
	Author: ALF Nanou

	This file is for Nanou's HeadlessClient.
*/
private["_fipname","_unit","_query","_queryResult"];
_fipname = _this select 0;
_unit = _this select 1;

_fipname = toArray _fipname;
_query = format["SELECT type, lieu, date, infra FROM taj WHERE name='%1' AND active='1'",_fipname];
_queryResult = [_query,2,true] call HC_fnc_asyncCall;

if(count _queryResult isEqualTo 0) then {
	_queryResult = [];
} else {
	_queryResult = _queryResult;
	{
		_x set[1,toString(_x select 1)];
		_x set[2,toString(_x select 2)];
		_x set[3,toString(_x select 3)];
	} forEach _queryResult;
};

[_queryResult] remoteExec ["ALF_fnc_updateTajSony",_unit];
