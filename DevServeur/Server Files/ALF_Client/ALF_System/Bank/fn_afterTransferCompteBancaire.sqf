#include "\ALF_Client\script_macros.hpp"
/*
File: fn_afterTransferCompteBancaire.sqf
Author: ALF Team
Description: Suite du script

*/
private["_numacc","_uidcible","_mode","_number"];
_numacc = _this select 0;
_mode = _this select 1;
_number = _this select 2;

switch (_mode) do {
	case 0 : {
		life_livreta = life_livreta - _number;
		["Credit Mutuel", format["Tu as transfere %1€ de ton Livret A sur le compte numero %2.",_number,_numacc], "success", false] spawn ALF_fnc_doMsg;
		[0] spawn ALF_fnc_updateCompteBancaire;
		[6] call SOCK_fnc_updatePartial;
		[name player,getPlayerUID player,"BANK",format["A tranfere %1€ du Livret A vers le compte numero %2. Livret A = %3€",_number,_numacc,life_livreta]] remoteExec ["HC_fnc_logIt",HC3_Life];
	};

	case 1 : {
		life_livretb = life_livretb - _number;
		["Credit Mutuel", format["Tu as transfere %1€ de ton Livret B sur le compte numero %2.",_number,_numacc], "success", false] spawn ALF_fnc_doMsg;
		[1] spawn ALF_fnc_updateCompteBancaire;
		[7] call SOCK_fnc_updatePartial;
		[name player,getPlayerUID player,"BANK",format["A tranfere %1€ du Livret B vers le compte numero %2. Livret B = %3€",_number,_numacc,life_livretb]] remoteExec ["HC_fnc_logIt",HC3_Life];
	};

	case 2 : {
		life_livretc = life_livretc - _number;
		["Credit Mutuel", format["Tu as transfere %1€ de ton Livret C sur le compte numero %2.",_number,_numacc], "success", false] spawn ALF_fnc_doMsg;
		[2] spawn ALF_fnc_updateCompteBancaire;
		[8] call SOCK_fnc_updatePartial;
		[name player,getPlayerUID player,"BANK",format["A tranfere %1€ du Livret C vers le compte numero %2. Livret C = %3€",_number,_numacc,life_livretc]] remoteExec ["HC_fnc_logIt",HC3_Life];
	};
};


