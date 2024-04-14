#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_poserChargePorte.sqf
	Author: ALF NiiRoZz
*/
params [
	["_item","",[""]]
];

if (_item isEqualTo "") exitwith {};
if (ALF_PoserChargeActive) exitwith {["Poser Charger", "Vous posez dejà une charge", "danger", false] spawn ALF_fnc_doMsg;};


[_item,false] spawn life_fnc_handleItem;
ALF_PoserChargeObject = "ALF_Charge_C2" createVehicle [0,0,0];
ALF_PoserChargeActive = true;
ALF_PoserChargeHouse = objNull;
[ALF_PoserChargeObject,false] remoteExecCall ["enableSimulationGlobal",2];
ALF_EventHandlerPoserCharge = addMissionEventHandler ["EachFrame", {
	_ins = lineIntersectsSurfaces [
		AGLToASL positionCameraToWorld [0,0,0], 
		AGLToASL positionCameraToWorld [0,0,4], 
		player,
		ALF_PoserChargeObject,
		true,
		1,
		"GEOM",
		"NONE"
	];
	if (count _ins == 0) exitWith {ALF_PoserChargeObject setPosASL [0,0,0]};
	ALF_PoserChargeObject setPosASL (_ins select 0 select 0); 
	ALF_PoserChargeObject setVectorUp (_ins select 0 select 1);
	ALF_PoserChargeHouse = (_ins select 0 select 3);
}];

