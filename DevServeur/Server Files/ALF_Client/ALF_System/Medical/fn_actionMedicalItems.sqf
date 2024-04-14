#include "\ALF_Client\script_macros.hpp"
/*
Author: ALF Team
*/
private _item = _this select 0;
private _unit = _this select 1;

switch (_item) do {
	case 0 : {
		["ALF_Bandage",false] spawn life_fnc_handleItem;
		["ALF_Bandage",0] remoteExec ["ALF_fnc_medicalItems",_unit];
		["INFO", "Tu as bien appliqué le bandage.", "success"] spawn ALF_fnc_doMsg;
	};
	case 1 : {
		["ALF_Saline",false] spawn life_fnc_handleItem;
		["ALF_Saline",0] remoteExec ["ALF_fnc_medicalItems",_unit];
		["INFO", "Tu as bien appliqué la saline.", "success"] spawn ALF_fnc_doMsg;
	};
	case 2 : {
		["ALF_M_Oxy9L",false] spawn life_fnc_handleItem;
		["ALF_M_Oxy9L",0] remoteExec ["ALF_fnc_medicalItems",_unit];
		["INFO", "Le patient est sous oxygène.", "success"] spawn ALF_fnc_doMsg;
	};
	case 3 : {
		private _dose = ctrlText 18013;
		if(!([_dose] call TON_fnc_isnumber)) exitWith {hint "La dose n'est pas correcte.";};
		if((parseNumber _dose) > 10 OR {(parseNumber _dose) <= 0}) exitWith {hint "La dose n'est pas correcte.";};
		["ALF_Adrenaline",false] spawn life_fnc_handleItem;
		["ALF_Adrenaline",(parseNumber _dose)] remoteExec ["ALF_fnc_medicalItems",_unit];
		["INFO", "Tu as bien injecté l'adrénaline.", "success"] spawn ALF_fnc_doMsg;
	};
	case 4 : {
		private _dose = ctrlText 18013;
		if(!([_dose] call TON_fnc_isnumber)) exitWith {hint "La dose n'est pas correcte.";};
		if((parseNumber _dose) > 10 OR {(parseNumber _dose) <= 0}) exitWith {hint "La dose n'est pas correcte.";};
		["ALF_Atropine",false] spawn life_fnc_handleItem;
		["ALF_Atropine",(parseNumber _dose)] remoteExec ["ALF_fnc_medicalItems",_unit];
		["INFO", "Tu as bien injecté l'atropine.", "success"] spawn ALF_fnc_doMsg;
	};
	case 5 : {
		private _dose = ctrlText 18013;
		if(!([_dose] call TON_fnc_isnumber)) exitWith {hint "La dose n'est pas correcte.";};
		if((parseNumber _dose) > 10 OR {(parseNumber _dose) <= 0}) exitWith {hint "La dose n'est pas correcte.";};
		["ALF_Morphine",false] spawn life_fnc_handleItem;
		["ALF_Morphine",(parseNumber _dose)] remoteExec ["ALF_fnc_medicalItems",_unit];
		["INFO", "Tu as bien injecté la morphine.", "success"] spawn ALF_fnc_doMsg;
	};
	case 6 : {
		private _classnamepoche = "";
		{
			if (_x find "ALF_PocheDeSang_" > -1) exitWith {
				_classnamepoche = _x;
			};
		} forEach (magazines player);

		if (_classnamepoche isEqualTo "") exitwith {["INFO", "Erreur : tu n'as plus de poche de sang sur toi.", "danger"] spawn ALF_fnc_doMsg;};


		[_classnamepoche,false] spawn life_fnc_handleItem;
		[_classnamepoche,0] remoteExec ["ALF_fnc_medicalItems",_unit];
		["INFO", "Tu as bien appliqué la poche de sang.", "success"] spawn ALF_fnc_doMsg;
	};
};

closeDialog 0;