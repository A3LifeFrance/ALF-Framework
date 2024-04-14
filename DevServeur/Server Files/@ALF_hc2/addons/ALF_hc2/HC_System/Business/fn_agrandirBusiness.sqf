/*
	File: fn_agrandirBusiness.sqf
	Author: Nanou
	This file is for Nanou's HeadlessClient.
*/
private ["_siretstr","_newvalue","_level"];
_siretstr = _this select 0;
_newvalue = _this select 1;
_level = _this select 2;
if(isNil "_siretstr" OR {isNil "_newvalue"} OR {isNil "_level"}) exitWith {};

_newvalue = [_newvalue] call HC_fnc_numberSafe;

[format["UPDATE business SET capital='%1', level='%2' WHERE siret='%3' AND active='1'",_newvalue,_level,_siretstr],1] call HC_fnc_asyncCall;
