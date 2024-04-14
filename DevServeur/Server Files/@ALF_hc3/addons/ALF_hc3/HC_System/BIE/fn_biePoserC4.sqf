/*
	File: fn_bieEteindre.sqf
	Author: ALF TEAM
*/
params [
	["_object",objNull,[objNull]],
	["_unit",objNull,[objNull]]
];
if (isNull _object || {isNull _unit}) exitWith {};

if !((_object animationSourcePhase "explo_source") isEqualTo 0) exitWith {};

["ALF_C4",false] remoteExec ["life_fnc_handleItem",_unit];

_object animateSource ["explo_source",1,true];

["BIE","Tu as posé un C4 sur le compteur.","success"] remoteExec ["ALF_fnc_doMsg",_unit];

playSound3D ["ALF_Client2\sounds\banque_activeC4.ogg", _object, false, (_object modelToWorld (_object selectionPosition "action_c4")), 5, 1, 100];
uiSleep 10;

private _bomb = "mini_Grenade" createVehicle [0,0,0];
_bomb setPos (_object modelToWorld (_object selectionPosition "action_c4"));
uiSleep 5;

_object animateSource ["explo_source",0,true];
_object animateSource ["damage_source",1,true];
_object animateSource ["disable_source",1,true];

_object setVariable ["broken",true];

[_object] call HC_fnc_actionLamps;

uiSleep 900;
_object setVariable ["broken",false];
