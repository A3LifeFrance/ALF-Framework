#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_receiveMoney.sqf
	Author: ALF Team
	Description:

*/
private["_val","_unit"];
_val = _this select 0;
_unit = _this select 1;

if(_val isEqualTo "") exitWith {};
if(!([_val] call TON_fnc_isnumber)) exitWith {};

["INFO", format["On vient de te donner %1€",[(parseNumber (_val))] call life_fnc_numberText], "success", false] spawn ALF_fnc_doMsg;
life_cash = life_cash + parseNumber(_val);
[name player,getPlayerUID player,"GIVE",format["A reçu %1€ de %2. Cash = %3€",parseNumber(_val),name _unit,life_cash]] remoteExec ["HC_fnc_logIt",HC3_Life];
[0] call SOCK_fnc_updatePartial;
