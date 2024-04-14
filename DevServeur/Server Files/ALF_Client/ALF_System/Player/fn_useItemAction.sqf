#include "\ALF_Client\script_macros.hpp"
/*
File: fn_useItemAction.sqf
Author: ALF Team
*/

private _item = lbData [(ctrlIDC (_this select 0)), (_this select 1)];

switch (true) do {
	/************************************** ITEMS BOIRE/MANGER *************************************/
	case (_item in ["ALF_snickers","ALF_Pain","ALF_Banane","ALF_Peche","ALF_Pomme","ALF_Bonbon","ALF_Croissant","ALF_Huitre","ALF_Fraise","ALF_Champignon","ALF_Raisin"]): {
		closeDialog 602;
		_val = round(random(5)) + 9;
		_sum = life_hunger + _val;
		if(_sum > 100) then {_sum = 100; player setFatigue 1;};
		[_sum,300] spawn ALF_fnc_remonterFaim;
		[_item,false] spawn life_fnc_handleItem;
	};
	case (_item in ["ALF_XxX", "ALF_coca","ALF_Jus","ALF_WaterB_P","ALF_Macchiato","ALF_Expresso","ALF_Viennois","ALF_Cappuccino"]): {
		closeDialog 602;
		_val = round(random(80)) + 25;
		_sum = life_thirst + _val;
		if(_sum > 100) then {_sum = 100;};
		[_sum,300] spawn ALF_fnc_remonterSoif;
		[_item,false] spawn life_fnc_handleItem;
	};
	case (_item isEqualTo "ALF_WaterB_G"): {
		closeDialog 602;
		[100,300] spawn ALF_fnc_remonterSoif;
		[_item,false] spawn life_fnc_handleItem;
	};
	case (_item in ["ALF_Vin","ALF_Pinot","ALF_Vodka","ALF_Jack","ALF_Whisky","ALF_Rome","ALF_Malibu","ALF_Luxe2","ALF_Luxe1","ALF_Jock","ALF_Jager","ALF_Horse","ALF_1664","ALF_51","ALF_Sky","ALF_Vazisi","ALF_Smirnoff"]): {
		closeDialog 602;
		_val = random(1) + 0.05;
		[35,300] spawn ALF_fnc_remonterSoif;
		[_val] call ALF_fnc_handleAlcool;
		[_item,false] spawn life_fnc_handleItem;
	};
	
	case (_item in ["ALF_Weed","ALF_Weed_2","ALF_Weed_3","ALF_Cocaine","ALF_Cocaine_2","ALF_Meth50","ALF_Meth90"]): {
		closeDialog 602;
		_val = random(1) + 0.1;
		[_val] call ALF_fnc_handleDrug;
		[_item,false] spawn life_fnc_handleItem;
	};
	
	/*
	case (_item in ["ALF_XxX"]): {
		closeDialog 602;
		_val = round(random(20)) + 25;
		_sum = life_thirst + _val;
		if(_sum > 100) then {_sum = 100;};
		[_sum,300] spawn ALF_fnc_remonterSoif;
		[_item,false] spawn life_fnc_handleItem;
		[] spawn {
			_time = time;
			player enableFatigue false;
			waitUntil {!alive player || ((time - _time) > (3 * 60))};
			player enableFatigue true;
		};
	};
	*/
	case (_item in ["ALF_Saucisse_Crue_M","ALF_CotePorc_Crue_M","ALF_Poulet_Crue_M","ALF_Bacon_Crue_M","ALF_Maquereau_Crue_M","ALF_Confiture_Fraise","ALF_Confiture_Pomme"/*,"ALF_Sardine","ALF_Thon","ALF_Barbeau","ALF_Brochet","ALF_Anguille","ALF_Tortue","ALF_Saumon","ALF_Squale"*/]): {
		closeDialog 602;
		[_item] spawn ALF_fnc_poseViande;
	};
	case (_item isEqualTo "ALF_CotePorc_Cuite_M"): {
		closeDialog 602;
		_val = round(random(25)) + 75;
		_sum = life_hunger + _val;
		if(_sum > 100) then {_sum = 100; player setFatigue 1;};
		[_sum,300] spawn ALF_fnc_remonterFaim;
		[_item,false] spawn life_fnc_handleItem;
	};
	case (_item isEqualTo "ALF_Poulet_Cuit_M"): {
		closeDialog 602;
		_val = round(random(15)) + 35;
		_sum = life_hunger + _val;
		if(_sum > 100) then {_sum = 100; player setFatigue 1;};
		[_sum,300] spawn ALF_fnc_remonterFaim;
		[_item,false] spawn life_fnc_handleItem;
	};
	case (_item in ["ALF_Saucisse_Cuite_M","ALF_CotePorc_Brulee_M","ALF_Bacon_Cuit_M","ALF_Maquereau_Cuit_M","ALF_Tarte_Pomme","ALF_Tarte_Fraise","ALF_Confiture_Pomme","ALF_Confiture_Fraise","ALF_BakedBeans","ALF_BaconT","ALF_Kebab"]): {
		closeDialog 602;
		_val = round(random(15)) + 20;
		_sum = life_hunger + _val;
		if(_sum > 100) then {_sum = 100; player setFatigue 1;};
		[_sum,300] spawn ALF_fnc_remonterFaim;
		[_item,false] spawn life_fnc_handleItem;
	};
	case (_item in ["ALF_Saucisse_Brulee_M","ALF_Poulet_Brulee_M","ALF_Bacon_Brulee_M","ALF_Maquereau_Brulee_M"]): {
		closeDialog 602;
		_val = round(random(10)) + 15;
		_sum = life_hunger + _val;
		if(_sum > 100) then {_sum = 100; player setFatigue 1;};
		[_sum,300] spawn ALF_fnc_remonterFaim;
		[_item,false] spawn life_fnc_handleItem;
	};
	/************************************** MEDICAL ***********************************************/
	case (_item in ["ALF_Medoc_rhume","ALF_Medoc_toux"]): {
		closeDialog 602;
		[_item,true] spawn ALF_fnc_handleMedecine;
	};
	/************************************** TAILLEUSE ***********************************************/
	case (_item isEqualTo "ALF_Pierre_dia_small"): {
		if((typeOf cursorObject) isEqualTo "Land_tailleuse" && {(player distance cursorObject) < 3} /*&& {alf_niv_minage > 7}*/) then {
			if(!isNull (findDisplay 602)) then {closeDialog 602};
			[player,cursorObject,"ALF_Pierre_dia_small","ALF_diamant_taille"] remoteExec ["HC_fnc_systemeDiamant",HC3_Life];
		} else { ["Info", "Tu ne peux pas utiliser cet item ici.", "warning", false] spawn ALF_fnc_doMsg; };
	};
	case (_item isEqualTo "ALF_diamant_taille"): {
		if(b_14 && {(typeOf cursorObject) isEqualTo "Land_tailleuse"} && {(player distance cursorObject) < 3} /*&& {alf_niv_minage > 7}*/) then {
			if(!isNull (findDisplay 602)) then {closeDialog 602};
			[player,cursorObject,"ALF_diamant_taille","ALF_diamant_precieux"] remoteExec ["HC_fnc_systemeDiamant",HC3_Life];
		} else { ["Info", "Tu ne peux pas utiliser cet item ici.", "warning", false] spawn ALF_fnc_doMsg; };
	};
	case (_item isEqualTo "ALF_saphir_small"): {
		if((((str cursorObject) find "saphir_traitement_") > -1) && {(player distance cursorObject) < 3} /*&& {alf_niv_minage > 4}*/) then {
			if(!isNull (findDisplay 602)) then {closeDialog 602};
			[player,cursorObject] remoteExec ["HC_fnc_systemeSaphir",HC3_Life];
		} else { ["Info", "Tu ne peux pas utiliser cet item ici.", "warning", false] spawn ALF_fnc_doMsg; };
	};
	/************************************** Mobilier ***********************************************/
	case (_item in ALF_Mobiliers_Items): {
		closeDialog 602;
		if (_item isEqualTo "ALF_Coco_boite") then {
			[_item] spawn life_fnc_placeDrugSystem;
		} else {
			[_item] spawn life_fnc_mobilierSystem;
		};
	};
	/************************************** Entreprise *********************************************/
	/*
	case (_item isEqualTo "murshun_cigs_cig0" && {b_21}): {
		if ( ({_x isEqualTo "murshun_cigs_cig0"} count (magazines player)) >= 20) then {
			closeDialog 602;

			for "_i" from 1 to 20 do {
				["murshun_cigs_cig0",false] spawn life_fnc_handleItem;
			};
			["murshun_cigs_cigpack",true] call life_fnc_handleItem;
		};
	};
	case (_item isEqualTo "murshun_cigs_cigpack"): {
		[player] spawn murshun_cigs_fnc_take_cig_from_pack;
	};
	*/
	/**************************************** Illegal **********************************************/
	case (_item isEqualTo "ALF_Blue"): {
		closeDialog 602;
		createDialog "ALF_Blue_Print";
	};
	case (_item isEqualTo "ALF_Parchemin"): {
		closeDialog 602;
		createDialog "ALF_Parchemin_Ouvert";
	};
	case (_item isEqualTo "ALF_Lockpick"): {
		closeDialog 602;
		if(cursorObject isKindOf "House_F") then {
			[cursorObject,1] spawn life_fnc_copBreakDoor;
		} else {
			if(cursorObject in [alf_coffre_prison_1,alf_coffre_prison_2,alf_coffre_prison_3,alf_coffre_prison_4,alf_coffre_prison_5,alf_coffre_prison_6,alf_coffre_prison_7,alf_coffre_prison_8,alf_coffre_prison_9,alf_coffre_prison_10,alf_coffre_prison_11,alf_coffre_prison_12,alf_coffre_prison_13,alf_coffre_prison_14,alf_coffre_prison_15,alf_coffre_prison_16,alf_coffre_prison_17,alf_coffre_prison_18,alf_coffre_prison_19,alf_coffre_prison_20] && {((cursorObject animationSourcePhase "safe_source") < 0.5) OR {(cursorObject animationSourcePhase "piege_source") < 0.5}}) then {
				if((cursorObject animationSourcePhase "safe_source") < 0.5) then {
					[cursorObject,1] remoteExec ["HC_fnc_customCoffre",HC_Life];
				} else {
					[cursorObject,3] remoteExec ["HC_fnc_customCoffre",HC_Life];
				};
				["ALF_Lockpick",false] call life_fnc_handleItem;
			} else {
				["Info", "Tu ne peux pas utiliser cet item ici.", "warning", false] spawn ALF_fnc_doMsg;
			};
		};
	};
	case (_item in ["ALF_Pc_Traceur"]): {
		closeDialog 602;
		[0] spawn ALF_fnc_menuInspectTel;
	};
	/************************************** Gendarmerie ********************************************/
	case (_item isEqualTo "ALF_Herse_i"): {
		closeDialog 602;
		[_item] spawn life_fnc_spikeStrip;
	};
	case (_item isEqualTo "ALF_Radar_m_i"): {
		closeDialog 602;
		[_item] spawn ALF_fnc_placeRadarM;
	};
	case (_item isEqualTo "ALF_Camera_Discret"): {
		closeDialog 602;
		[cursortarget] spawn ALF_fnc_placeCam;
	};
	case (_item in ["ALF_PortableLight_double","ALF_BagFence_Long","ALF_BagFence_Round","ALF_PortableLight_single","ALF_Triangle_Item","ALF_Barricades_Item","ALF_Bloc_route_Item","ALF_Route_barree_Item","ALF_Route_barree_100_Item","ALF_Route_barree_200_Item","ALF_Route_barree_300_Item","ALF_Route_barree_400_Item","ALF_Route_barree_500_Item","ALF_Route_barree_600_Item","ALF_Route_barree_700_Item","ALF_Route_barree_800_Item","ALF_Route_barree_900_Item","ALF_30_Item","ALF_50_Item","ALF_Triflash_Item","ALF_Tente_1_Item","ALF_Table_Palais","ALF_P_devi_d","ALF_P_devi_g","ALF_P_halte","ALF_Camping_Chair_Item","ALF_Rideaux_Item","ALF_DonDuSang_Chair_Item","ALF_Poubelle_Medic_Item","ALF_Table_Soin_Item","ALF_Tente_Medic_Item","ALF_Chevalet"]): {
		closeDialog 602;
		[_item] spawn ALF_fnc_Object_deploy;
	};
	case (_item isEqualTo "ALF_bbq_M"): {
		closeDialog 602;
		[_item] spawn ALF_fnc_poserBBQ;
	};
	case (_item isEqualTo "ALF_Charge_C2_M" && {license_GIGN}): {
		closeDialog 602;
		[_item] call ALF_fnc_poserChargePorte;
	};
	case (_item isEqualTo "ALF_Perceuse_GDM_M"): {
		closeDialog 602;
		[_item] call ALF_fnc_poserPerceuse;
	};
	case (_item isEqualTo "ALF_laptop_unfolded_f"): {
		closeDialog 602;
		if(life_gendarme_service && {(typeOf cursorObject) isEqualTo "Land_ALF_ATM"} && {player distance cursorObject < 3} && {license_TIC}) then {
			[cursorObject] spawn ALF_fnc_laptopMenu;
		} else {
			["Info", "Tu ne peux pas utiliser cet item.", "warning", false] spawn ALF_fnc_doMsg;
		};
	};
	/******************************************** FARMING ******************************************/
	case (_item isEqualTo "ALF_Graine_M"): {
		closeDialog 602;
		[_item] spawn ALF_fnc_planterMais;
	};
	case (_item isEqualTo "ALF_Graine_T"): {
		closeDialog 602;
		[_item] spawn ALF_fnc_planterTabac;
	};
	/******************************************** VEHICULES ****************************************/
	case (_item in ["ALF_Barile_10","ALF_Barile_20","ALF_Barile_30","ALF_Barile_40","ALF_Barile_50","ALF_Barile_60","ALF_Barile_70","ALF_Barile_80","ALF_Barile_90","ALF_Barile_100"]): {
		closeDialog 602;
		[_item] spawn ALF_fnc_refuelCar;
	};
	case (_item isEqualTo "ALF_Barile_0"): {
		closeDialog 602;
		[_item] spawn ALF_fnc_siphonageVehicles;
	};

	/******************************************** TEMPLE ******************************************/
	case (_item isEqualTo "ALF_Relique_1"): {
		closeDialog 602;
		if((typeOf cursorObject) in ["Land_ALF_Anubis_01"] && {player distance cursorObject < 2}) then {
			[cursorObject,1] spawn ALF_fnc_Anubis;
		} else {
			["Info", "Tu ne peux pas utiliser cet item.", "warning", false] spawn ALF_fnc_doMsg;
		};
	};
	case (_item isEqualTo "ALF_Relique_2"): {
		closeDialog 602;
		if((typeOf cursorObject) in ["Land_ALF_Anubis_02"] && {player distance cursorObject < 2}) then {
			[cursorObject,2] spawn ALF_fnc_Anubis;
		} else {
			["Info", "Tu ne peux pas utiliser cet item.", "warning", false] spawn ALF_fnc_doMsg;
		};
	};
	case (_item isEqualTo "ALF_Relique_3"): {
		closeDialog 602;
		if((typeOf cursorObject) in ["Land_ALF_Anubis_03"] && {player distance cursorObject < 2}) then {
			[cursorObject,3] spawn ALF_fnc_Anubis;
		} else {
			["Info", "Tu ne peux pas utiliser cet item.", "warning", false] spawn ALF_fnc_doMsg;
		};
	};
	
	/******************************************** Peinture ******************************************/
	case (_item isEqualTo "ALF_Peinture_Black"): {
		closeDialog 602;
		[player, "ALF_Client2\Textures\tags\black\0.paa"] spawn ALF_fnc_tag;
	};
	case (_item isEqualTo "ALF_Peinture_Blue"): {
		closeDialog 602;
		[player, "ALF_Client2\Textures\tags\blue\0.paa"] spawn ALF_fnc_tag;
	};
	case (_item isEqualTo "ALF_Peinture_Green"): {
		closeDialog 602;
		[player, "ALF_Client2\Textures\tags\green\0.paa"] spawn ALF_fnc_tag;
	};
	case (_item isEqualTo "ALF_Peinture_Red"): {
		closeDialog 602;
		[player, "ALF_Client2\Textures\tags\red\0.paa"] spawn ALF_fnc_tag;
	};

	default {["Info", "Cet item n'est pas utilisable.", "warning", false] spawn ALF_fnc_doMsg;};
};
