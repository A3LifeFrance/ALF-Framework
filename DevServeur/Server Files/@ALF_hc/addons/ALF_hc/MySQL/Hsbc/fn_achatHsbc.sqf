#include "\ALF_hc\hc_macros.hpp"
/*
	File: fn_achatHsbc.sqf
	Author: ALF Team

	This file is for Nanou's HeadlessClient.

	Description:
	Procedure MySQL pour l'achat d'un compte en Suisse.

*/
private["_uid"];
_uid = _this select 0;
_unit = _this select 1;

_nb = random[100000, 500000, 999999];
_nb = [_nb] call HC_fnc_numberSafe;
_count = ([format["SELECT COUNT(*) FROM hsbc WHERE numacc='%1'",_nb],2] call HC_fnc_asyncCall) select 0;

if (_count > 0) exitWith { [_uid,_unit] call HC_fnc_achatHsbc; };

_query = format["INSERT INTO hsbc (playerid, numacc, hsbcactive) VALUES ('%1','%2','1')",_uid,_nb];
[_unit,"numberHsbcAccount",_nb,false] remoteExecCall ["ALF_fnc_setVariable",_unit];

[_query,1] call HC_fnc_asyncCall;

[] remoteExecCall ["ALF_fnc_menuHsbc",_unit];
