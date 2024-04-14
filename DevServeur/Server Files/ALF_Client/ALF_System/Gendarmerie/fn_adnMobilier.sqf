#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_inspectVehicle.sqf
	Author: ALF Nanou
*/
private["_vehicle"];
_vehicle = _this select 0;
if(isNil "_vehicle") exitWith {};

life_action_inUse = true;
private _displayName = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
private _upp = format["Inspection: %1",_displayName];

disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
private _ui = uiNameSpace getVariable "life_progress";
private _progress = _ui displayCtrl 38201;
private _pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
private _cP = 0.01;

for "_i" from 0 to 1 step 0 do {
	if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
		//[player,"AinvPknlMstpSnonWnonDnon_medic_1",true] remoteExecCall ["life_fnc_animSync",RCLIENT];
		player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};
	sleep 0.3;
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
	if(_cP >= 1) exitWith {};
	if(!alive player) exitWith {};
	if(life_interrupted) exitWith {};
	if(life_istazed) exitWith {};
};
life_action_inUse = false;
if(!alive player) exitWith {};
if(life_interrupted) exitWith {life_interrupted = false; ["INFO", "Action annulée.", "danger"] spawn ALF_fnc_doMsg;};
if(life_istazed) exitWith {};
5 cutText ["","PLAIN"];
player playActionNow "stop";
player switchMove "";

_data = _vehicle getVariable ["ilyadeladn",[]];
if(count _data isEqualTo 0) then {
	["Inspection", "Il n'y a pas de traces suspectes.", "success"] spawn ALF_fnc_doMsg;
} else {
	if(license_TIC) then {
		private _dice = random(100);
		if(_dice <= 90) then {
			["Inspection", "Tu as trouvé des traces suspectes. Voici les résultats:", "success"] spawn ALF_fnc_doMsg;
			hint str(_data);
		};
		if(_dice > 90 && {_dice < 95}) then {
			["Inspection", "Il n'y a pas de traces suspectes.", "success"] spawn ALF_fnc_doMsg;
		};
		if(_dice >= 95) then {
			["Inspection", "Il y a bien quelque chose, mais tu as sans doute effacé toute traces d'ADN. Fait plus attention !", "success"] spawn ALF_fnc_doMsg;
			_vehicle setVariable ["ilyadeladn",[],true];
		};
	} else {
		["Inspection", "Tu as effacé toute les traces.", "success"] spawn ALF_fnc_doMsg;
		_vehicle setVariable ["ilyadeladn",[],true];
	};
};
