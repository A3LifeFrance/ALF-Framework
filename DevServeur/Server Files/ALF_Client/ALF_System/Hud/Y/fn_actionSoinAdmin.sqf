/*
	File: fn_adminSoinAdmin.sqf
	Author: ALF Adam

*/
private _unit = lbData[123490,lbCurSel (123490)];
_unit = call compile format ["%1", _unit];
if (isNil "_unit") exitWith {};
if (isNull _unit) exitWith {};
if (_unit == player) exitWith {};

_unit setDamage 0;