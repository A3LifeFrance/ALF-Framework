/*
	File: fn_bool.sqf
	Author: ALF - NiiRoZz
*/
private "_return";
params [
	["_bool",0,[false,0]],
	["_mode",0,[0]]
];

if (_mode isEqualTo 0) then {
	if (_bool isEqualType 0) exitWith {_return = 0};
	_return = [0,1] select (_bool);
} else {
	if !(_bool isEqualType 0) exitWith {_return = false};
	_return = [false,true] select (_bool >= 1);
};

_return
