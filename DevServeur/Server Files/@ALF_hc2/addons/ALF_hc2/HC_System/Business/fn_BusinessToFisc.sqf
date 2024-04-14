/*
	File: fn_agrandirBusiness.sqf
	Author: Nanou
	This file is for Nanou's HeadlessClient.
*/
_siretstr = _this select 0;
_namemember = _this select 1;
_num = _this select 2;
_isDeclare = _this select 3;
if(isNil "_siretstr" OR {isNil "_namemember"} OR {isNil "_num"} OR {isNil "_isDeclare"}) exitWith {};

[format["INSERT INTO fisc (siret, name, paie, isDeclare) VALUES ('%1','%2','%3','%4')",_siretstr,_namemember,_num,_isDeclare],1] call HC_fnc_asyncCall;
