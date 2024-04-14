#include "\ALF_Client\script_macros.hpp"
/*
	File : fn_placeDrugSystem.sqf
	Author: ALF Adam
*/
params[
	["_kit","",[""]]
];
if(_kit isEqualTo "") exitWith {};

private _obj = "Land_ALF_Coco";
if (_kit isEqualTo "") then {
	_obj = "ALF_Weed";
};

private _check = [player] call life_fnc_PlayerInBuilding;
if !(_check select 1) exitWith {["Attention", "Tu n'es pas dans un hangar. #1", "warning", false] spawn ALF_fnc_doMsg;};

private _house = _check select 0;
if (isNull _house) exitWith {["Attention", "Tu n'es pas dans un hangar. #2", "warning", false] spawn ALF_fnc_doMsg;};

if !((typeOf _house) isEqualTo "Land_i_Shed_Ind_F") exitWith {
	["ERREUR", "Tu doit être dans un hangar pour placer ceci.", "danger"] spawn ALF_fnc_doMsg;
};

[_kit,false] spawn life_fnc_handleItem;

private _3dkit = createVehicle ["groundweaponholder", [0,0,0], [], 0, "CAN_COLLIDE"];
_3dkit attachTo [player,[0,1.5,0.7]];
_3dkit addMagazineCargoGlobal [_kit,1];

private _upp = "Montage des objets";
life_action_inUse = true;
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
private _ui = GVAR_UINS "life_progress";
private _progress = _ui displayCtrl 38201;
private _pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
private _cP = 0.01;
for "_i" from 0 to 1 step 0 do {
	if(isNull _3dkit || {count(magazineCargo _3dkit) isEqualTo 0}) exitWith {};
	if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
		player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};
	sleep 0.27;
	_cP = _cP + 0.02;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
	if(_cP >= 1) exitWith {};
	if(!alive player) exitWith {};
	if(player != vehicle player) exitWith {};
	if(life_interrupted) exitWith {};
};
life_action_inUse = false;
5 cutText ["","PLAIN"];
player playActionNow "stop";

if(isNull _3dkit || {(count magazineCargo _3dkit) isEqualTo 0}) exitWith {
	life_interrupted = false;
	titleText["Action annulé.","PLAIN"]; 
	if !(isNull _3dkit) then {
		detach _3dkit;
		deletevehicle _3dkit;
	};
};

detach _3dkit;
deletevehicle _3dkit;

if(!alive player) exitWith {};
if(player != vehicle player) exitWith {};
if(life_interrupted) exitWith {player addMagazine _kit; life_interrupted = false; titleText["Action annulé.","PLAIN"];};

_object = _obj createVehicle [0,0,0];
_object allowDammage false;
[_object,true] remoteExecCall ["enableDynamicSimulation",HC3_Life];

//coco setPosATL [((getPosATL cursorobject) select 0) - 1.3,((getPosATL cursorobject) select 1)+4.8,((getPosATL cursorobject) select 2)];
//hint str(coco worldToModel (getPos cursortarget))
_object setDir (getDir _house);
_object setPos (_house ModelToWorld [2.2168,2.05371,-1.6]);

[getPlayerUID player,_object,_house,_obj,getPosWorld _object,getDir _object,_kit] remoteExec ["HC_fnc_addMobilier",HC2_Life];