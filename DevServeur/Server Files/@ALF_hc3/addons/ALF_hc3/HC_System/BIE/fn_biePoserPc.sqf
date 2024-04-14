/*
	File: fn_biePoserPc.sqf
	Author: ALF TEAM
*/
params [
	["_object",objNull,[objNull]],
	["_unit",objNull,[objNull]]
];
if (isNull _object || {isNull _unit}) exitWith {};

if !((_object animationSourcePhase "pc_source") isEqualTo 0) exitWith {};

["ALF_Pc",false] remoteExec ["life_fnc_handleItem",_unit];

_object animateSource ["pc_source",1,true];

["BIE","Tu es en train de hacker le system électrique.","success"] remoteExec ["ALF_fnc_doMsg",_unit];

playSound3D ["ALF_Client2\sounds\banque_pc_start.ogg", _object, false, (_object modelToWorld (_object selectionPosition "action_pc")), 5, 1, 100];
uiSleep 50;
_object setObjectTextureGlobal [0, "ALF_Batiments\ALF_object\data\computer_388888.paa"];
playSound3D ["ALF_Client2\sounds\banque_pc_bip.ogg", _object, false, (_object modelToWorld (_object selectionPosition "action_pc")), 5, 1, 100];
uiSleep 50;
_object setObjectTextureGlobal [0, "ALF_Batiments\ALF_object\data\computer_308888.paa"];
playSound3D ["ALF_Client2\sounds\banque_pc_bip.ogg", _object, false, (_object modelToWorld (_object selectionPosition "action_pc")), 5, 1, 100];
uiSleep 50;
_object setObjectTextureGlobal [0, "ALF_Batiments\ALF_object\data\computer_300888.paa"];
playSound3D ["ALF_Client2\sounds\banque_pc_bip.ogg", _object, false, (_object modelToWorld (_object selectionPosition "action_pc")), 5, 1, 100];
uiSleep 50;
_object setObjectTextureGlobal [0, "ALF_Batiments\ALF_object\data\computer_300688.paa"];
playSound3D ["ALF_Client2\sounds\banque_pc_bip.ogg", _object, false, (_object modelToWorld (_object selectionPosition "action_pc")), 5, 1, 100];
uiSleep 50;
_object setObjectTextureGlobal [0, "ALF_Batiments\ALF_object\data\computer_300618.paa"];
playSound3D ["ALF_Client2\sounds\banque_pc_bip.ogg", _object, false, (_object modelToWorld (_object selectionPosition "action_pc")), 5, 1, 100];
uiSleep 45;
playSound3D ["ALF_Client2\sounds\banque_pc_end.ogg", _object, false, (_object modelToWorld (_object selectionPosition "action_pc")), 5, 1, 100];
uiSleep 5;
_object setObjectTextureGlobal [0, "ALF_Batiments\ALF_object\data\computer_300614.paa"];
playSound3D ["ALF_Client2\sounds\banque_bigporte.ogg", _object, false, (_object modelToWorld (_object selectionPosition "action_pc")), 5, 1, 100];

_object animateSource ["disable_source",1,true];
_object setVariable ["broken",true];

[_object] call HC_fnc_actionLamps;

uiSleep 900;
_object setVariable ["broken",false];
