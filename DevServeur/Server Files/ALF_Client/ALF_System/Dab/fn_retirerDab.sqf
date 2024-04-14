#include "\ALF_Client\script_macros.hpp"
/*
File: fn_retirerDab.sqf
Author: ALF Team
*/
if((time - life_action_delay) < 0.3) exitWith {["Distributeur", "Tu appuis trop vite.", "warning"] spawn ALF_fnc_doMsg;};
life_action_delay = time;
disableSerialization;

private _number = parseNumber(ctrlText 10526);

if(!([str(_number)] call TON_fnc_isnumber)) exitWith {["Distributeur", "Non conforme.", "danger"] spawn ALF_fnc_doMsg;};
if(_number < 1) exitWith {["Distributeur", "Ce nombre est incorret.", "danger"] spawn ALF_fnc_doMsg;};
if(_number > 50000) exitWith {["Distributeur", "Ce nombre est trop grand.", "danger"] spawn ALF_fnc_doMsg;};
if(life_livreta < 0) exitWith {["Credit Mutuel", "Vos comptes sont actuellement bloqués. Merci de renflouer votre livret A.", "danger", false] spawn ALF_fnc_doMsg;};

private _exit = false;
switch (life_activecb) do {
	case 1 : {
		if (life_livreta < _number) exitWith {["Distributeur", "Tu n'as pas cet argent sur ton Livret A.", "danger"] spawn ALF_fnc_doMsg; _exit = true;};
		life_livreta = life_livreta - _number;
		life_cash = life_cash + _number;
		["Distributeur", format["Tu as retire %1€ de ton Livret A.",_number], "success"] spawn ALF_fnc_doMsg;
		[name player,getPlayerUID player,"BANK",format["A retire %1€ de son Livret A. Livret A = %2€ | Cash = %3€",_number,life_livreta,life_cash]] remoteExec ["HC_fnc_logIt",HC3_Life];
		[] spawn {
			life_query_time = time;
			if !(alf_moneysave) then {
				alf_moneysave = true;
				waitUntil {sleep 0.3; (time - life_query_time) >= 5};
				[6] call SOCK_fnc_updatePartial;
				[0] call SOCK_fnc_updatePartial;
				alf_moneysave = false;
			};
		};
	};
	case 2 : {
		if (life_livretb < _number) exitWith {["Distributeur", "Tu n'as pas cet argent sur ton Livret B.", "danger"] spawn ALF_fnc_doMsg; _exit = true;};
		if(life_livreta < 0) exitWith {["Credit Mutuel", "Vos comptes sont actuellement bloqués. Merci de renflouer votre livret A.", "danger", false] spawn ALF_fnc_doMsg; _exit = true;};
		life_livretb = life_livretb - _number;
		life_cash = life_cash + _number;
		["Distributeur", format["Tu as retire %1€ de ton Livret B.",_number], "success"] spawn ALF_fnc_doMsg;
		[name player,getPlayerUID player,"BANK",format["A retire %1€ de son Livret B. Livret B = %2€ | Cash = %3€",_number,life_livretb,life_cash]] remoteExec ["HC_fnc_logIt",HC3_Life];
		[] spawn {
			life_query_time = time;
			if !(alf_moneysave) then {
				alf_moneysave = true;
				waitUntil {sleep 0.3; (time - life_query_time) >= 5};
				[7] call SOCK_fnc_updatePartial;
				[0] call SOCK_fnc_updatePartial;
				alf_moneysave = false;
			};
		};
	};
	case 3 : {
		if (life_livretc < _number) exitWith {["Distributeur", "Tu n'as pas cet argent sur ton Livret C.", "danger"] spawn ALF_fnc_doMsg; _exit = true;};
		if(life_livreta < 0) exitWith {["Credit Mutuel", "Vos comptes sont actuellement bloqués. Merci de renflouer votre livret A.", "danger", false] spawn ALF_fnc_doMsg; _exit = true;};
		life_livretc = life_livretc - _number;
		life_cash = life_cash + _number;
		["Distributeur", format["Tu as retire %1€ de ton Livret C.",_number], "success"] spawn ALF_fnc_doMsg;
		[name player,getPlayerUID player,"BANK",format["A retire %1€ de son Livret C. Livret C = %2€ | Cash = %3€",_number,life_livretc,life_cash]] remoteExec ["HC_fnc_logIt",HC3_Life];
		[] spawn {
			life_query_time = time;
			if !(alf_moneysave) then {
				alf_moneysave = true;
				waitUntil {sleep 0.3; (time - life_query_time) >= 5};
				[8] call SOCK_fnc_updatePartial;
				[0] call SOCK_fnc_updatePartial;
				alf_moneysave = false;
			};
		};
	};
};
if(_exit) exitWith {};

[] call ALF_fnc_updateDab;
