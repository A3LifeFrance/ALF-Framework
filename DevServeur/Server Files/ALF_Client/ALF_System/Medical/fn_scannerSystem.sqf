#include "\ALF_Client\script_macros.hpp"
/*
Author: ScannerSystem
*/
params [
	["_s",objNull,[objNull]],
	["_u",objNull,[objNull]]
];
if(isNull _s || {isNull _u}) exitWith {};

if !([_u] call ALF_fnc_hasEnergy) exitWith {["INFO", "Le scanner n'a pas d'électricité.", "success"] remoteExec ["ALF_fnc_doMsg",_u];};

["INFO", "Le patient est transféré sur le Scanner.", "success"] remoteExec ["ALF_fnc_doMsg",_u];

alf_ms_active = false;
disableUserInput true;

player setUnconscious false;
player action ["Eject",vehicle player];
sleep 2;

[player, "passenger_injured_medevac_truck01"] remoteExec ["ALF_fnc_switchMove",0];
player setPosATL (_s modelToWorld (_s selectionPosition "pos_cargo"));
player setDir ((getDir _s) - 180);

_s setVariable ["wip",true,true];

for "_i" from 1 to 10 step 1 do {
	if(_s animationSourcePhase "box_source" > 0.5) then {
		_s animateSource ["box_source",0];
	} else {
		_s animateSource ["box_source",1];
		playSound3D ["ALF_Client2\sounds\irm.ogg", _s, false, getPosASL _s, 1, 1, 35];
	};
	sleep 15;
};

disableUserInput false;
_s setVariable ["wip",false,true];

alf_ms_isdead = false;

alf_ms_bpm = 80;
alf_ms_mmHg = 120;
alf_ms_resp = 15;
alf_ms_spo2 = 97;
alf_ms_pain = 0;
alf_ms_bleeding = false;
alf_ms_bouteille = false;

player setDamage 0;

player setVariable ["bouteilleo2",alf_ms_bouteille,HC3_life];
player setVariable ["MedicalStats",[],true];

[player, ""] remoteExec ["ALF_fnc_switchMove",0];
private _pos = getPosATL player;
player setPosATL [(_pos select 0)+1, _pos select 1, _pos select 2];

//Sauvegarde VIE + POS
life_is_alive = true;
[3] call SOCK_fnc_updatePartial;
