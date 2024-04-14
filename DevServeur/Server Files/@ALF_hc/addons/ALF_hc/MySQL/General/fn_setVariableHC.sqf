/*
	File: setVariableHC.sqf
*/
params [
	["_unit",objNull,[objNull]],
	["_name","",[""]],
	["_var",false,[false,"",0,[]]]
];

if(isNull _unit) exitWith {};

_unit setVariable [_name,_var,false];
