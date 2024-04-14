#include "\ALF_hc\hc_macros.hpp"
/*
	File: fn_achatCompteBancaire.sqf
	Author: ALF Team

	This file is for Nanou's HeadlessClient.

	Description:
	Procedure MySQL pour l'achat d'un compte bancaire.

*/
private["_uid","_mode","_unit","_exit","_query","_nb","_count"];
_uid = _this select 0;
_mode = _this select 1;
_unit = _this select 2;
_exit = false;
_query = "";

switch (_mode) do {
	case 0 : {
		_nb = random[10000000, 50000000, 99999999];
		_nb = [_nb] call HC_fnc_numberSafe;
		_count = ([format["SELECT COUNT(*) FROM bank WHERE numacc='%1'",_nb],2] call HC_fnc_asyncCall) select 0;
		if (_count > 0) exitWith {_exit = true;};
		_query = format["INSERT INTO bank (playerid, numacc, laactive) VALUES ('%1','%2','1')",_uid,_nb];
		[_unit,"numberBankAccount",_nb,false] remoteExecCall ["ALF_fnc_setVariable",_unit];
	};
	case 1 : {_query = format["UPDATE bank SET lbactive='1' WHERE playerid='%1'",_uid];};
	case 2 : {_query = format["UPDATE bank SET lcactive='1' WHERE playerid='%1'",_uid];};
};
if (_exit) exitWith {	[_uid,_mode,_unit] call HC_fnc_achatCompteBancaire;	};

[_query,1] call HC_fnc_asyncCall;

[] remoteExecCall ["ALF_fnc_menuCompteBancaire",_unit];
