/*
	File: fn_startCrystalise.sqf
	Author: ALF TEAM
*/
params [
	["_obj", objNull, [objNull]],
	["_unit",objNull,[objNull]]
];

if(isNull _obj) exitWith {};
if(!((_obj animationPhase "Liquide_2") > 0) || _obj getVariable["in_process", false]) exitWith {}; 

_obj setVariable["in_process", true];
_obj animate["Meth_0", 1];
_obj animate["Liquide_2", 0];

[_unit, "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon"] remoteExec ["playMove", _unit];

uisleep 2;

_obj animate["Meth_1", 1];

if (_obj getVariable["ALF_Sulfate", false]) then {
	uisleep 20;
	
	_obj animate["Meth_1", 0];
	_obj animate["MethBlue_1", 1];
	
	uisleep 20;
	
	_obj animate["MethBlue_1", 0];
	_obj animate["MethBlue_2", 1];
	
	uisleep 10;
	
	_obj animate["MethBlue_2", 0];
	_obj animate["Sulfate", 0];
	_obj animate["Pilules", 1];
	
	_obj setVariable["ALF_Sulfate", false];
	_obj setVariable["process_finish_90", true];
} else {
	uisleep 30;
	
	_obj animate["Meth_1", 0];
	_obj animate["Meth_2", 1];
	
	uisleep 20;
	
	_obj animate["Meth_2", 0];
	_obj animate["Pilules", 1];
	
	_obj setVariable["process_finish_50", true];
};

_obj animate["Meth_0", 0];