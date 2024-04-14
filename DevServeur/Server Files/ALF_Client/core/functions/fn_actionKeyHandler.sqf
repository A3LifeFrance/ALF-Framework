#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_actionKeyHandler.sqf
	Author: ALF Team

	Description:
	Master action key handler
*/
if(life_action_inUse) exitWith {};
if(life_interrupted) exitWith {life_interrupted = false;};
if((time - life_action_delay) < 0.5) exitWith {};
life_action_delay = time;
if (dialog || (player getVariable ["ReviveMedic",false]) || !(alive player) || life_isknocked || life_istazed) exitWith {};

if (ALF_3DInteraction_Selected > -1) exitWith {
	_script = ["[ALF_3DInteraction_CursorObject] spawn {
		params [
			[""_target"",objNull,[objNull]]
		];
	",ALF_3DInteractionScript_Selected,"};"];
	[] spawn (compile (_script joinString ""));
};

if (([player] call ALF_fnc_checkMenotter) || ([player] call ALF_fnc_checkSurrender)) exitWith {};

private _curObject = cursorObject;
private _isWater = surfaceIsWater (visiblePositionASL player);

if(_curObject isKindOf "Man" && {alive _curObject} && {isPlayer _curObject} && {"ALF_Guardian" in (magazines player)} && {life_pompier_service || {life_penit_service && license_medWork}} && {count (_curObject getVariable["MedicalStats",[]]) > 0}) exitWith {
	[_curObject] spawn ALF_fnc_menuGuardian;
};
if(_curObject isKindOf "Man" && {isPlayer _curObject} && {alive _curObject} && {player distance _curObject < 2}) exitWith {
	if (b_14) then {
		licence_driverTarget = "";
		[0] remoteExecCall ["ALF_fnc_driver",_curObject];
		[_curObject] spawn {
			_curObject = _this select 0;
			waitUntil {!(licence_driverTarget isEqualType "")};
			[_curObject] spawn ALF_fnc_interactionSystem;
		};
	};
	if (b_15) then {
		licence_pilotTarget = "";
		[0] remoteExecCall ["ALF_fnc_pilot",_curObject];
		[_curObject] spawn {
			_curObject = _this select 0;
			waitUntil {!(licence_pilotTarget isEqualType "")};
			[_curObject] spawn ALF_fnc_interactionSystem;
		};
	} else {
		licence_gunTarget = false;
		licence_rankTarget = [];
		[0] remoteExecCall ["ALF_fnc_Parmes",_curObject];
		[_curObject] spawn {
			_curObject = _this select 0;
			waitUntil {!(licence_rankTarget isEqualTo [])};
			//[_curObject] call ALF_fnc_interactions_player_to_player_basics;
			[_curObject] spawn ALF_fnc_interactionSystem;
		};
	};
};

if(_curObject isKindOf "Man" && {!alive _curObject} && {_curObject getVariable["ReviveMedic",false]}) exitWith {
	[_curObject] call ALF_fnc_interactions_player_to_player_coma;
};

if(_curObject isKindOf "ALF_Brancard_P" && {alive _curObject} && {"ALF_Guardian" in (magazines player)} && {life_pompier_service || {life_penit_service && license_medWork}} && {count (crew _curObject) > 0}) exitWith {
	private _player = (crew _curObject) select 0;
	if (count (_player getVariable["MedicalStats",[]]) > 0) then {
		[_player] spawn ALF_fnc_menuGuardian;
	};
};

if ((_curObject isKindOf "Land_ALF_radar_m") && {(player distance _curObject < 3)}) exitWith {
	[_curObject] spawn ALF_fnc_radarMenu;
};

if ((_curObject isKindOf "ALF_Poubelle") && {(player distance _curObject < 5)}) exitWith {
	[_curObject] call ALF_fnc_interactions_player_to_trash;
};

if (isClass(missionConfigFile >> "ALF_OBJECTS" >> typeOf(_curObject)) && {player distance _curObject < 5}) then {
    if !(_curObject call CBA_fnc_isTerrainObject) exitWith {
        [_curObject] call ALF_fnc_interactions_player_to_objects;
    };
};

if ((_curObject isKindOf "Land_ALF_bbq") && {(player distance _curObject < 3)} && {!(_curObject getVariable ["ALF_action_BBQ",false])} && {!(_curObject call CBA_fnc_isTerrainObject)}) exitWith {
	if (player canAdd "ALF_bbq_M") then {
		_curObject setVariable ["ALF_action_BBQ",true,true];
		if ((_curObject animationSourcePhase "chacha_source") isEqualTo 0) then {
			remoteExecCall ["", (_curObject getVariable ["ALF_bbq_JIP",""])]; 
			[3,_curObject] remoteExecCall ["ALF_fnc_barbecue",0];
		};
		[_curObject] spawn {
			_curObject = _this select 0;
			uiSleep 1;
			deleteVehicle _curObject;
			["ALF_bbq_M",true] spawn life_fnc_handleItem;
			["INFO", "Tu as récupéré le barbecue.", "success"] spawn ALF_fnc_doMsg;
		};
	} else {
		["INFO", "Tu n'as pas assez de place.", "danger"] spawn ALF_fnc_doMsg;
	};
};

_plant = (nearestObjects [player, ["Land_ALF_Plante_M"], 2]) select 0;
if (!(isNil "_plant")) exitWith {
	[_plant] spawn ALF_fnc_takeMais;
};

if((typeOf _curObject) isEqualTo "Land_ALF_ATM" && {player distance _curObject < 3}) exitWith {
	if !([_curObject] call ALF_fnc_hasEnergy) exitWith {["Distributeur", "Le distributeur n'a pas d'électricité.", "danger"] spawn ALF_fnc_doMsg;};
	if !(isNull(player getVariable ["wallet_obj", objNull])) exitWith {[_curObject] spawn ALF_fnc_bag_deposit;};
	if("ALF_CB_Bronze" in (magazines player) OR {"ALF_CB_Gold" in (magazines player)} OR {"ALF_CB_Black" in (magazines player)}) then {
		[_curObject] call ALF_fnc_menuDab;
	} else {
		["Distributeur", "Tu n'as pas de carte bancaire sur toi.", "danger"] spawn ALF_fnc_doMsg;1
	};
};

/*
if(!(jesuisassis) && {(_curObject getVariable ["mobilier_data",[]]) isEqualTo []} && ((typeOf(_curObject) isEqualTo "Land_OfficeChair_01_F") || (((getModelInfo _curObject) select 1) in ["alf_mobiliers\alf_chaise_2\alf_chaise_5.p3d","alf_mobiliers\alf_chaise_2\alf_chaise_4.p3d","alf_mobiliers\alf_chaise_2\alf_chaise_3.p3d","alf_mobiliers\alf_chaise_2\alf_chaise_2.p3d","alf_mobiliers\alf_chaise_2\alf_chaise_1.p3d","alf_mobiliers\alf_chaise\alf_chaise_5.p3d","alf_mobiliers\alf_chaise\alf_chaise_4.p3d","alf_mobiliers\alf_chaise\alf_chaise_3.p3d","alf_mobiliers\alf_chaise\alf_chaise_2.p3d","alf_mobiliers\alf_chaise\alf_chaise_1.p3d"]))) exitWith {
	[_curObject,"action"] call ALF_fnc_sitDown;
};
*/

if(!jesuisassis && (typeOf(_curObject) isEqualTo "Land_OfficeChair_01_F" || (((getModelInfo _curObject) select 0) isEqualTo "officechair_01_f.p3d"))) exitWith {
	[_curObject,"action"] call ALF_fnc_sitDown;
};

if(((getModelInfo _curObject) select 1) in ALF_Mobiliers_Objects_Data && {player distance _curObject < 4}) exitWith {
	[_curObject] spawn life_fnc_mobilierMenu;
};

if(_curObject isKindOf "House_F" && {player distance _curObject < 12}) exitWith {
	[_curObject] call ALF_fnc_interactions_player_to_house;
};

if(isNull _curObject) exitWith {
	if(_isWater) then {
		private _fish = (nearestObjects[player,(LIFE_SETTINGS(getArray,"animaltypes_fish")),3]) select 0;
		if(!isNil "_fish") then {
			if (!alive _fish) then {
				[_fish] call life_fnc_catchFish;
			};
		};
	} else {
		private _animal = (nearestObjects[player,(LIFE_SETTINGS(getArray,"animaltypes_hunting")),3]) select 0;
		if (!isNil "_animal") then {
			if (!alive _animal) then {
				[_animal] call life_fnc_gutAnimal;
			};
		};
	};
};

if(vehicle player != player) exitWith {};
life_action_inUse = true;

[] spawn {
	sleep 60;
	life_action_inUse = false;
};

private _list = ["landVehicle","Ship","Air"];
private _isVehicle = [false,true] select (KINDOF_ARRAY(_curObject,_list));

if(_isVehicle) then {
	if(!dialog) then {
		if((player distance _curObject) < ((boundingBox _curObject select 1) select 0)+2 && {!(_curObject isKindOf "ALF_Don_Sang")} && {!(_curObject isKindOf "ALF_Poubelle")}) then {
			[_curObject] spawn ALF_fnc_menuVehicles;
		};
	};
} else {
	if((typeOf _curObject) isEqualTo "Land_Money_F" && {!(_curObject getVariable ["inUse",false])}) then {
		[_curObject,player,true] remoteExecCall ["HC_fnc_pickupAction",HC_Life];
	};
};