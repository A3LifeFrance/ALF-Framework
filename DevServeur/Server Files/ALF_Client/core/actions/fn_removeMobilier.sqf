#include "\ALF_Client\script_macros.hpp"
/*
	File : removeMobilier.sqf
	Author: ALF Team

	Description:
	Delete mobilier from house storage
*/
private["_house","_action","_mobilier","_mobilierType","_mobiliers"];
_mobilier = param [0,objNull,[objNull]];
private _check = [player] call life_fnc_PlayerInBuilding;
private _house = _check select 0;
if (isNull _house) exitWith {hint "Erreur, vous n'êtes pas dans une maison.";};

private _exit = false;
if(typeOf _house isEqualTo "Land_ALF_Entreprise") then {
	private _data =_house getVariable ["business",[]];
	if(count _data isEqualTo 0) exitWith {_exit = true;};
	if !((_data select 0) isEqualTo (getPlayerUID player)) exitWith {_exit = true;};
} else {
	if(!(_house in life_vehicles)) exitWith {_exit = true;};
};
if(_exit) exitWith {hint localize "STR_ISTR_Box_NotinHouse";};

if(isNull _mobilier) exitWith {};
closeDialog 0;

_action = [
	"Veux-tu enlever ce mobilier?","Mobilier","OUI","NON"
] call BIS_fnc_guiMessage;

if(_action) then {
	if (((getModelInfo _mobilier) select 1) isEqualTo "alf_batiments\alf_h_cocaine\alf_coco.p3d") exitWith {
		private _upp = "Destruction de l'atelier ...";
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
			if(isNull _mobilier) exitWith {};
			if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
				player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
				player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
			};
			sleep 0.27;
			_cP = _cP + 0.015;
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

		if(isNull _mobilier) exitWith {};
		if(!alive player) exitWith {};
		if(player != vehicle player) exitWith {};
		if(life_interrupted) exitWith {life_interrupted = false; titleText["Action annulé.","PLAIN"];};
		
		[_mobilier,_house] remoteExecCall ["HC_fnc_deleteDBmobilier",HC2_Life];
		[name player,getPlayerUID player,"MAISON",format["A recupérer un atelier de cocaine | POS : %1 | MAISON : %2", getPos _mobilier, typeOf _house]] remoteExec ["HC_fnc_logIt",HC3_Life];
	};

	private "_item";
	if (((getModelInfo _mobilier) select 1) isEqualTo "alf_mobiliers\alf_barrel\barrel.p3d") then {
		_item = "ALF_Barrel_boite";
	};
	
	if (((getModelInfo _mobilier) select 1) isEqualTo "alf_mobiliers\alf_security\alf_security.p3d") then {
		_item = "M_ALF_Security_boite";
	};

	private _name = _mobilier getVariable ["mobilier_name",""];
	private _classname = "";
	if (_name isEqualTo "") then {
		_array = "true" configClasses (configFile >> "CfgVehicles");
		_model = ((getModelInfo _mobilier) select 1) select [0, count (getModelInfo _mobilier select 1) - 4];
		{
			if ((toLower (getText (_x >> "model"))) find (toLower (_model)) > -1) exitWith {
				_classname = configName _x;
			};
		} forEach _array;
		if (_classname isEqualTo "") exitWith {};
		_name = _classname;
	};
	if (_name isEqualTo "") exitWith {};

	{
		if((getText (missionConfigFile >> "ALFCfgMobiliers" >> _x >> "item")) isEqualTo _name) exitWith {_item = _x};
	} forEach ALF_Mobiliers_Items;

	if !(_item isEqualTo "") then {
		[_item,true] spawn life_fnc_handleItem;
		[name player,getPlayerUID player,"MAISON",format["A recupérer un meuble | Item : %1 | POS : %2 | MAISON : %3", _item, getPos _mobilier, typeOf _house]] remoteExec ["HC_fnc_logIt",HC3_Life];
	} else {
		[name player,getPlayerUID player,"MAISON",format["A recupérer un meuble | Item : PAS RECUP | POS : %1 | MAISON : %2", getPos _mobilier, typeOf _house]] remoteExec ["HC_fnc_logIt",HC3_Life];
	};
	
	[_mobilier,_house] remoteExecCall ["HC_fnc_deleteDBmobilier",HC2_Life];
};