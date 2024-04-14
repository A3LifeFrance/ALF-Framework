#include "\ALF_Client\script_macros.hpp"
/*
    File: fn_transformWhisky.sqf
    Author: ALF - Adam
*/
if ({_x isEqualTo "ALF_Mais"} count (magazines player) < 2) exitWith {
	["Info", "Il te faut du mais.", "danger"] spawn ALF_fnc_doMsg;
};
if (life_action_inUse) exitWith {
	["EREEUR", "Une action est déjà en cours.", "danger"] spawn ALF_fnc_doMsg;
};

private _upp = "Traitement du Mais";
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
if ({_x isEqualTo "ALF_Mais"} count (magazines player) < 2) exitWith {life_interrupted = false; titleText["Action annulé.","PLAIN"];};

["ALF_Mais",false] call life_fnc_handleItem;
["ALF_Mais",false] call life_fnc_handleItem;
["ALF_Whisky",true] call life_fnc_handleItem;