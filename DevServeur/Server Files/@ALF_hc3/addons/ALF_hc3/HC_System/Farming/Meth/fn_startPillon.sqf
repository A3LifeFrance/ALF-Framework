/*
	File: fn_startPillon.sqf
	Author: ALF TEAM
*/
params [
	["_obj", objNull, [objNull]],
	["_unit",objNull,[objNull]]
];

if(isNull _obj) exitWith {};
if(!(_obj getVariable["ALF_Cuivre", false]) || _obj getVariable["in_pillon", false] || _obj getVariable["ALF_Sulfate", false]) exitWith {["Meth", "Il est déjà rempli.", "warning"] remoteExec ["ALF_fnc_doMsg",_unit];}; 

_obj setVariable["in_pillon", true];
_obj setVariable["ALF_Cuivre", false];

[_unit, "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon"] remoteExec ["playMove", _unit];

uisleep 5;

_obj animate["Cuivre", 0];

private _nbr = random 10;
if (_nbr < 4) then {
	_obj setVariable["ALF_Sulfate", true];
	_obj animate["Sulfate", 1];
};

_obj setVariable["in_pillon", false];