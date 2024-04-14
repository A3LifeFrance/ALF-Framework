#include "\ALF_Client\script_macros.hpp"
/*
    File: fn_createCigarette.sqf
    Author: ALF - NiiRoZz
*/
if ({_x isEqualTo "ALF_Tabac_Seche"} count (magazines player) isEqualTo 0) exitWith {
	["Info", "Il te faut des feuilles de tabac pour pouvoir les sécher. T'es beau à essayer de secher sans feuille.", "danger"] spawn ALF_fnc_doMsg;
};

private _upp = "Confectionne des cigarettes";
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
	sleep 0.4;
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

//Verification du bon procédé.
if !(alive player) exitWith {};
if (player != vehicle player) exitWith {};
if (life_interrupted) exitWith {life_interrupted = false; titleText["Action annulé.","PLAIN"];};
if ({_x isEqualTo "ALF_Tabac_Seche"} count (magazines player) isEqualTo 0) exitWith {life_interrupted = false; titleText["Action annulé.","PLAIN"];};

["ALF_Tabac_Seche",false] call life_fnc_handleItem;
["murshun_cigs_cig0",true] call life_fnc_handleItem;