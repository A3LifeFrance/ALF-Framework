#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_poseViande.sqf
	Author: ALF NiiRoZz
*/
params [
	["_item","",[""]]
];

if (_item isEqualTo "") exitwith {};
if (ALF_PoserViandeActive) exitwith {["BARBECUE", "Vous êtes dejà entrain de poser quelque chose.", "danger", false] spawn ALF_fnc_doMsg;};


private _exit = false;
switch (_item) do {
	case "ALF_Saucisse_Crue_M": {
		ALF_PoserViandeObject = "ALF_Saucisse_Crue" createVehicle [0,0,0];
	};
	case "ALF_CotePorc_Crue_M": {
		ALF_PoserViandeObject = "ALF_CotePorc_Crue" createVehicle [0,0,0];
	};
	case "ALF_Poulet_Crue_M": {
		ALF_PoserViandeObject = "ALF_Poulet_Crue" createVehicle [0,0,0];
	};
	case "ALF_Bacon_Crue_M": {
		ALF_PoserViandeObject = "ALF_Bacon_Crue" createVehicle [0,0,0];
	};
	case "ALF_Maquereau_Crue_M": {
		ALF_PoserViandeObject = "ALF_Maquereau_Crue" createVehicle [0,0,0];
	};
	/*
	case "ALF_Sardine": {
		ALF_PoserViandeObject = "ALF_Maquereau_Crue" createVehicle [0,0,0];
	};
	case "ALF_Thon": {
		ALF_PoserViandeObject = "ALF_Maquereau_Crue" createVehicle [0,0,0];
	};
	case "ALF_Barbeau": {
		ALF_PoserViandeObject = "ALF_Maquereau_Crue" createVehicle [0,0,0];
	};
	case "ALF_Brochet": {
		ALF_PoserViandeObject = "ALF_Maquereau_Crue" createVehicle [0,0,0];
	};
	case "ALF_Anguille": {
		ALF_PoserViandeObject = "ALF_Maquereau_Crue" createVehicle [0,0,0];
	};
	case "ALF_Tortue": {
		ALF_PoserViandeObject = "ALF_Maquereau_Crue" createVehicle [0,0,0];
	};
	case "ALF_Saumon": {
		ALF_PoserViandeObject = "ALF_Maquereau_Crue" createVehicle [0,0,0];
	};
	case "ALF_Squale": {
		ALF_PoserViandeObject = "ALF_Maquereau_Crue" createVehicle [0,0,0];
	};
	*/
	default {
		_exit = true;
	};
};

if (_exit) exitWith {};
missionNamespace setVariable ["ALF_PoserItemViande",_item];
[_item,false] spawn life_fnc_handleItem;

ALF_PoserViandeActive = true;
ALF_PoserViandeBBQ = objNull;
[ALF_PoserViandeObject,false] remoteExecCall ["enableSimulationGlobal",2];
ALF_EventHandlerPoserViande = addMissionEventHandler ["EachFrame", {
	_ins = lineIntersectsSurfaces [
		AGLToASL positionCameraToWorld [0,0,0], 
		AGLToASL positionCameraToWorld [0,0,4], 
		player,
		ALF_PoserViandeObject,
		true,
		1,
		"GEOM",
		"NONE"
	];
	if (count _ins == 0) exitWith {ALF_PoserViandeObject setPosASL [0,0,0]};
	ALF_PoserViandeObject setPosASL (_ins select 0 select 0); 
	//ALF_PoserViandeObject setVectorUp (_ins select 0 select 1);
	ALF_PoserViandeBBQ = (_ins select 0 select 3);
}];