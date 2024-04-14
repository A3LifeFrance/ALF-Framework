#include "\ALF_Client\script_macros.hpp"
/*
File: fn_retirerCompteBancaire.sqf
Author: ALF Team
Description: Retirer du compte bancaire

*/
private["_mode"];
_mode = _this select 0;

if((time - life_action_delay) < 1) exitWith {hint "Tu appuis trop vite.";};
life_action_delay = time;

disableSerialization;
_display = findDisplay 22500;
_number = parseNumber(ctrlText 22513);

if(!([str(_number)] call TON_fnc_isnumber)) exitWith {["Credit Mutuel", "Non conforme.", "danger", false] spawn ALF_fnc_doMsg;};

if(_number < 0) exitWith {["Credit Mutuel", "Ce nombre est negatif.", "danger", false] spawn ALF_fnc_doMsg;};
if(_number isEqualTo 0) exitWith {};
if(_number > 999999) exitWith {["Credit Mutuel", "Ce nombre est trop grand.", "danger", false] spawn ALF_fnc_doMsg;};
if(life_livreta < 0) exitWith {["Credit Mutuel", "Vos comptes sont actuellement bloqués. Merci de renflouer votre livret A.", "danger", false] spawn ALF_fnc_doMsg;};

switch (_mode) do {

	case 0 : {
		if (life_livreta < _number) exitWith {["Credit Mutuel", "Tu n'as pas cet argent sur ton Livret A.", "danger", false] spawn ALF_fnc_doMsg;};
		life_livreta = life_livreta - _number;
		life_cash = life_cash + _number;
		["Credit Mutuel", format["Tu as retire %1€ ton Livret A.",_number], "success", false] spawn ALF_fnc_doMsg;
		[name player,getPlayerUID player,"BANK",format["A retire %1€ de son Livret A. Livret A = %2€ | Cash = %3€",_number,life_livreta,life_cash]] remoteExec ["HC_fnc_logIt",HC3_Life];
		[0] spawn ALF_fnc_updateCompteBancaire;
		[0] call SOCK_fnc_updatePartial;
		[6] call SOCK_fnc_updatePartial;
	};

	case 1 : {
		if (life_livretb < _number) exitWith {["Credit Mutuel", "Tu n'as pas cet argent sur ton Livret B.", "danger", false] spawn ALF_fnc_doMsg;};
		life_livretb = life_livretb - _number;
		life_cash = life_cash + _number;
		["Credit Mutuel", format["Tu as retire %1€ ton Livret B.",_number], "success", false] spawn ALF_fnc_doMsg;
		[name player,getPlayerUID player,"BANK",format["A retire %1€ de son Livret B. Livret B = %2€ | Cash = %3€",_number,life_livretb,life_cash]] remoteExec ["HC_fnc_logIt",HC3_Life];
		[1] spawn ALF_fnc_updateCompteBancaire;
		[0] call SOCK_fnc_updatePartial;
		[7] call SOCK_fnc_updatePartial;
	};

	case 2 : {
		if (life_livretc < _number) exitWith {["Credit Mutuel", "Tu n'as pas cet argent sur ton Livret C.", "danger", false] spawn ALF_fnc_doMsg;};
		life_livretc = life_livretc - _number;
		life_cash = life_cash + _number;
		["Credit Mutuel", format["Tu as retire %1€ ton Livret C.",_number], "success", false] spawn ALF_fnc_doMsg;
		[name player,getPlayerUID player,"BANK",format["A retire %1€ de son Livret C. Livret C = %2€ | Cash = %3€",_number,life_livretc,life_cash]] remoteExec ["HC_fnc_logIt",HC3_Life];
		[2] spawn ALF_fnc_updateCompteBancaire;
		[0] call SOCK_fnc_updatePartial;
		[8] call SOCK_fnc_updatePartial;
	};

};
