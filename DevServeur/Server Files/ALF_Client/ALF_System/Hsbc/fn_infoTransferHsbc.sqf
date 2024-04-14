#include "\ALF_Client\script_macros.hpp"
/*
File: fn_infoTransferHsbc.sqf
Author: ALF Team
Description: Reason

*/
private["_number","_ciblenumberacc"];
_number = _this select 0;
_ciblenumberacc = _this select 1;
_number = [_number] call life_fnc_numberText;

["HSBC",format["Le compte bancaire numéro %2 vous a transferé %1/CHF sur votre compte en Suisse.",[_number] call life_fnc_numberText,_ciblenumberacc], "danger", false] spawn ALF_fnc_doMsg;
