/*
	Author : ALF - Adam
*/

private _machine = _this select 0;
if (isNull _machine || {isNil "_machine"}) exitWith {};

private _param = _machine getVariable ["param_machine",[false,60,39,25,20,10]];
if !(_param select 0) then {
	_param set [0,true];
	_machine animate ["Light", 1];
	
} else {
	_param set [0,false];
	_machine animate ["Light", 0];
};

_machine setVariable ["param_machine",_param];