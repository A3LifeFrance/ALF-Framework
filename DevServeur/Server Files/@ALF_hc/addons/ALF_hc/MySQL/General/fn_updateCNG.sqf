/*
	File: fn_updateCNG.sqf
*/
private _num = _this select 0;
if(isNil "_num") exitWith {};
[format["UPDATE CNG SET bank='%1' WHERE id='1'",_num],1] call HC_fnc_asyncCall;
missionNamespace setVariable ["CNG",_num,true];
