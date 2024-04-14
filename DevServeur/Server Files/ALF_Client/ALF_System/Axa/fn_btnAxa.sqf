#include "\ALF_Client\script_macros.hpp"
/*
Author: ALF Team
*/
private _o = _this select 0;

switch (_o) do {
	case 0 : {
		private _action = ["Veux-tu résilier ton assurance? Cette opération désactivera l'assurance sur tous tes véhicules.","AXA","OUI","NON"] call BIS_fnc_guiMessage;
		if (!_action) exitWith {};
		[name player,getPlayerUID player,"ASSURANCE","A résilié toutes ses assurances."] remoteExec ["HC_fnc_logIt",HC3_Life];
		[0,getPlayerUID player,player] remoteExec ["HC_fnc_Axa",HC2_Life];
		life_axa = 0;
		life_axabank = 0;
		life_axacount = 0;
		life_axaprocount = 0;
	};
	case 1 : {
		if !(life_laactive) exitWith {["AXA","Tu n'as pas de livret A.","warning"] spawn ALF_fnc_doMsg;};
		private _p = 50;
		private _action = [format["Veux-tu acheter cette offre pour %1€. La somme sera prélevée sur ton livret A chaque jour. Frais de dossier: 150€.",_p],"AXA","OUI","NON"] call BIS_fnc_guiMessage;
		if (!_action) exitWith {};
		if(life_livreta < 150) exitWith {["AXA","Tu n'as pas assez sur ton livret A pour les frais de dossier.","warning"] spawn ALF_fnc_doMsg;};

		life_livreta = life_livreta - 150;
		[6] call SOCK_fnc_updatePartial;

		[name player,getPlayerUID player,"ASSURANCE","A souscrit a l'offre 1."] remoteExec ["HC_fnc_logIt",HC3_Life];
		[1,getPlayerUID player,player] remoteExec ["HC_fnc_Axa",HC2_Life];
		life_axa = 1;
	};
	case 2 : {
		if !(life_laactive) exitWith {["AXA","Tu n'as pas de livret A.","warning"] spawn ALF_fnc_doMsg;};
		private _p = 200;
		private _action = [format["Veux-tu acheter cette offre pour %1€. La somme sera prélevée sur ton livret A chaque jour. Frais de dossier: 300€.",_p],"AXA","OUI","NON"] call BIS_fnc_guiMessage;
		if (!_action) exitWith {};
		if(life_livreta < 300) exitWith {["AXA","Tu n'as pas assez sur ton livret A pour les frais de dossier.","warning"] spawn ALF_fnc_doMsg;};

		[name player,getPlayerUID player,"ASSURANCE","A souscrit a l'offre 2."] remoteExec ["HC_fnc_logIt",HC3_Life];
		life_livreta = life_livreta - 300;
		[6] call SOCK_fnc_updatePartial;

		[2,getPlayerUID player,player] remoteExec ["HC_fnc_Axa",HC2_Life];
		life_axa = 2;
	};
	case 3 : {
		if !(life_laactive) exitWith {["AXA","Tu n'as pas de livret A.","warning"] spawn ALF_fnc_doMsg;};
		private _p = 500;
		private _action = [format["Veux-tu acheter cette offre pour %1€. La somme sera prélevée sur ton livret A chaque jour. Frais de dossier: 700€.",_p],"AXA","OUI","NON"] call BIS_fnc_guiMessage;
		if (!_action) exitWith {};
		if(life_livreta < 700) exitWith {["AXA","Tu n'as pas assez sur ton livret A pour les frais de dossier.","warning"] spawn ALF_fnc_doMsg;};

		[name player,getPlayerUID player,"ASSURANCE","A souscrit a l'offre 3."] remoteExec ["HC_fnc_logIt",HC3_Life];
		life_livreta = life_livreta - 700;
		[6] call SOCK_fnc_updatePartial;

		[3,getPlayerUID player,player] remoteExec ["HC_fnc_Axa",HC2_Life];
		life_axa = 3;
	};
	case 4 : {
		if !(life_laactive) exitWith {["AXA","Tu n'as pas de livret A.","warning"] spawn ALF_fnc_doMsg;};
		if (life_axabank isEqualTo 0) exitWith {["AXA","Le prélèvement est déjà paramétré sur ce compte.","warning"] spawn ALF_fnc_doMsg;};
		[name player,getPlayerUID player,"ASSURANCE","A parametre le prelevement sur son livret A."] remoteExec ["HC_fnc_logIt",HC3_Life];
		[4,getPlayerUID player,player] remoteExec ["HC_fnc_Axa",HC2_Life];
		life_axabank = 0;
	};
	case 5 : {
		if !(life_lbactive) exitWith {["AXA","Tu n'as pas de livret B.","warning"] spawn ALF_fnc_doMsg;};
		if (life_axabank isEqualTo 1) exitWith {["AXA","Le prélèvement est déjà paramétré sur ce compte.","warning"] spawn ALF_fnc_doMsg;};
		[name player,getPlayerUID player,"ASSURANCE","A parametre le prelevement sur son livret B."] remoteExec ["HC_fnc_logIt",HC3_Life];
		[5,getPlayerUID player,player] remoteExec ["HC_fnc_Axa",HC2_Life];
		life_axabank = 1;
	};
	case 6 : {
		if !(life_lcactive) exitWith {["AXA","Tu n'as pas de livret C.","warning"] spawn ALF_fnc_doMsg;};
		if (life_axabank isEqualTo 2) exitWith {["AXA","Le prélèvement est déjà paramétré sur ce compte.","warning"] spawn ALF_fnc_doMsg;};
		[name player,getPlayerUID player,"ASSURANCE","A parametre le prelevement sur son livret C."] remoteExec ["HC_fnc_logIt",HC3_Life];
		[6,getPlayerUID player,player] remoteExec ["HC_fnc_Axa",HC2_Life];
		life_axabank = 2;
	};
	case 7 : {
		if !(life_laactive) exitWith {["AXA","Tu n'as pas de livret A.","warning"] spawn ALF_fnc_doMsg;};
		if !(life_donor) exitWith {["AXA","Tu ne peux pas selectionner cette offre.","warning"] spawn ALF_fnc_doMsg;};
		private _p = 1250;
		private _action = [format["Veux-tu acheter cette offre pour %1€. La somme sera prélevée sur ton livret A chaque jour. Frais de dossier: 2499€.",_p],"AXA","OUI","NON"] call BIS_fnc_guiMessage;
		if (!_action) exitWith {};
		if(life_livreta < 2499) exitWith {["AXA","Tu n'as pas assez sur ton livret A pour les frais de dossier.","warning"] spawn ALF_fnc_doMsg;};

		[name player,getPlayerUID player,"ASSURANCE","A souscrit a l'offre Donateur."] remoteExec ["HC_fnc_logIt",HC3_Life];
		life_livreta = life_livreta - 2499;
		[6] call SOCK_fnc_updatePartial;

		[7,getPlayerUID player,player] remoteExec ["HC_fnc_Axa",HC2_Life];
		life_axa = 4;
	};
};

[] call ALF_fnc_menuAxa;
