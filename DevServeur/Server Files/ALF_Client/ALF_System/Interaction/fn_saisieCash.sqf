#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_verifCash.sqf
	Author: NANOU
*/
private["_cop"];
_cop = _this select 0;

if(life_cash > 0) then {
	["INFO", format["%1€ a été saisie.",[life_cash] call life_fnc_numberText], "warning"] remoteExec ["ALF_fnc_doMsg",_cop];
	["INFO", format["Ton argent a été saisie (%1€).",[life_cash] call life_fnc_numberText], "warning"] spawn ALF_fnc_doMsg;
	life_cash = 0;
	[0] call SOCK_fnc_updatePartial;
} else  {
	["INFO", "Cette personne n'a pas d'argent sur lui.", "warning"] remoteExec ["ALF_fnc_doMsg",_cop];
};
