#include "\ALF_hc\hc_macros.hpp"
/*
	File: fn_transferExtCompteBancaire.sqf
	Author: ALF Team

	This file is for Nanou's HeadlessClient.

	Description:
	Procedure MySQL pour le transfert externe d'un compte bancaire.

*/
private["_uidcible","_xuid","_lcactive","_livretc","_lbactive","_livretb","_livreta","_numacc","_mode","_number","_raison","_query","_result","_unit","_myuid","_unitcible","_exit"];
_numacc = _this select 0;
_mode = _this select 1;
_unit = _this select 2;
_number = _this select 3;
_myuid = _this select 4;
_exit = false;
_raison = 0;

_query = format["SELECT playerid, livreta, livretb, lbactive, livretc, lcactive FROM bank WHERE numacc='%1'",_numacc];
_result = [_query,2] call HC_fnc_asyncCall;

if ((count _result) > 0) then {

	_uidcible = _result select 0;
	_livreta = _result select 1;
	_livretb = _result select 2;
	_lbactive = _result select 3;
	_livretc = _result select 4;
	_lcactive = _result select 5;

	switch (_mode) do {
		case 0 : {
			if (_uidcible isEqualTo _myuid) exitWith {_exit = true; _raison = 1;};
			if ((_livreta + _number) > 75000) exitWith {_exit = true; _raison = 4;};
			_livreta = _livreta + _number;
			[format["UPDATE bank SET livreta='%1' WHERE playerid='%2'",_livreta,_uidcible],1] call HC_fnc_asyncCall;
			[_numacc,_mode,_number] remoteExecCall ["ALF_fnc_afterTransferCompteBancaire",_unit];
		};
		case 1 : {
			if (_uidcible isEqualTo _myuid) exitWith {_exit = true; _raison = 1;};
			if (_lbactive isEqualTo 0) exitWith {_exit = true; _raison = 2;};
			if ((_livretb + _number) > 500000) exitWith {_exit = true; _raison = 5;};
			_livretb = _livretb + _number;
			[format["UPDATE bank SET livretb='%1' WHERE playerid='%2'",_livretb,_uidcible],1] call HC_fnc_asyncCall;
			[_numacc,_mode,_number] remoteExecCall ["ALF_fnc_afterTransferCompteBancaire",_unit];
		};
		case 2 : {
			if (_uidcible isEqualTo _myuid) exitWith {_exit = true; _raison = 1;};
			if (_lcactive isEqualTo 0) exitWith {_exit = true; _raison = 3;};
			_livretc = _livretc + _number;
			[format["UPDATE bank SET livretc='%1' WHERE playerid='%2'",_livretc,_uidcible],1] call HC_fnc_asyncCall;
			[_numacc,_mode,_number] remoteExecCall ["ALF_fnc_afterTransferCompteBancaire",_unit];
		};
	};
} else {
	_exit = true;
};
if (_exit) exitWith { [_raison] remoteExecCall ["ALF_fnc_badTransferCompteBancaire",_unit];	};

_exit = false;
_uidcible = _result select 0;
{
	_xuid = getPlayerUID _x;
	if (_xuid isEqualTo _uidcible) exitWith {
	  _unitcible = _x;
	  _exit = true;
	};
} forEach playableUnits;
if (!_exit) exitWith {};

_ciblenumberacc = ([format["SELECT numacc FROM bank WHERE playerid='%1'",_myuid],2] call HC_fnc_asyncCall) select 0;
[_number,_ciblenumberacc,_mode] remoteExecCall ["ALF_fnc_infoTransferCompteBancaire",_unitcible];
