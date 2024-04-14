#include "\ALF_Client\script_macros.hpp"
/*
File: initBusinessPlayer.sqf
Author: ALF Dev Team
*/
params [
	["_mode",0,[0]],
	["_secteur",0,[0]],
	["_siret","",[""]],
	["_members",[],[[]]]
];

switch (_mode) do {
	case 0 : {
		switch (_secteur) do {
			case 0 : {
				b_0 = true; //DEFAUT
			};
			case 1 : {
				b_1 = true; //OCCAZ EXPRESS
			};
			case 2 : {
				b_2 = true; //LUX BAR
			};
			case 3 : {
				b_3 = true; //VIGNE ZARBI
			};
			case 4 : {
				b_4 = true; //Helios
			};
			case 5 : {
				b_5 = true; //Location
			};
			case 6 : {
				b_6 = true; //BIEM Secu
			};
			case 7 : {
				b_7 = true; //Armurerie
			};
			case 8 : {
				b_8 = true; //ALF INFO
			};
			case 9 : {
				b_9 = true; //KS Costume
			};
			case 10 : {
				b_10 = true; //Planche
			};
			case 11 : {
				b_11 = true; //TAXI&BUS
			};
			case 12 : {
				b_12 = true; //Petrole
			};
			case 13 : {
				b_13 = true; //Prefecture
			};
			case 14 : {
				b_14 = true; //Entreprise Diamant
			};
			case 15 : {
				b_15 = true; //DSAC AERIEN
			};
			case 16 : {
				b_16 = true; //KARTING
			};
			case 17 : {
				b_17 = true; //Saphir
			};
			case 18 : {
				b_18 = true; //DIR
			};
			case 19 : {
				b_19 = true; //BIE
			};
			case 20 : {
				b_20 = true; //Casino
			};
			case 21 : {
				b_21 = true; //Tobacco
			};
			case 22 : {
				b_22 = true; //Ferry Martinez
			};
			case 23 : {
				b_23 = true; //Tribunal
			};
			case 24 : {
				b_24 = true; //Convoi Fond
			};
			case 25 : {
				b_25 = true; //Patisserie
			};
			case 26 : {
				b_26 = true; //Whisky
			};
			case 27 : {
				b_27 = true; //Cidre
			};
			case 28 : {
				b_28 = true; //Libre
			};
		};
		player setVariable ["isEmployed",_siret];

		private _arr = missionNamespace getVariable [format["%1_KEYSB",_siret],[]];
		{life_vehicles pushBack _x} forEach _arr;
		
		{if((_x select 1) isEqualTo (getPlayerUID player)) then {alf_b_level = (_x select 2)}} forEach _members;
	};
	case 1 : {
		switch (_secteur) do {
			case 0 : {
				b_0 = false;
			};
			case 1 : {
				b_1 = false;
			};
			case 2 : {
				b_2 = false;
			};
			case 3 : {
				b_3 = false;
			};
			case 4 : {
				b_4 = false;
			};
			case 5 : {
				b_5 = false;
			};
			case 6 : {
				b_6 = false;
			};
			case 7 : {
				b_7 = false;
			};
			case 8 : {
				b_8 = false;
			};
			case 9 : {
				b_9 = false;
			};
			case 10 : {
				b_10 = false;
			};
			case 11 : {
				b_11 = false;
			};
			case 12 : {
				b_12 = false;
			};
			case 13 : {
				b_13 = false;
			};
			case 14 : {
				b_14 = false;
			};
			case 15 : {
				b_15 = false;
			};
			case 16 : {
				b_16 = false;
			};
			case 17 : {
				b_17 = false;
			};
			case 18 : {
				b_18 = false;
			};
			case 19 : {
				b_19 = false;
			};
			case 20 : {
				b_20 = false;
			};
			case 21 : {
				b_21 = false;
			};
			case 22 : {
				b_22 = false;
			};
			case 23 : {
				b_23 = false;
			};
			case 24 : {
				b_24 = false;
			};
			case 25 : {
				b_25 = false;
			};
		};
		player setVariable ["isEmployed",""];
		["INFO","Tu as été viré par ton employeur.","warning"] spawn ALF_fnc_doMsg;
	};

	//Demande si employer ou pas
	case 2: {
		missionNamespace setVariable ["ALF_DemandeEmployee",(!(player getVariable ["isEmployed",""] isEqualTo "")),remoteExecutedOwner];
	};
};
