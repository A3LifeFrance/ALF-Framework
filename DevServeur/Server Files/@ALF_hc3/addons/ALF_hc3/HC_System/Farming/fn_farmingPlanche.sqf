/*
	Author: ALF Nanou
*/
params[
	["_obj",objNull,[objNull]],
	["_unit",objNull,[objNull]]
];
private _c = {_x isEqualTo "ALF_Buche"} count (magazines _unit);
if(_c < 2) exitWith {["INFO","Tu n'as pas de buche sur toi.","warning"] remoteExec ["ALF_fnc_doMsg",_unit];};
if(_obj getVariable ["wip",false]) exitWith {["INFO","La machine est en marche.","warning"] remoteExec ["ALF_fnc_doMsg",_unit];};
private _p = _obj getVariable ["planche",0];

if(_p > 0) exitWith {
	for "_i" from 0 to _p step 1 do {
		["ALF_Planche_B",true] remoteExec ["life_fnc_handleItem",_unit];
	};
	_obj setVariable ["planche",0];
	["INFO","Tu as récupéré tes planches.","success"] remoteExec ["ALF_fnc_doMsg",_unit];
	//[2] remoteExec ["ALF_fnc_addXP",_unit];
};

_obj setVariable ["wip",true];

for "_i" from 0 to _c step 1 do {
	["ALF_Buche",false] remoteExec ["life_fnc_handleItem",_unit];
};

[_obj,"planche_wip"] remoteExec ["life_fnc_say3D",playableUnits];

uiSleep 60;

_c = floor(_c / 2);
if(isNull _unit) exitWith {
	_obj setVariable ["planche",_c];
	_obj setVariable ["wip",false];
};

if(_unit distance _obj < 8) then {
	for "_i" from 0 to _c step 1 do {
		["ALF_Planche_B",true] remoteExec ["life_fnc_handleItem",_unit];
	};
	_obj setVariable ["planche",0];
	["INFO","Tu as récupéré tes planches.","success"] remoteExec ["ALF_fnc_doMsg",_unit];
	//[2] remoteExec ["ALF_fnc_addXP",_unit];
} else {
	_obj setVariable ["planche",_c];
};

_obj setVariable ["wip",false];