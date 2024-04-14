#include "\ALF_Client\script_macros.hpp"
/*
File: fn_repairHeli.sqf
Author: ALF Team
*/
private _veh = _this select 0;
if(player distance _veh > 6) exitWith {};
if (ALF_Phone_tryCall || {ALF_Phone_inCall} || {ALF_Phone_Ring} || {[player] call ALF_fnc_checkMenotter} || {[player] call ALF_fnc_checkSurrender}) exitWith {};

life_action_inUse = true;

private["_ui","_progress","_pgText","_cP","_speed"];
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["Réparation générale (1%1)...","%"];
_progress progressSetPosition 0.01;
_cP = 0.01;
_speed = 0.01;

for "_i" from 0 to 1 step 0 do {
	if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
		//[player,"AinvPknlMstpSnonWnonDnon_medic_1",true] remoteExecCall ["life_fnc_animSync",RCLIENT];
		player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};
	_cP = _cP + _speed;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["Réparation générale (%1%2)...",round(_cP * 100),"%"];
	if(_cP >= 1) exitWith {};
	if(!alive player) exitWith {};
	if(player != vehicle player) exitWith {};
	if(life_interrupted) exitWith {};
	sleep 0.27;
};

5 cutText ["","PLAIN"];
player playActionNow "stop";
if(life_interrupted) exitWith {life_interrupted = false; ["Réparation", "Action annulée.", "danger", false] spawn ALF_fnc_doMsg;};
if(player != vehicle player) exitWith {["Réparation", "Action annulée.", "danger", false] spawn ALF_fnc_doMsg;};
player switchMove "";
["Réparation", "L'hélicoptère est réparé.", "success", false] spawn ALF_fnc_doMsg;
["ALF_Boiteaoutils",false] spawn life_fnc_handleItem;

_veh setDamage 0;

life_action_inUse = false;