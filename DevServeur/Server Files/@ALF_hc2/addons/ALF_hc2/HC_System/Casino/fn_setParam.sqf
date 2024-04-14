/*
	Author : ALF - Adam
*/

params [
	["_machine",objNull,[objNull]],
	["_param",0,[0]],
	["_value",0,[0]]
];

if (isNull _machine || !(_param in [1,2,3]) || (_value < 1)) exitWith {};

private _actual = _machine getVariable ["param_machine",[false,60,35,20]];

_actual set [_param,_value];

_machine setVariable ["param_machine",_actual];