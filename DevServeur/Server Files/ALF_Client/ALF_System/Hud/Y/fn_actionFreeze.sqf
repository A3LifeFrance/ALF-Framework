/*
    File: fn_actionFreeze.sqf
    Author: ALF DEV TEAM
*/
private _target = lbData[123490,lbCurSel (123490)];
_target = call compile format ["%1", _target];

if (isNil "_target" || isNull _target) exitWith {};
if (_target == player) exitWith {};

[player] remoteExec ["alf_fnc_freezePlayer",_target];