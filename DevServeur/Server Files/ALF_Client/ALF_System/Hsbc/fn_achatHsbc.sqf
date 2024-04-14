#include "\ALF_Client\script_macros.hpp"
/*
File: fn_achatHsbc.sqf
Author: ALF Team
Description: Achat du compte en Suisse

*/
private["_display","_uid"];
_uid = getPlayerUID player;

_price = 30000;
_action = [format["Veux-tu acheter un compte en Suisse pour %1€. La somme sera prélevé en cash.",_price],"HSBC","OUI","NON"] call BIS_fnc_guiMessage;
if (!_action) exitWith {};
if(life_cash < _price) exitWith {["HSBC", format["Il te manque %1€ pour acheter un compte en Suisse.",[_price - life_cash] call life_fnc_numberText], "danger", false] spawn ALF_fnc_doMsg;};
life_cash = life_cash - _price;
life_hsbcactive = true;
[_uid,player] remoteExecCall ["HC_fnc_achatHsbc",HC_Life];
[0] call SOCK_fnc_updatePartial;
["HSBC", format["Tu as ouvert un compte en Suisse pour %1€",[_price] call life_fnc_numberText], "success", false] spawn ALF_fnc_doMsg;
