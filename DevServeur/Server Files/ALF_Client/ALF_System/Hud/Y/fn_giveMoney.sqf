#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_giveMoney.sqf
	Author: ALF Team
	Description:

*/
private["_unit","_amount"];
_amount = ctrlText 123453;

if((time - life_action_delay) < 0.3) exitWith {hint "Tu appuis trop vite.";};
life_action_delay = time;

_unit = cursorObject;
if(isNil "_unit") exitWith {["INFO","Impossible de donner de l'argent.", "danger", false] spawn ALF_fnc_doMsg;};
if(isNull _unit) exitWith {["INFO","Impossible de donner de l'argent.", "danger", false] spawn ALF_fnc_doMsg;};
if(_unit isEqualTo player) exitWith {["INFO","Impossible de donner de l'argent.", "danger", false] spawn ALF_fnc_doMsg;};
if!(_unit isKindOf "Man") exitWith {["INFO","Il n'y a personne en face de toi.", "danger", false] spawn ALF_fnc_doMsg;};
if(!isPlayer _unit) exitWith {["INFO","Il n'y a personne en face de toi.", "danger", false] spawn ALF_fnc_doMsg;};
if(!alive _unit) exitWith {["INFO","Cette personne est morte.", "danger", false] spawn ALF_fnc_doMsg;};
if(!(player getVariable ["ALF_EnPrison",false]) && {_unit getVariable ["ALF_EnPrison",false]}) exitWith {["INFO","Cette personne est en prison.", "danger", false] spawn ALF_fnc_doMsg;};
if(!([_amount] call TON_fnc_isnumber)) exitWith {["INFO","Non conforme.", "danger", false] spawn ALF_fnc_doMsg;};

//A series of checks *ugh*
if(!life_use_atm) exitWith {["INFO","Tu ne peux pas donner d'argent pour l'instant.", "danger", false] spawn ALF_fnc_doMsg;};
if(parseNumber(_amount) <= 0) exitWith {["INFO","Non conforme.", "danger", false] spawn ALF_fnc_doMsg;};
if(parseNumber(_amount) > life_cash) exitWith {["INFO","Tu n'as pas assez sur toi.", "danger", false] spawn ALF_fnc_doMsg;};

life_cash = life_cash - (parseNumber(_amount));
[0] call SOCK_fnc_updatePartial;

["INFO", format["Tu viens de donner %1€",[(parseNumber (_amount))] call life_fnc_numberText], "success", false] spawn ALF_fnc_doMsg;
[name player,getPlayerUID player,"GIVE",format["A donné %1€ à %2. Cash = %3€",_amount,name _unit,life_cash]] remoteExec ["HC_fnc_logIt",HC3_Life];
[_amount,player] remoteExecCall ["ALF_fnc_receiveMoney",_unit];
[] call ALF_fnc_menuY;
