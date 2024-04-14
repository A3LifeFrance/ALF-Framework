#include "\ALF_Client\script_macros.hpp"
/*
File: fn_deposerCompteBancaire.sqf
Author: ALF Team
Description: Deposer du compte bancaire

*/
private["_mode"];
_mode = _this select 0;

if((time - life_action_delay) < 1) exitWith {hint "Tu appuis trop vite.";};
life_action_delay = time;

disableSerialization;
_display = findDisplay 22500;
_number = parseNumber(ctrlText 22513);

if(!([str(_number)] call TON_fnc_isnumber)) exitWith {["Credit Mutuel", "Non conforme.", "danger", false] spawn ALF_fnc_doMsg;};
if (life_cash < _number) exitWith {["Credit Mutuel", "Tu n'as pas cet argent sur toi.", "danger", false] spawn ALF_fnc_doMsg;};

if(_number < 0) exitWith {["Credit Mutuel", "Ce nombre est negatif.", "danger", false] spawn ALF_fnc_doMsg;};
if(_number isEqualTo 0) exitWith {};
if(_number > 999999) exitWith {["Credit Mutuel", "Ce nombre est trop grand.", "danger", false] spawn ALF_fnc_doMsg;};

switch (_mode) do {

	case 0 : {
		if ((life_livreta + _number) > 75000) exitWith {["Credit Mutuel", "Tu ne peux pas deposer plus de 75.000€ sur ton Livret A.", "danger", false] spawn ALF_fnc_doMsg;};
		life_livreta = life_livreta + _number;
		life_cash = life_cash - _number;
		["Credit Mutuel", format["Tu as depose %1€ sur ton Livret A.",_number], "success", false] spawn ALF_fnc_doMsg;
		[name player,getPlayerUID player,"BANK",format["A depose %1€ sur son Livret A. Livret A = %2€ | Cash = %3€",_number,life_livreta,life_cash]] remoteExec ["HC_fnc_logIt",HC3_Life];
		[0] spawn ALF_fnc_updateCompteBancaire;

		[] spawn {
			life_query_time = time;
			if !(alf_moneysave) then {
				alf_moneysave = true;
				waitUntil {sleep 0.3; (time - life_query_time) >= 5};
				[0] call SOCK_fnc_updatePartial;
				[6] call SOCK_fnc_updatePartial;
				alf_moneysave = false;
			};
		};
	};

	case 1 : {
		if ((life_livretb + _number) > 500000) exitWith {["Credit Mutuel", "Tu ne peux pas deposer plus de 500.000€ sur ton Livret B.", "danger", false] spawn ALF_fnc_doMsg;};
		if(life_livreta < 0) exitWith {["Credit Mutuel", "Vos comptes sont actuellement bloqués. Merci de renflouer votre livret A.", "danger", false] spawn ALF_fnc_doMsg;};
		life_livretb = life_livretb + _number;
		life_cash = life_cash - _number;
		["Credit Mutuel", format["Tu as depose %1€ sur ton Livret B.",_number], "success", false] spawn ALF_fnc_doMsg;
		[name player,getPlayerUID player,"BANK",format["A depose %1€ sur son Livret B. Livret B = %2€ | Cash = %3€",_number,life_livretb,life_cash]] remoteExec ["HC_fnc_logIt",HC3_Life];
		[1] spawn ALF_fnc_updateCompteBancaire;
		
		[] spawn {
			life_query_time = time;
			if !(alf_moneysave) then {
				alf_moneysave = true;
				waitUntil {sleep 0.3; (time - life_query_time) >= 5};
				[0] call SOCK_fnc_updatePartial;
				[7] call SOCK_fnc_updatePartial;
				alf_moneysave = false;
			};
		};
	};

	case 2 : {
		if(life_livreta < 0) exitWith {["Credit Mutuel", "Vos comptes sont actuellement bloqués. Merci de renflouer votre livret A.", "danger", false] spawn ALF_fnc_doMsg;};
		life_livretc = life_livretc + _number;
		life_cash = life_cash - _number;
		["Credit Mutuel", format["Tu as depose %1€ sur ton Livret C.",_number], "success", false] spawn ALF_fnc_doMsg;
		[name player,getPlayerUID player,"BANK",format["A depose %1€ sur son Livret C. Livret C = %2€ | Cash = %3€",_number,life_livretc,life_cash]] remoteExec ["HC_fnc_logIt",HC3_Life];
		[2] spawn ALF_fnc_updateCompteBancaire;

		[] spawn {
			life_query_time = time;
			if !(alf_moneysave) then {
				alf_moneysave = true;
				waitUntil {sleep 0.3; (time - life_query_time) >= 5};
				[0] call SOCK_fnc_updatePartial;
				[8] call SOCK_fnc_updatePartial;
				alf_moneysave = false;
			};
		};
	};

};
