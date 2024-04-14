/*
	File: fn_updateDABDispo.sqf
	Author: ALF Dev Team
*/

params [
	["_dab",objNull,[objNull]],
	["_unit",objNull,[objNull]],
	["_amount",0,[0]]
];

if (isNull _dab || {isNull _unit}) exitWith {};
if (_amount < 0) exitWith {};

_dispo = _dab getVariable ["dispo", 100000];
if (_dispo isEqualTo 100000) exitWith {["ATM","Le distributeur est déjà plein.","danger"] remoteExec ["ALF_fnc_doMsg",_unit]; [] remoteExec ["ALF_fnc_moneyBagHandle",_unit];};

_new_dispo = _dispo + _amount;

if (_new_dispo <= 100000) then {
	_dab setVariable ["dispo", _new_dispo];
} else {
	_dab setVariable ["dispo", 100000];
};