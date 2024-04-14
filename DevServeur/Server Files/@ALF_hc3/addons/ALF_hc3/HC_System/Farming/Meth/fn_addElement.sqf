/*
	File: fn_addElement.sqf
	Author: ALF TEAM
*/
params [
	["_obj", objNull, [objNull]],
	["_unit",objNull,[objNull]],
	["_element", "", [""]]
];

if(isNull _obj || _element isEqualTo "") exitWith {};
if(_obj getVariable[_element, false]) exitWith {["Meth", "Il est déjà rempli.", "warning"] remoteExec ["ALF_fnc_doMsg",_unit];};
if(!(_element in magazines _unit)) exitWith {["Meth", "Tu n'as pas ceci sur toi.", "warning"] remoteExec ["ALF_fnc_doMsg",_unit];};
if((_element isEqualTo "ALF_Cuivre") && (_obj getVariable["ALF_Sulfate", false])) exitWith {["Meth", "Il y a déjà du Sulfate.", "warning"] remoteExec ["ALF_fnc_doMsg",_unit];};

[_element,false] remoteExec ["life_fnc_handleItem",_unit];

[_unit, "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon"] remoteExec ["playMove", _unit];

if (_element isEqualTo "ALF_Pseudoephedrine") then {
	_obj animate["Liquide_1", 1];
};

if (_element isEqualTo "ALF_Cuivre") then {
	_obj setVariable["ALF_Cuivre", true];
	_obj animate["Cuivre", 1];
};