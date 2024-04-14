#include "\ALF_Client\script_macros.hpp"
/*
File: fn_transferExtCompteBancaire.sqf
Author: ALF Team
Description: Transferer de compte a compte externe

*/
private["_mode"];
_mode = _this select 0;

if((time - life_action_delay) < 1) exitWith {hint "Tu appuis trop vite.";};
life_action_delay = time;

disableSerialization;
_display = findDisplay 22500;
_number = parseNumber(ctrlText 22513);
_numacc = ctrlText 22514;

if(!([str(_number)] call TON_fnc_isnumber)) exitWith {["Crédit Mutuel", "Non conforme.", "danger", false] spawn ALF_fnc_doMsg;};
if !([_numacc] call TON_fnc_isnumber) exitWith {["Crédit Mutuel", "Numero de compte incorrect.", "danger", false] spawn ALF_fnc_doMsg;};

if(_number < 0) exitWith {["Crédit Mutuel", "Ce nombre est négatif.", "danger", false] spawn ALF_fnc_doMsg;};
if(_number > 999999) exitWith {["Crédit Mutuel", "Ce nombre est trop grand.", "danger", false] spawn ALF_fnc_doMsg;};

switch (_mode) do {

	case 0 : {
		if (life_livreta < _number) exitWith {["Crédit Mutuel", "Tu n'as pas assez de fond sur ton Livret A.", "danger", false] spawn ALF_fnc_doMsg;};
		[_numacc,0,player,_number,getPlayerUID player] remoteExecCall ["HC_fnc_transferExtCompteBancaire",HC_Life];
	};

	case 1 : {
		if (life_livretb < _number) exitWith {["Crédit Mutuel", "Tu n'as pas assez de fond sur ton Livret B.", "danger", false] spawn ALF_fnc_doMsg;};
		[_numacc,1,player,_number,getPlayerUID player] remoteExecCall ["HC_fnc_transferExtCompteBancaire",HC_Life];
	};

	case 2 : {
		if (life_livretc < _number) exitWith {["Crédit Mutuel", "Tu n'as pas assez de fond sur ton Livret C.", "danger", false] spawn ALF_fnc_doMsg;};
		[_numacc,2,player,_number,getPlayerUID player] remoteExecCall ["HC_fnc_transferExtCompteBancaire",HC_Life];	
	};

};
