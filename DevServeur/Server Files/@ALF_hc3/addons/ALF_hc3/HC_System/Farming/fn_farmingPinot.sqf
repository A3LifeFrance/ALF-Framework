/*
	Author: ALF Nanou
*/
params [
	["_obj",objNull,[objNull]],
	["_unit",objNull,[objNull]]
];
if(isNull _unit OR {isNull _obj}) exitWith {};

private _c = {_x isEqualTo "ALF_Raisin"} count (magazines _unit);
if(_c < 4) exitWith {["INFO","Tu n'as pas au moins 4 grappes sur toi.","warning"] remoteExec ["ALF_fnc_doMsg",_unit];};
if(_obj getVariable ["wip",false]) exitWith {["INFO","La pompe est en marche.","warning"] remoteExec ["ALF_fnc_doMsg",_unit];};

if(_obj getVariable ["vin",false]) exitWith {
	["INFO","Tu as récupéré le vin.","success"] remoteExec ["ALF_fnc_doMsg",_unit];
	["ALF_Pinot",true] remoteExec ["life_fnc_handleItem",_unit];
	_obj setVariable ["vin",false];
};

_obj setVariable ["wip",true];

for "_i" from 1 to 4 step 1 do {
	["ALF_Raisin",false] remoteExec ["life_fnc_handleItem",_unit];
	uiSleep 0.25;
};

[_obj,"pompe_wip"] remoteExec ["life_fnc_say3D",playableUnits];

uiSleep 30;

if(isNull _unit) exitWith {
	_obj setVariable ["vin",true];
	_obj setVariable ["wip",false];
};

if(_unit distance _obj < 8) then {
	["ALF_Pinot",true] remoteExec ["life_fnc_handleItem",_unit];
	_obj setVariable ["vin",false];
	["INFO","Tu as récupéré la bouteille de vin.","success"] remoteExec ["ALF_fnc_doMsg",_unit];
} else {
	_obj setVariable ["vin",true];
};

_obj setVariable ["wip",false];
//[2] remoteExec ["ALF_fnc_addXP",_unit];