#include "\ALF_Client\script_macros.hpp"
/*
	File : fn_mobilierSystem.sqf
	Author: ALF Team
*/
params[
	["_kit","",[""]]
];
if(_kit isEqualTo "") exitWith {};

//On vérifie que le joueur est dans une maison.
private _check = [player] call life_fnc_PlayerInBuilding;
if !(_check select 1) exitWith {["Attention", "Tu n'es pas dans une maison. #1", "warning", false] spawn ALF_fnc_doMsg;};

private _house = _check select 0;
if (isNull _house) exitWith {["Attention", "Tu n'es pas dans une maison. #2", "warning", false] spawn ALF_fnc_doMsg;};

if (((player getVariable ["isEmployed",""]) isEqualTo "") && {_kit isEqualTo "ALF_Conteneur_Ent_boite"}) exitWith {
	["ERREUR", "Tu dois faire parti d'une entreprise pour placer ce mobilier.", "danger"] spawn ALF_fnc_doMsg;
};

life_mobilier_activeHouse = _house;

//On lance le mobilier system.
[_kit,false] spawn life_fnc_handleItem;

private _3dkit = createVehicle ["groundweaponholder", [0,0,0], [], 0, "CAN_COLLIDE"];
_3dkit attachTo [player,[0,1.5,0.7]];
_3dkit addMagazineCargoGlobal [_kit,1];

private _upp = "Montage du mobilier";
life_action_inUse = true;
//Setup our progress bar.
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
		//[player,"AinvPknlMstpSnonWnonDnon_medic_1",true] remoteExecCall ["life_fnc_animSync",RCLIENT];
		player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};
	sleep 0.27;
	_cP = _cP + 0.035;
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

//Anti dupli
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

//Verification du bon procédé.
if(!alive player) exitWith {};
if(player != vehicle player) exitWith {};
if(life_interrupted) exitWith {player addMagazine _kit; life_interrupted = false; titleText["Action annulé.","PLAIN"];};

//Tout est bon on envoit le tout.
private _name = M_CONFIG(getText,"ALFCfgMobiliers",_kit,"item");
private _index = ALF_Mobiliers_Objects find _name;
if (_index isEqualTo -1) exitWith {};
private _data = ALF_Mobiliers_Objects_Data select _index;

private "_object";
if(_name isEqualTo "Land_ALF_Plante_W_2") then {
	_object = _name createVehicle [0,0,0];
	_object allowDammage false;
	[_object,true] remoteExecCall ["enableDynamicSimulation",HC3_Life];
} else {
	_object = createSimpleObject [_data,[0,0,0]];
};
_object setPosWorld [(getPosWorld player) select 0,(getPosWorld player) select 1,((getPosWorld player) select 2) + 1];
_object setDir 0;

life_mobilier_active = true;

life_mobilier_activeName = _name;
life_mobilier_activeObj = _object;
life_mobilier_activeMun = _kit;

private _handle = (findDisplay 46) displayAddEventHandler ["MouseZChanged", {
    if (life_mobilier_active) then {
        if(life_mobilier_activeObj isEqualTo objNull) exitWith {};
        private _mobilier = life_mobilier_activeObj;
        private _dir = getDir _mobilier;
        if ((_this select 1) < 0) then {
            _dir = _dir - 1;
            if (_dir <= 0) then {
                _dir = 360;
            };
        } else {
            _dir = _dir + 1;
            if (_dir >= 360) then {
                _dir = 0;
            };
        };
        _mobilier setDir _dir;
    };
}];

for "_i" from 0 to 1 step 0 do {
	if(!life_mobilier_active) exitWith {(findDisplay 46) displayRemoveEventHandler ["MouseZChanged",_handle]};
	if(!alive player) exitWith {life_mobilier_active = false; detach _object;	deletevehicle _object; (findDisplay 46) displayRemoveEventHandler ["MouseZChanged",_handle]};
	if(player != vehicle player) exitWith {life_mobilier_active = false; detach _object;	deletevehicle _object; (findDisplay 46) displayRemoveEventHandler ["MouseZChanged",_handle]};
	private _pB = [player] call life_fnc_PlayerInBuilding;
	private _mB = [_object, _pB select 0] call life_fnc_MobilierInBuilding;
	if(_pB select 1 && {_mB}) then {
		titleText ["[ESPACE] pour placer l'object, [MOLETTE] pour l'orienter. [FLECHES] pour le déplacer. [SHIFT + FLECHES] pour la hauteur.", "PLAIN"];
	} else {
		titleText ["[ESPACE] pour annuler, [MOLETTE] pour l'orienter. [FLECHES] pour le déplacer. [SHIFT + FLECHES] pour la hauteur.", "PLAIN"];
	};
	uiSleep 0.1;
};
