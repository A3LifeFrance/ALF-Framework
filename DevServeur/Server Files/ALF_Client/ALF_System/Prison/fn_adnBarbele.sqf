#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_adnBarbele.sqf
	Author: ALF TEAM
*/
private _obj = _this select 0;
if(isNull _obj) exitWith {};

life_action_inUse = true;

//Setup our progress bar.
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
private _ui = uiNameSpace getVariable "life_progress";
private _progress = _ui displayCtrl 38201;
private _pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["Inspection du barbelé (1%1)...","%"];
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
	_pgText ctrlSetText format["Inspection du barbelé (%1%2)...",round(_cP * 100),"%"];
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

private _data = _obj getVariable ["ilyadeladn",[]];
if(count _data isEqualTo 0) then {
	["Inspection", "Il n'y a pas de traces suspectes.", "success"] spawn ALF_fnc_doMsg;
} else {
	if(license_TIC) then {
		private _dice = random(80);
		if(_dice <= 70) then {
			["Inspection", "Tu as trouvé des traces suspectes.", "success"] spawn ALF_fnc_doMsg;
			hint str(_data);
		};
		if(_dice > 70 && {_dice < 80}) then {
			["Inspection", "Il n'y a pas de traces suspectes.", "success"] spawn ALF_fnc_doMsg;
		};
		if(_dice >= 90) then {
			["Inspection", "Il y a bien quelque chose, mais tu as sans doute effacé toute traces d'ADN. Fait plus attention !", "success"] spawn ALF_fnc_doMsg;
			_obj setVariable ["ilyadeladn",[],true];
		};
	} else {
		["Inspection", "Tu as effacé toute les traces.", "success"] spawn ALF_fnc_doMsg;
		_obj setVariable ["ilyadeladn",[],true];
	};
};