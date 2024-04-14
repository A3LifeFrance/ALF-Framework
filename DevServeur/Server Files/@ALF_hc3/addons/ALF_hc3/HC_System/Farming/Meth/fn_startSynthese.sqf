/*
	File: fn_startSynthese.sqf
	Author: ALF TEAM
*/
params [
	["_obj", objNull, [objNull]],
	["_unit",objNull,[objNull]]
];

if(isNull _obj) exitWith {};
if(!((_obj animationPhase "Liquide_1") > 0) || ((_obj animationPhase "Liquide_2") > 0)) exitWith {}; 
if(_obj getVariable["in_synthese", false]) exitWith {["Meth", "La synthèse est déjà en cours.", "warning"] remoteExec ["ALF_fnc_doMsg",_unit];};

_obj setVariable["in_synthese", true];

private _Fire = "#particlesource" createVehicle (getpos _obj); 
_Fire setParticleClass "SmallDestructionFire"; 
_Fire setPosATL (getpos _obj); 
_Fire attachTo [_obj, [-0.7, 0.15, 0.45]]; 
private _Fire2 = "#particlesource" createVehicle (getpos _obj); 
_Fire2 setParticleClass "MediumDestructionSmoke"; 
_Fire2 setPosATL (getpos _obj); 
_Fire2 attachTo [_obj, [-0.7, 0.15, 0.6]];

private _soundFire = createSoundSource ["Sound_Fire", position _obj, [], 5];

uisleep 40;

deleteVehicle _Fire;
deleteVehicle _Fire2;
deleteVehicle _soundFire;

_obj setVariable["in_synthese", false];

_obj animate["Liquide_2", 1];
_obj animate["Liquide_1", 0];
