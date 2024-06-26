#include "\ALF_Client\script_macros.hpp"
/*
File: fn_deposerHsbc.sqf
Author: ALF Team
Description: Deposer du compte compte en Suisse

*/
private["_number"];

if((time - life_action_delay) < 2) exitWith {hint "Tu appuis trop vite.";};
life_action_delay = time;

disableSerialization;
_number = parseNumber(ctrlText 23560);

if(!([str(_number)] call TON_fnc_isnumber)) exitWith {["HSBC", "Non conforme.", "danger", false] spawn ALF_fnc_doMsg;};
if (life_cash < _number) exitWith {["HSBC", "Tu n'as pas cet argent sur toi.", "danger", false] spawn ALF_fnc_doMsg;};

if(_number < 0) exitWith {["HSBC", "Ce nombre est négatif.", "danger", false] spawn ALF_fnc_doMsg;};
if(_number > 999999) exitWith {["HSBC", "Ce nombre est trop grand.", "danger", false] spawn ALF_fnc_doMsg;};

life_hsbc = life_hsbc + _number;
life_cash = life_cash - _number;
["HSBC", format["Tu as déposé %1/CHF sur ton compte en Suisse.",[_number] call life_fnc_numberText], "success", false] spawn ALF_fnc_doMsg;
[0] spawn ALF_fnc_updateHsbc;
[0] call SOCK_fnc_updatePartial;
[10] call SOCK_fnc_updatePartial;
