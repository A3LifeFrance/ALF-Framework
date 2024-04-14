#include "\ALF_Client\script_macros.hpp"
/*
File: getPaidBusiness.sqf
Author: ALF Nanou
*/
private["_paye"];
_paye = _this select 0;

life_cash = life_cash + _paye;
[0] call SOCK_fnc_updatePartial;

["INFO",format["Tu as reçu ta paye en cash. (%1€)",[_paye] call life_fnc_numberText],"success"] spawn ALF_fnc_doMsg;
[name player,getPlayerUID player,"BANK",format["A recu une paye de %1€ en cash | Cash = %2€",_paye,life_cash]] remoteExec ["HC_fnc_logIt",HC3_Life];
