#include "\ALF_hc\hc_macros.hpp"
/*
	File: fn_transferExtHsbc.sqf
	Author: ALF Team

	This file is for Nanou's HeadlessClient.

	Description:
	Procedure MySQL pour le transfert externe d'un compte bancaire.

*/
private["_numacc","_unit","_myuid"];
_numacc = _this select 0;
_unit = _this select 1;
_number = _this select 2;
_myuid = _this select 3;
_exit = false;
_raison = 0;

_query = format["SELECT playerid, soldehsbc FROM hsbc WHERE numacc='%1'",_numacc];
_result = [_query,2] call HC_fnc_asyncCall;

if ((count _result) > 0) then {

	_uidcible = _result select 0;
	_hsbc = _result select 1;

	if (_uidcible isEqualTo _myuid) exitWith {_exit = true; _raison = 1;};
	_hsbc = _hsbc + _number;
	[format["UPDATE hsbc SET hsbc='%1' WHERE playerid='%2'",_hsbc,_uidcible],1] call HC_fnc_asyncCall;
	[_numacc,_number] remoteExecCall ["ALF_fnc_afterTransferHsbc",_unit];

} else {
	_exit = true;
};

if (_exit) exitWith { [_raison] remoteExecCall ["ALF_fnc_badTransferHsbc",_unit];	};

_uidcible = _result select 0;
_unitcible = playableUnits param [playableUnits findIf {getPlayerUID _x isEqualTo _uidcible}, objNull];

if (isNull _unitcible) exitWith {};

_ciblenumberacc = ([format["SELECT numacc FROM hsbc WHERE playerid='%1'",_myuid],2] call HC_fnc_asyncCall) select 0;

[_number,_ciblenumberacc] remoteExecCall ["ALF_fnc_infoTransferHsbc",_unitcible];
