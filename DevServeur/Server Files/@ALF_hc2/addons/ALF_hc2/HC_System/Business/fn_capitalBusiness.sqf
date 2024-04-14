/*
	File: fn_capitalBusiness.sqf
	Author: Nanou
	This file is for Nanou's HeadlessClient.
*/
private ["_siretstr","_newvalue"];
_siretstr = _this select 0;
_newvalue = _this select 1;
if(isNil "_siretstr" OR {isNil "_newvalue"}) exitWith {};

_newvalue = [_newvalue] call HC_fnc_numberSafe;

[format["UPDATE business SET capital='%1' WHERE siret='%2' AND active='1'",_newvalue,_siretstr],1] call HC_fnc_asyncCall;
