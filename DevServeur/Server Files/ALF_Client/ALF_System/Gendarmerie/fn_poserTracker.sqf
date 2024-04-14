#include "\ALF_Client\script_macros.hpp"
/*
	File : poserTracker.sqf
	Author: ALF Team
*/
private _tracker = _this select 0;
private _veh = _this select 1;

if (isNull _veh OR (vehicle player != player) OR life_action_inUse OR {[player] call ALF_fnc_checkMenotter} OR {[player] call ALF_fnc_checkSurrender}) exitWith {};
if !(_veh isKindOf "Car" OR _veh isKindOf "Air" OR _veh isKindOf "Ship") exitWith {};
if (player distance _veh > 6) exitWith {["INFO", "Tu es trop loin.", "warning", false] spawn ALF_fnc_doMsg;};

life_interrupted = false;

private _3dobj = "ALF_Tracker" createvehicle [0,0,0];
_3dobj attachto [player, [0,0,0], "RightHandMiddle1"];
_3dobj setDir 0;
_3dobj setVectorDirAndUp [[0,0,0],[0,0,0]];

private["_ui","_progress","_pgText","_cP"];
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["Installation du tracker GPS (1%1)...","%"];
_progress progressSetPosition 0.01;
_cP = 0.01;

for "_i" from 0 to 1 step 0 do {
	if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
		//[player,"AinvPknlMstpSnonWnonDnon_medic_1",true] remoteExecCall ["life_fnc_animSync",RCLIENT];
		player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};
	sleep 0.3;
	_cP = _cP + 0.02;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["Installation du tracker GPS (%1%2)...",round(_cP * 100),"%"];
	if(_cP >= 1) exitWith {detach _3dobj;	deletevehicle _3dobj;};
	if(!alive player) exitWith {detach _3dobj;	deletevehicle _3dobj;};
	if(player != vehicle player) exitWith {detach _3dobj;	deletevehicle _3dobj;};
	if(life_interrupted) exitWith {detach _3dobj;	deletevehicle _3dobj;};
};

life_action_inUse = false;
5 cutText ["","PLAIN"];
player playActionNow "stop";
if(life_interrupted) exitWith {life_interrupted = false; ["Tracker GPS", "Action annulée.", "danger", false] spawn ALF_fnc_doMsg;};
if(player != vehicle player) exitWith {["Tracker GPS", "Action annulée.", "danger", false] spawn ALF_fnc_doMsg;};
player switchMove "";
["Tracker GPS", "Le tracker GPS est posé et activé.", "success", false] spawn ALF_fnc_doMsg;
[_tracker,false] spawn life_fnc_handleItem;
detach _3dobj;	
deletevehicle _3dobj;

_veh animateSource ["tracker", 0, true];

private _vehicules = missionNamespace getVariable ["VehiculeTracker",[]];
_vehicules pushBack _veh;
missionNamespace setVariable ["VehiculeTracker",_vehicules,true];