#include "\ALF_hc\hc_macros.hpp"
/*
	File: fn_cbParametre.sqf
	Author: ALF Team

	This file is for Nanou's HeadlessClient.

	Description:
	Procedure MySQL pour parametrer sa carte bleu.

*/
private["_uid","_mode","_query"];
_uid = _this select 0;
_mode = _this select 1;
_query = "";

switch (_mode) do {
	case 1 : {_query = format["UPDATE bank SET activecb='1' WHERE playerid='%1'",_uid];};
	case 2 : {_query = format["UPDATE bank SET activecb='2' WHERE playerid='%1'",_uid];};
	case 3 : {_query = format["UPDATE bank SET activecb='3' WHERE playerid='%1'",_uid];};
};

[_query,1] call HC_fnc_asyncCall;
