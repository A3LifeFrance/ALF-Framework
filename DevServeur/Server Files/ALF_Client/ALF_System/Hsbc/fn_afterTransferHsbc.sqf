#include "\ALF_Client\script_macros.hpp"
/*
File: fn_afterTransferHsbc.sqf
Author: ALF Team
Description: Suite du script

*/
private["_numacc","_uidcible","_number"];
_numacc = _this select 0;
_number = _this select 1;

life_hsbc = life_hsbc - _number;
["HSBC", format["Tu as transféré %1/CHF de ton compte en Suisse sur le compte numéro %2.",[_number] call life_fnc_numberText,_numacc], "success", false] spawn ALF_fnc_doMsg;
[0] spawn ALF_fnc_updateHsbc;
[10] call SOCK_fnc_updatePartial;
