/*
	File: fn_retirerCNG.sqf
*/
private _uid = _this select 0;
private _name = _this select 1;
private _num = _this select 2;
if(isNil "_uid" OR {isNil "_name"} OR {isNil "_num"}) exitWith {};

_name = str(_name);
private _value = missionNamespace getVariable ["CNP",0];
[format["UPDATE CNP SET bank='%1' WHERE id='1'",_value],1] call HC_fnc_asyncCall;

[format["INSERT INTO CNP_LIST (uid, name, value) VALUES ('%1', '%2', '%3')",_uid,_name,_num],1] call HC_fnc_asyncCall;
