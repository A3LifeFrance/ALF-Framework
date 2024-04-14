/*
	File: fn_updateCNP.sqf
*/
private _p = _this select 0;
if(isNil "_p") exitWith {};

private _c = missionNamespace getVariable ["CNP",0];
_c = _c + _p;
missionNamespace setVariable ["CNP",_c,true];

[format["UPDATE CNP SET bank='%1' WHERE id='1'",_c],1] call HC_fnc_asyncCall;
