/*
	File: fn_loadFipSony.sqf
	Author: ALF Team
*/
private["_unit","_query","_queryResult"];
_unit = _this select 0;

_query = "SELECT name, motif FROM fpr WHERE active='1' ORDER by name";
_queryResult = [_query,2,true] call HC_fnc_asyncCall;

if(count _queryResult isEqualTo 0) then {
	_queryResult = [];
} else {
	_queryResult = _queryResult;
	{
		_x set[0,toString(_x select 0)];
		_x set[1,toString(_x select 1)];
	} forEach _queryResult;
};

[_queryResult] remoteExec ["ALF_fnc_update2FipSony",_unit];
