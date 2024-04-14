#include "\ALF_Client\script_macros.hpp"
/*
File: fn_badTransferCompteBancaire.sqf
Author: ALF Team
Description: Reason

*/
private["_raison"];
_raison = _this select 0;

switch (_raison) do {
	case 0 : {
		["Crédit Mutuel","Le compte bancaire n'éxiste pas.", "danger", false] spawn ALF_fnc_doMsg;
	};
	case 1 : {
		["Crédit Mutuel","Tu ne peux pas te transferer de l'argent à toi même.", "danger", false] spawn ALF_fnc_doMsg;
	};
	case 2 : {
		["Crédit Mutuel","La cible n'a pas de Livret B.", "danger", false] spawn ALF_fnc_doMsg;
	};
	case 3 : {
		["Crédit Mutuel","La cible n'a pas de Livret C.", "danger", false] spawn ALF_fnc_doMsg;
	};
	case 4 : {
		["Crédit Mutuel","Tu envois trop d'argent.", "danger", false] spawn ALF_fnc_doMsg;
	};
	case 5 : {
		["Crédit Mutuel","Tu envois trop d'argent.", "danger", false] spawn ALF_fnc_doMsg;
	};
};
