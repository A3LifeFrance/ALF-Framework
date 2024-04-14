/*
	File: fn_agrandirBusiness.sqf
	Author: Nanou
	This file is for Nanou's HeadlessClient.
*/
private ["_siretstr","_membres"];
_siretstr = _this select 0;
_membres = _this select 1;
if(isNil "_siretstr" OR {isNil "_membres"}) exitWith {};

_membres = [_membres] call HC_fnc_mresArray;

[format["UPDATE business SET membres='%1' WHERE siret='%2' AND active='1'",_membres,_siretstr],1] call HC_fnc_asyncCall;
