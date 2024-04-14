/*
	Author: ALF Dev Team
*/
params [
	["_obj",objNull,[objNull]],
	["_unit",objNull,[objNull]]
];
if(isNull _unit OR {isNull _obj}) exitWith {};

private _c = {_x isEqualTo "ALF_Pomme"} count (magazines _unit);
if(_c < 4) exitWith {["INFO","Tu n'as pas au moins 4 pommes sur toi.","warning"] remoteExec ["ALF_fnc_doMsg",_unit];};
if(_obj getVariable ["wip",false]) exitWith {["INFO","La pompe est en marche.","warning"] remoteExec ["ALF_fnc_doMsg",_unit];};

if(_obj getVariable ["XxX",false]) exitWith {
	["INFO","Tu as récupéré le XxX.","success"] remoteExec ["ALF_fnc_doMsg",_unit];
	["ALF_XxX",true] remoteExec ["life_fnc_handleItem",_unit];
	_obj setVariable ["XxX",false];
};

_obj setVariable ["wip",true];

for "_i" from 1 to 4 step 1 do {
	["ALF_Pomme",false] remoteExec ["life_fnc_handleItem",_unit];
	uiSleep 0.25;
};

[_obj,"pompe_wip"] remoteExec ["life_fnc_say3D",playableUnits];

uiSleep 30;

if(isNull _unit) exitWith {
	_obj setVariable ["XxX",true];
	_obj setVariable ["wip",false];
};

if(_unit distance _obj < 8) then {
	["ALF_XxX",true] remoteExec ["life_fnc_handleItem",_unit];
	_obj setVariable ["XxX",false];
	["INFO","Tu as récupéré la bouteille de XxX.","success"] remoteExec ["ALF_fnc_doMsg",_unit];
} else {
	_obj setVariable ["XxX",true];
};

_obj setVariable ["wip",false];
//[2] remoteExec ["ALF_fnc_addXP",_unit];