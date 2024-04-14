#include "\ALF_Client\script_macros.hpp"
/*
File: fn_transferExtCompteBancaire.sqf
Author: ALF Team
Description: Transferer de compte a compte externe

*/
private["_number"];

if((time - life_action_delay) < 2) exitWith {hint "Tu appuis trop vite.";};
life_action_delay = time;

disableSerialization;
_number = parseNumber(ctrlText 23560);
_numacc = ctrlText 23560;

if(!([str(_number)] call TON_fnc_isnumber)) exitWith {["HSBC", "Non conforme.", "danger", false] spawn ALF_fnc_doMsg;};
if !([_numacc] call TON_fnc_isnumber) exitWith {["HSBC", "Numero de compte incorrect.", "danger", false] spawn ALF_fnc_doMsg;};

if(_number < 0) exitWith {["HSBC", "Ce nombre est négatif.", "danger", false] spawn ALF_fnc_doMsg;};
if(_number > 999999) exitWith {["HSBC", "Ce nombre est trop grand.", "danger", false] spawn ALF_fnc_doMsg;};

if (life_hsbc < _number) exitWith {["HSBC", "Tu n'as pas assez de fond sur ton compte en Suisse.", "danger", false] spawn ALF_fnc_doMsg;};
[_numacc,player,_number,getPlayerUID player] remoteExecCall ["HC_fnc_transferExtHsbc",HC_Life];
