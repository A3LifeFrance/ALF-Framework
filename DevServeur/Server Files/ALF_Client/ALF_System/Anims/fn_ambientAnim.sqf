/*
    File: fn_ambientAnim.sqf
    Author: NiiRoZz

    Description:
    Some information in local client for his position
*/
if !(hasInterface) exitWith {};
params [
	["_trader",objNull,[objNull]],
    ["_animations",[],[[]]]
];

_trader switchMove "";
sleep 1;
_trader switchMove (_animations select 0);
_trader setVariable ["AnimationsALF", _animations];
_trader addEventHandler ["AnimDone", {
	_trader = _this select 0;
	_animations = _trader getVariable ["AnimationsALF", []];
	_trader switchMove (_animations select floor(random (count _animations)));
}];