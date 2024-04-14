/*
	File: fn_adminTP3.sqf
	Author: ALF Dev Team

*/
private _target = lbData[123490,lbCurSel (123490)];
_target = call compile format ["%1", _target];

if (isNil "_target" || isNull _target) exitWith {};
if (_target isEqualTo player) exitWith {};

if ((vehicle _target) isEqualTo _target) then {
	player setPos (getPos _target);
} else {
	player moveInCargo (vehicle _target);
};