/*
	File: fn_bool.sqf
	Author: ALF - NiiRoZz

	Description:
	Handles bool conversion for MySQL since MySQL doesn't support 'true' or 'false'
	instead MySQL uses Tinyint for BOOLEAN (0 = false, 1 = true)
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
