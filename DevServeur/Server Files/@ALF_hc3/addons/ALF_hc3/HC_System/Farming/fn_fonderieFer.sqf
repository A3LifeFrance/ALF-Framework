/*
	Fonderie de fer
*/
params [
	["_unit",objNull,[objNull]],
	["_curTarget",objNull,[objNull]]
];

/////////////////////////// PROCESS ///////////////////////////////////////
_curTarget animate ['door', 1];
["ALF_pierre_fer_small",false] remoteExec ["life_fnc_handleItem",_unit];

waitUntil {uiSleep 0.1; _curTarget animationPhase "door" isEqualTo 1;};

private _obj = "groundweaponholder" createVehicle [0,0,0];
_obj setPosATL (_curTarget modelToWorld [-0.5,0.15,-0.4]);
_obj addMagazineCargoGlobal ["ALF_pierre_fer_small",1];
[_obj,true] remoteExecCall ["enableDynamicSimulation",HC3_Life];

uiSleep 1;
_curTarget animate ['door', 0];
waitUntil {uiSleep 0.3; _curTarget animationPhase "door" isEqualTo 0;};
if(isNull _obj) exitWith {["Info", "Tu as récupéré ton minerai.", "warning", false] remoteExec ["ALF_fnc_doMsg",_unit]; _curTarget animate ['start', 0]; _curTarget animate ['end', 0]; _curTarget animate ['door', 0];};
if((count (magazineCargo _obj)) < 1) exitWith {["Info", "Tu as récupéré ton minerai.", "warning", false] remoteExec ["ALF_fnc_doMsg",_unit]; _curTarget animate ['start', 0]; _curTarget animate ['end', 0]; _curTarget animate ['door', 0]; detach _obj; deleteVehicle _obj;};
detach _obj; deleteVehicle _obj;

_curTarget animate ['start', 1];
_curTarget animate ['end', 1];

playSound3D ["ALF_Client2\sounds\four_fer.ogg",_curTarget];
uiSleep 101;

private _obj2 = "groundweaponholder" createVehicle [0,0,0];
_obj2 setPosATL (_curTarget modelToWorld [-0.5,0.13,-0.39]);
_obj2 addMagazineCargoGlobal ["ALF_Fer",1];
[_obj2,true] remoteExecCall ["enableDynamicSimulation",HC3_Life];

_curTarget animate ['door', 1];
_curTarget animate ['start', 0];
_curTarget animate ['end', 0];

//[2] remoteExec ["ALF_fnc_addXP",remoteExecutedOwner];
