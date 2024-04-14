/*
	File: fn_deposerCNG.sqf
*/
private _value = missionNamespace getVariable ["CNP",0];
[format["UPDATE CNP SET bank='%1' WHERE id='1'",_value],1] call HC_fnc_asyncCall;