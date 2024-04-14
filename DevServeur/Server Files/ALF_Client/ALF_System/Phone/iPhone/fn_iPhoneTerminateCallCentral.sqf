/*
	File: fn_iPhoneTerminateCallCentral.sqf
	Author: ALF Team
*/
if((lbCurSel 33121) isEqualTo -1) exitWith {};
private _cible = lbData[33121,lbCurSel (33121)];
_cible = call compile format["%1", _cible];

_cible params [
	["_callID",0,[0]],
	["_anonyme",0,[0]],
	["_number","",[""]],
	["_unit",objNull,[objNull]]
];
if(isNull _unit) exitWith {};