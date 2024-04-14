/*
	File: fn_retirerCNG.sqf
*/
private _unit = _this select 0;
if(isNil "_unit") exitWith {};

private _queryResult = ["SELECT name, value, DATE_FORMAT(insert_time,'%d/%m/%Y %HH%i') FROM CNG_LIST ORDER BY id DESC",2,true] call HC_fnc_asyncCall;
if(count _queryResult isEqualTo 0) then {
	_queryResult = [];
} else {
	_queryResult = _queryResult;
};
[_queryResult] remoteExec ["ALF_fnc_updateCNGList",_unit];
