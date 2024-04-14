/*
	File: fn_deleteFipSony.sqf
	Author: ALF Team
*/
params[
	["_msg","",[""]],
	["_unit",objNull,[objNull]]
];
if(_msg isEqualTo "" OR {isNull _unit}) exitWith {};

_msg = toArray _msg;

[format["UPDATE fpr SET active='0' WHERE motif='%1' AND active='1'",_msg],1] call HC_fnc_asyncCall;

uiSleep 1;

private _queryResult = ["SELECT name, motif FROM fpr WHERE active='1'",2,true] call HC_fnc_asyncCall;
if(isNil "_queryResult") exitWith {};

if(count (_queryResult) isEqualTo 0) then {
	_queryResult = [];
} else {
	{
		_x set[0,toString(_x select 0)];
		_x set[1,toString(_x select 1)];
	} forEach _queryResult;
};

[_queryResult] remoteExec ["ALF_fnc_update2FipSony",_unit];
