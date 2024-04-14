#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_adminTP.sqf
	Author: ALF Team

*/
private _target = lbData[123490,lbCurSel (123490)];
_target = call compile format ["%1", _target];
if (isNil "_target" || isNull _target) exitWith {};
if (_target == player) exitWith {};

if (!(vehicle _target isEqualTo _target)) exitWith {};
_target setPos (getPos player);
