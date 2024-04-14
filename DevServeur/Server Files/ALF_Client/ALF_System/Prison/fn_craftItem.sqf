#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_craftItem.sqf
	Author: ALF Team
*/
private _mode = _this select 0;
if(isNil "_mode") exitWith {};

switch (_mode) do {
	case 0 : {
		["ALF_Sonnette4G",false] call life_fnc_handleItem;
		["ALF_3310",false] call life_fnc_handleItem;
		for "_i" from 1 to 2 do {
			["ALF_Vodka",false] call life_fnc_handleItem;
		};

		["ALF_C4_Artisanal",true] call life_fnc_handleItem;
		["CRAFT","Tu viens de crafter un C4 artisanal !","success"] spawn ALF_fnc_doMsg;
	};
	case 1 : {
		["ALF_pierre_small",false] call life_fnc_handleItem;
		for "_i" from 1 to 2 do {
			["ALF_BaconT",false] call life_fnc_handleItem;
		};
		for "_i" from 1 to 2 do {
			["ALF_WaterB_G",false] call life_fnc_handleItem;
		};
		["ALF_Fer",false] call life_fnc_handleItem;
		["ALF_ZipCutterP",true] call life_fnc_handleItem;
		["CRAFT","Tu viens de crafter un ciseau INOX !","success"] spawn ALF_fnc_doMsg;
	};
	case 2 : {
		for "_i" from 1 to 5 do {
			["ALF_Banane",false] call life_fnc_handleItem;
		};
		for "_i" from 1 to 3 do {
			["ALF_Pomme",false] call life_fnc_handleItem;
		};
		["ALF_WaterB_G",false] call life_fnc_handleItem;
		["ALF_Vodka",true] call life_fnc_handleItem;
		["CRAFT","Tu viens de crafter une bouteille de Vodka !","success"] spawn ALF_fnc_doMsg;
	};
	case 3 : {
		["ALF_pierre_small",false] call life_fnc_handleItem;
		for "_i" from 1 to 3 do {
			["ALF_Buche",false] call life_fnc_handleItem;
		};
		["ALF_Batte",true] call life_fnc_handleItem;
		["CRAFT","Tu viens de crafter une batte !","success"] spawn ALF_fnc_doMsg;
	};
	case 4 : {
		["ALF_pierre_small",false] call life_fnc_handleItem;
		["ALF_Fer",false] call life_fnc_handleItem;
		for "_i" from 1 to 5 do {
			["ALF_BaconT",false] call life_fnc_handleItem;
		};

		["ALF_Couteau",true] call life_fnc_handleItem;
		["CRAFT","Tu viens de crafter un couteau !","success"] spawn ALF_fnc_doMsg;
	};
	case 5 : {
		["ALF_Cocaine",false] call life_fnc_handleItem;
		for "_i" from 1 to 2 do {
			["ALF_Banane",false] call life_fnc_handleItem;
		};
		
		for "_i" from 1 to 2 do {
			["ALF_Cocaine_2",true] call life_fnc_handleItem;
		};
		["CRAFT","Tu viens de crafter de la cocaine coupé !","success"] spawn ALF_fnc_doMsg;
	};
	case 6 : {
		/*
		["ALF_Pioche",false] call life_fnc_handleItem;
		["ALF_Peche",false] call life_fnc_handleItem;
		for "_i" from 1 to 2 do {
			["ALF_Banane",false] call life_fnc_handleItem;
		};
		for "_i" from 1 to 2 do {
			["ALF_BaconT",false] call life_fnc_handleItem;
		};

		["KA_crossbow_vodka",true] call life_fnc_handleItem;
		["CRAFT","Tu viens de crafter une pioche customisé !","success"] spawn ALF_fnc_doMsg;
		*/
	};
	case 7 : {
		for "_i" from 1 to 2 do {
			["ALF_Cuivre",false] call life_fnc_handleItem;
		};
		for "_i" from 1 to 4 do {
			["ALF_coca",false] call life_fnc_handleItem;
		};
		["ALF_Locker_Artisanal",true] call life_fnc_handleItem;
		["CRAFT","Tu viens de crafter un cadenas artisanal !","success"] spawn ALF_fnc_doMsg;
	};
	case 8 : {
		for "_i" from 1 to 2 do {
			["ALF_Cuivre",false] call life_fnc_handleItem;
		};
		for "_i" from 1 to 4 do {
			["ALF_coca",false] call life_fnc_handleItem;
		};
		["ALF_3310",false] call life_fnc_handleItem;
		for "_i" from 1 to 2 do {
			["ALF_Vodka",false] call life_fnc_handleItem;
		};

		["ALF_LockerC4_Artisanal",true] call life_fnc_handleItem;
		["CRAFT","Tu viens de crafter un piege artisanal !","success"] spawn ALF_fnc_doMsg;
	};
	case 8 : {
		for "_i" from 1 to 2 do {
			["ALF_Cuivre",false] call life_fnc_handleItem;
		};
		for "_i" from 1 to 4 do {
			["ALF_coca",false] call life_fnc_handleItem;
		};
		["ALF_3310",false] call life_fnc_handleItem;
		for "_i" from 1 to 2 do {
			["ALF_Vodka",false] call life_fnc_handleItem;
		};

		["ALF_LockerC4_Artisanal",true] call life_fnc_handleItem;
		["CRAFT","Tu viens de crafter un piege artisanal !","success"] spawn ALF_fnc_doMsg;
	};
	case 9 : {
		for "_i" from 1 to 3 do {
			["ALF_Pomme",false] call life_fnc_handleItem;
		};
		["ALF_Mais",false] call life_fnc_handleItem;

		["ALF_Tarte_Pomme",true] call life_fnc_handleItem;
		["BOULANGERIE","Tu viens de faire une tarte aux pommes artisanale !","success"] spawn ALF_fnc_doMsg;
	};
	case 10 : {
		for "_i" from 1 to 3 do {
			["ALF_Fraise",false] call life_fnc_handleItem;
		};
		["ALF_Mais",false] call life_fnc_handleItem;

		["ALF_Tarte_Fraise",true] call life_fnc_handleItem;
		["BOULANGERIE","Tu viens de faire une tarte aux fraises artisanale !","success"] spawn ALF_fnc_doMsg;
	};
	case 11 : {
		for "_i" from 1 to 4 do {
			["ALF_Pomme",false] call life_fnc_handleItem;
		};

		["ALF_Confiture_Pomme",true] call life_fnc_handleItem;
		["BOULANGERIE","Tu viens de faire une confiture de pommes artisanale !","success"] spawn ALF_fnc_doMsg;
	};
	case 12 : {
		for "_i" from 1 to 4 do {
			["ALF_Fraise",false] call life_fnc_handleItem;
		};

		["ALF_Confiture_Fraise",true] call life_fnc_handleItem;
		["BOULANGERIE","Tu viens de faire une confiture de fraises artisanale !","success"] spawn ALF_fnc_doMsg;
	};
};
