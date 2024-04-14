/*
*    Format:
*        level: ARRAY (This is for limiting items to certain things)
*            0: Variable to read from
*            1: Variable Value Type (SCALAR / BOOL / EQUAL)
*            2: What to compare to (-1, "" = Check Disabled)
*            3: Custom exit message (Optional)
*
*    items: { Classname, Itemname, BuyPrice, SellPrice }
*
*    Itemname only needs to be filled if you want to rename the original object name.
*
*    Weapon classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgWeapons_Weapons
*    Item classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgWeapons_Items
*
*/
class WeaponShops {

	/////////////////////////////////////////////////////
	class b_0 {
        name = "Magasin 0";
        license = "";
        items[] = {
			{ "ALF_Conteneur_Ent_boite", "", 30000, -1, "" },
			{ "ALF_Roue", "", 45, -1, "" },
			{ "ALF_Boiteaoutils", "", 35, -1, "" },
			{ "ALF_KitMecatechnic", "", 25, -1, "" },
			{ "ALF_Banane", "", 2, -1, "" },
			{ "ALF_BaconT", "", 9, -1, "" },
			{ "ALF_WaterB_P", "", 3, -1, "" },
			{ "ALF_WaterB_G", "", 6, -1, "" },
			{ "ALF_coca", "", 2, -1, "" },
			{ "ItemGPS", "", 35, -1, "" },
			{ "ItemMap", "", 50, -1, "" },
			{ "ItemCompass", "", 15, -1, "" },
			{ "ItemWatch", "", 39, -1, "" }
        };
    };
	class b_2 {
        name = "Magasin 2";
        license = "";
        items[] = {
			{ "ALF_Conteneur_Ent_boite", "", 30000, -1, "" },
			{ "ALF_Banane", "", 2, -1, "" },
			{ "ALF_Pain", "", 1, -1, "" },
			{ "ALF_Kebab", "", 7, -1, "" },
			{ "ALF_snickers", "", 3, -1, "" },
			{ "ALF_BakedBeans", "", 6, -1, "" },
			{ "ALF_BaconT", "", 9, -1, "" },
			{ "ALF_WaterB_P", "", 3, -1, "" },
			{ "ALF_WaterB_G", "", 6, -1, "" },
			{ "ALF_coca", "", 2, -1, "" },
			{ "ALF_Jus", "", 2, -1, "" },
			{ "ALF_1664", "", 8, -1, "" },
			{ "ALF_Jack", "", 25, -1, "" },
			{ "ALF_Vodka", "", 15, -1, "" },
			{ "ALF_Rome", "", 25, -1, "" },
			{ "ALF_Malibu", "", 25, -1, "" },
			{ "ALF_Luxe2", "", 25, -1, "" },
			{ "ALF_Luxe1", "", 25, -1, "" },
			{ "ALF_Jock", "", 25, -1, "" },
			{ "ALF_Jager", "", 25, -1, "" },
			{ "ALF_Horse", "", 25, -1, "" },
			{ "ALF_51", "", 25, -1, "" },
			{ "ALF_Sky", "", 25, -1, "" },
			{ "ALF_Vazisi", "", 25, -1, "" },
			{ "ALF_Smirnoff", "", 25, -1, "" },
			{ "ALF_Saucisse_Crue_M", "", 10, -1, "" },
			{ "ALF_Bacon_Crue_M", "", 10, -1, "" },
			{ "ALF_CotePorc_Crue_M", "", 25, -1, "" },
			{ "ALF_Poulet_Crue_M", "", 10, -1, "" }
        };
    };
    class b_4 {
        name = "Magasin 4";
        license = "";
        items[] = {
			{ "ALF_Conteneur_Ent_boite", "", 30000, -1, "" },
			{ "ALF_Roue", "", 45, -1, "" },
			{ "ALF_Boiteaoutils", "", 35, -1, "" },
			{ "ALF_Triflash_Item", "", 35, -1, "" },
			{ "ALF_Triangle_Item", "", 35, -1, "" },
			{ "ALF_P_devi_d", "", 35, -1, "" },
			{ "ALF_P_devi_g", "", 35, -1, "" },
			{ "ALF_KitMecatechnic", "", 25, -1, "" },
			{ "ALF_Reservoir", "", 5, -1, "" },
			{ "ALF_Vitre", "", 5, -1, "" },
			{ "ALF_Caross", "", 5, -1, "" },
			{ "ALF_Moteur", "", 5, -1, "" },
			{ "ALF_Banane", "", 2, -1, "" },
			{ "ALF_BaconT", "", 9, -1, "" },
			{ "ALF_WaterB_P", "", 3, -1, "" },
			{ "ALF_WaterB_G", "", 6, -1, "" },
			{ "ALF_RoadCone_F", "", 35, -1, "" },
			{ "ALF_coca", "", 2, -1, "" },
			{ "ItemGPS", "", 35, -1, "" },
			{ "ItemMap", "", 50, -1, "" },
			{ "ItemCompass", "", 15, -1, "" },
			{ "ItemWatch", "", 39, -1, "" }
        };
    };
    class b_6 {
        name = "Magasin 6";
        license = "";
        items[] = {
			{ "ALF_Conteneur_Ent_boite", "", 30000, -1, "" },
        	{ "M_ALF_Security_boite", "", 800, -1, "" },
			{ "ALF_Brassard_Secu", "", 75, -1, "" },
        	{ "ALF_Safe_1_boite", "", 4000, -1, "" },
			{ "ALF_Roue", "", 45, -1, "" },
			{ "ALF_Boiteaoutils", "", 35, -1, "" },
			{ "ALF_KitMecatechnic", "", 25, -1, "" },
			{ "ALF_Banane", "", 2, -1, "" },
			{ "ALF_BaconT", "", 9, -1, "" },
			{ "ALF_WaterB_P", "", 3, -1, "" },
			{ "ALF_WaterB_G", "", 6, -1, "" },
			{ "ALF_coca", "", 2, -1, "" },
			{ "ItemGPS", "", 35, -1, "" },
			{ "ItemMap", "", 50, -1, "" },
			{ "ItemCompass", "", 15, -1, "" },
			{ "ItemWatch", "", 39, -1, "" }
        };
    };
	class b_7 {
        name = "Armurerie";
        license = "";
        items[] = {
			{ "ALF_Conteneur_Ent_boite", "", 30000, -1, "" },
			{ "ALF_Banane", "", 2, -1, "" },
			{ "ALF_BaconT", "", 9, -1, "" },
			{ "ALF_WaterB_P", "", 3, -1, "" },
			{ "ALF_WaterB_G", "", 6, -1, "" },
			{ "ALF_coca", "", 2, -1, "" },
			
			{ "KA_crossbow_black", "", 499, -1, "" },
			{ "KA_crossbow_wood", "", 499, -1, "" },
			{ "KA_arrow_mag", "", 5, -1, "" },
			
			{ "ALF_RH_sw659", "", 2000, -1, "" },
			{ "ALF_RH_14Rnd_9x19_sw", "", 5, -1, "" },
			
			{ "ALF_bnae_l35_c_virtual", "", 2000, -1, "" },
			{ "ALF_8Rnd_9x19_Magazine", "", 5, -1, "" },
			
			{ "ALF_KA_Px4", "", 2000, -1, "" },
			{ "ALF_KA_Px4_Black", "", 499, -1, "" },
			{ "ALF_KA_Px4_17Rnd_9x19_FMJ_Mag", "", 5, -1, "" },
			
			{ "ALF_Desert_Eagle", "", 15000, -1, "" },
			{ "ALF_7Rnd_50_AE", "", 5, -1, "" },
			
			{ "ALF_RH_Deagles", "", 15000, -1, "" },
			{ "ALF_RH_7Rnd_50_AE", "", 5, -1, "" },
			
			{ "ALF_bnae_saa_c_virtual", "", 2000, -1, "" },
			{ "ALF_6Rnd_357M_Magazine", "", 5, -1, "" },
			
			{ "ALF_RH_mateba", "", 2000, -1, "" },
			{ "ALF_RH_6Rnd_44_Mag", "", 5, -1, "" },
			
			{ "ALF_RH_python", "", 2000, -1, "" },
			{ "ALF_RH_mp412", "", 2000, -1, "" },
			{ "ALF_RH_6Rnd_357_Mag", "", 5, -1, "" },
			
			{ "ALF_RH_bull", "", 2000, -1, "" },
			{ "ALF_RH_bullb", "", 2000, -1, "" },
			{ "ALF_RH_6Rnd_454_Mag", "", 5, -1, "" },
			
			{ "ALF_bnae_r1_virtual", "", 2000, -1, "" },
			{ "ALF_bnae_r1_c_virtual", "", 2000, -1, "" },
			{ "ALF_bnae_r1_e_virtual", "", 2000, -1, "" },
			{ "ALF_bnae_r1_m_virtual", "", 2000, -1, "" },
			{ "ALF_bnae_r1_t_virtual", "", 2000, -1, "" },
			{ "ALF_8Rnd_45GAP_Magazine", "", 5, -1, "" },
			
			{ "ALF_RH_kimber", "", 2000, -1, "" },
			{ "ALF_RH_kimber_nw", "", 2000, -1, "" },
			{ "ALF_RH_7Rnd_45cal_m1911", "", 5, -1, "" },
			
			{ "ALF_RH_cz75", "", 2000, -1, "" },
			{ "ALF_RH_16Rnd_9x19_CZ", "", 5, -1, "" },
			
			{ "ALF_RH_vp70", "", 2000, -1, "" },
			{ "ALF_RH_18Rnd_9x19_VP", "", 5, -1, "" },
			
			{ "ALF_KA_Glock_17_Single", "", 2000, -1, "" },
			{ "ALF_KA_17Rnd_9x19_Mag", "", 5, -1, "" },
			
			{ "ALF_bnae_m97_virtual", "", 2000, -1, "" },
			{ "ALF_2Rnd_00_Buckshot_Magazine", "", 5, -1, "" },
			
			{ "HITMAN_47_Hidden_Vest", "", 2000, -1, "" }
        };
    };
    class b_8 {
        name = "Magasin 8";
        license = "";
        items[] = {
			{ "ALF_Conteneur_Ent_boite", "", 30000, -1, "" },
			{ "ALF_Info_Cam", "", 1499, -1, "" },
			{ "ALF_Roue", "", 45, -1, "" },
			{ "ALF_Boiteaoutils", "", 35, -1, "" },
			{ "ALF_KitMecatechnic", "", 25, -1, "" },
			{ "ALF_Banane", "", 2, -1, "" },
			{ "ALF_BaconT", "", 9, -1, "" },
			{ "ALF_WaterB_P", "", 3, -1, "" },
			{ "ALF_WaterB_G", "", 6, -1, "" },
			{ "ALF_coca", "", 2, -1, "" },
			{ "ItemGPS", "", 35, -1, "" },
			{ "ItemMap", "", 50, -1, "" },
			{ "ItemCompass", "", 15, -1, "" },
			{ "ItemWatch", "", 39, -1, "" }
        };
    };
	class b_10 {
        name = "Magasin 10";
        license = "";
        items[] = {
			{ "ALF_Conteneur_Ent_boite", "", 30000, -1, "" },
			{ "ALF_Hache", "", 100, -1, "" },
			{ "ALF_Banane", "", 2, -1, "" },
			{ "ALF_BaconT", "", 9, -1, "" },
			{ "ALF_WaterB_P", "", 3, -1, "" },
			{ "ALF_WaterB_G", "", 6, -1, "" },
			{ "ALF_coca", "", 2, -1, "" },
			{ "ItemGPS", "", 35, -1, "" },
			{ "ItemMap", "", 50, -1, "" },
			{ "ItemCompass", "", 15, -1, "" },
			{ "ItemWatch", "", 39, -1, "" }
        };
    };
    class b_lux {
        name = "Magasin Boite";
        license = "";
        items[] = {
			{ "ALF_Conteneur_Ent_boite", "", 30000, -1, "" },
			{ "ALF_Roue", "", 45, -1, "" },
			{ "ALF_Boiteaoutils", "", 35, -1, "" },
			{ "ALF_KitMecatechnic", "", 25, -1, "" },
			{ "ALF_Banane", "", 2, -1, "" },
			{ "ALF_BaconT", "", 9, -1, "" },
			{ "ALF_WaterB_P", "", 3, -1, "" },
			{ "ALF_WaterB_G", "", 6, -1, "" },
			{ "ALF_coca", "", 2, -1, "" },
			{ "ItemGPS", "", 35, -1, "" },
			{ "ItemMap", "", 50, -1, "" },
			{ "ItemCompass", "", 15, -1, "" },
			{ "ItemWatch", "", 39, -1, "" },
			{ "ALF_coca", "", 2, -1, "" },
			{ "ALF_Jus", "", 2, -1, "" },
			{ "ALF_51", "", 35, -1, "" },
			{ "ALF_Horse", "", 45, -1, "" },
			{ "ALF_Jager", "", 55, -1, "" },
			{ "ALF_Luxe1", "", 14500, -1, "" },
			{ "ALF_Luxe2", "", 84500, -1, "" },
			{ "ALF_Malibu", "", 75, -1, "" },
			{ "ALF_Jack", "", 95, -1, "" },
			{ "ALF_Jock", "", 850, -1, "" },
			{ "ALF_Rome", "", 450, -1, "" },
			{ "ALF_Vazisi", "", 7500, -1, "" },
			{ "ALF_Jack", "", 95, -1, "" },
			{ "ALF_Jack", "", 95, -1, "" },
			{ "ALF_Vodka", "", 95, -1, "" }
        };
    };
	class b_18 {
        name = "Magasin DIR";
        license = "";
        items[] = {
			{ "ALF_Conteneur_Ent_boite", "", 30000, -1, "" },
			{ "ALF_Utility_Box_8_boite", "", 499, -1, "" },
        	{ "ALF_Utility_Box_3_boite", "", 1499, -1, "" },
			{ "ALF_Peinture_Black", "", 65, -1, "" },
			{ "ALF_P_devi_d", "", 15, -1, "" },
			{ "ALF_P_devi_g", "", 15, -1, "" },
			{ "ALF_Triflash_Item", "", 35, -1, "" },
			{ "ALF_30_Item", "", 50, -1, "" },
			{ "ALF_50_Item", "", 50, -1, "" },
			{ "ALF_Barricades_Item", "", 50, -1, "" },
			{ "ALF_Bloc_route_Item", "", 50, -1, "" },
			{ "ALF_Route_barree_Item", "", 50, -1, "" },
			{ "ALF_Route_barree_100_Item", "", 50, -1, "" },
			{ "ALF_Route_barree_200_Item", "", 50, -1, "" },
			{ "ALF_Route_barree_300_Item", "", 50, -1, "" },
			{ "ALF_Route_barree_400_Item", "", 50, -1, "" },
			{ "ALF_Route_barree_500_Item", "", 50, -1, "" },
			{ "ALF_Route_barree_600_Item", "", 50, -1, "" },
			{ "ALF_Route_barree_700_Item", "", 50, -1, "" },
			{ "ALF_Route_barree_800_Item", "", 50, -1, "" },
			{ "ALF_Route_barree_900_Item", "", 50, -1, "" },
			{ "ALF_Triangle_Item", "", 35, -1, "" },
			{ "ALF_RoadCone_F", "", 35, -1, "" },
			{ "ALF_Hache", "", 100, -1, "" },
			{ "ALF_Banane", "", 2, -1, "" },
			{ "ALF_BaconT", "", 9, -1, "" },
			{ "ALF_WaterB_P", "", 3, -1, "" },
			{ "ALF_WaterB_G", "", 6, -1, "" },
			{ "ALF_coca", "", 2, -1, "" },
			{ "ItemGPS", "", 35, -1, "" },
			{ "ItemMap", "", 50, -1, "" },
			{ "ItemCompass", "", 15, -1, "" },
			{ "ItemWatch", "", 39, -1, "" }
        };
    };
    class b_19 {
        name = "Magasin 19";
        license = "";
        items[] = {
			{ "ALF_Conteneur_Ent_boite", "", 30000, -1, "" },
        	{ "ALF_Utility_Box_8_boite", "", 499, -1, "" },
        	{ "ALF_Utility_Box_3_boite", "", 1499, -1, "" },
			{ "ALF_Roue", "", 45, -1, "" },
			{ "ALF_Boiteaoutils", "", 35, -1, "" },
			{ "ALF_KitMecatechnic", "", 25, -1, "" },
			{ "ALF_Banane", "", 2, -1, "" },
			{ "ALF_BaconT", "", 9, -1, "" },
			{ "ALF_WaterB_P", "", 3, -1, "" },
			{ "ALF_WaterB_G", "", 6, -1, "" },
			{ "ALF_coca", "", 2, -1, "" },
			{ "ItemGPS", "", 35, -1, "" },
			{ "ItemMap", "", 50, -1, "" },
			{ "ItemCompass", "", 15, -1, "" },
			{ "ItemWatch", "", 39, -1, "" }
        };
    };
	class b_21 {
        name = "Magasin Tabac";
        license = "";
        items[] = {
			{ "ALF_Conteneur_Ent_boite", "", 30000, -1, "" },
			{ "ALF_Graine_T", "", 3, -1, "" },
			{ "ALF_Roue", "", 45, -1, "" },
			{ "ALF_Boiteaoutils", "", 35, -1, "" },
			{ "ALF_Banane", "", 2, -1, "" },
			{ "ALF_BaconT", "", 9, -1, "" },
			{ "ALF_WaterB_P", "", 3, -1, "" },
			{ "ALF_WaterB_G", "", 6, -1, "" },
			{ "ALF_coca", "", 2, -1, "" },
			{ "ItemGPS", "", 35, -1, "" },
			{ "ItemMap", "", 50, -1, "" },
			{ "ItemCompass", "", 15, -1, "" },
			{ "ItemWatch", "", 39, -1, "" }
        };
    };
	class b_22 {
        name = "Magasin Petit Palais";
        license = "";
        items[] = {
			{ "ALF_Conteneur_Ent_boite", "", 30000, -1, "" },
			{ "ALF_Roue", "", 45, -1, "" },
			{ "ALF_Boiteaoutils", "", 35, -1, "" },
			{ "ALF_KitMecatechnic", "", 25, -1, "" },
			{ "ALF_Banane", "", 2, -1, "" },
			{ "ALF_BaconT", "", 9, -1, "" },
			{ "ALF_WaterB_P", "", 3, -1, "" },
			{ "ALF_WaterB_G", "", 6, -1, "" },
			{ "ALF_coca", "", 2, -1, "" },
			{ "ItemGPS", "", 35, -1, "" },
			{ "ItemMap", "", 50, -1, "" },
			{ "ItemCompass", "", 15, -1, "" },
			{ "ItemWatch", "", 39, -1, "" }
        };
    };
	class b_25 {
        name = "Magasin Patisserie";
        license = "";
        items[] = {
			{ "ALF_Conteneur_Ent_boite", "", 30000, -1, "" },
			{ "ALF_Roue", "", 45, -1, "" },
			{ "ALF_Boiteaoutils", "", 35, -1, "" },
			{ "ALF_KitMecatechnic", "", 25, -1, "" },
			{ "ALF_Banane", "", 2, -1, "" },
			{ "ALF_BaconT", "", 9, -1, "" },
			{ "ALF_WaterB_P", "", 3, -1, "" },
			{ "ALF_WaterB_G", "", 6, -1, "" },
			{ "ALF_coca", "", 2, -1, "" },
			{ "ItemGPS", "", 35, -1, "" },
			{ "ItemMap", "", 50, -1, "" },
			{ "ItemCompass", "", 15, -1, "" },
			{ "ItemWatch", "", 39, -1, "" }
        };
    };
	
	/////////////////////////////////////////////////////
    class bijoutier {
        name = "Bijouterie";
        license = "";
        items[] = {
			{ "ALF_Bague_Homme", "", 538, -1, "" },
			{ "ALF_Bague_Femme", "", 542, -1, "meuf" }
        };
    };

	/////////////////////////////////////////////////////
    class bankstore {
        name = "Crédit Mutuel";
        license = "";
        items[] = {
			{ "ALF_CB_Bronze", "", 15, -1, "" },
			{ "ALF_CB_Gold", "", 99, -1, "" },
			{ "ALF_CB_Black", "", 199, -1, "" }
        };
    };

    class orange {
        name = "Orange";
        license = "";
        items[] = {
			{ "ALF_3310", "", 149, -1, "" },
			{ "ALF_iPhone", "", 699, -1, "" }
        };
    };

    /////////////////////////////////////////////////////

    class ikea {
        name = "IKEA";
        license = "home";
        items[] = {
        	{ "ALF_Barrel_boite", "", 499, -1, "" },
			{ "ALF_TV_2_boite", "", 1499, -1, "" },
			{ "ALF_TV_1_boite", "", 1599, -1, "" },
			{ "ALF_Table_B_2_boite", "", 89, -1, "" },
			{ "ALF_Table_B_1_boite", "", 99, -1, "" },
			{ "ALF_Table_2_boite", "", 549, -1, "" },
			{ "ALF_Table_1_boite", "", 749, -1, "" },
			{ "ALF_stock_2_boite", "", 975, -1, "" },
			{ "ALF_stock_1_boite", "", 1199, -1, "" },
			{ "ALF_lit_2_Ver_boite", "", 2499, -1, "" },
			{ "ALF_lit_2_Ble_boite", "", 2499, -1, "" },
			{ "ALF_lit_2_Bla_boite", "", 2499, -1, "" },
			{ "ALF_lit_2_R_boite", "", 2499, -1, "" },
			{ "ALF_lit_2_N_boite", "", 2499, -1, "" },
			{ "ALF_lit_1_Ver_boite", "", 2299, -1, "" },
			{ "ALF_lit_1_Ble_boite", "", 2299, -1, "" },
			{ "ALF_lit_1_Bla_boite", "", 2299, -1, "" },
			{ "ALF_lit_1_R_boite", "", 2299, -1, "" },
			{ "ALF_lit_1_N_boite", "", 2299, -1, "" },
			{ "ALF_chaise_2_ver_boite", "", 99, -1, "" },
			{ "ALF_chaise_2_Ble_boite", "", 99, -1, "" },
			{ "ALF_chaise_2_Bla_boite", "", 99, -1, "" },
			{ "ALF_chaise_2_N_boite", "", 99, -1, "" },
			{ "ALF_chaise_2_R_boite", "", 99, -1, "" },
			{ "ALF_chaise_1_ver_boite", "", 119, -1, "" },
			{ "ALF_chaise_1_Ble_boite", "", 119, -1, "" },
			{ "ALF_chaise_1_Bla_boite", "", 119, -1, "" },
			{ "ALF_chaise_1_N_boite", "", 119, -1, "" },
			{ "ALF_chaise_1_R_boite", "", 119, -1, "" },
			{ "ALF_canap_2_boite", "", 3499, -1, "" },
			{ "ALF_canap_ver_boite", "", 3599, -1, "" },
			{ "ALF_canap_Ble_boite", "", 3599, -1, "" },
			{ "ALF_canap_Bla_boite", "", 3599, -1, "" },
			{ "ALF_canap_N_boite", "", 4515, -1, "" },
			{ "ALF_canap_R_boite", "", 4515, -1, "" },
			{ "ALF_Frigo_boite", "", 1499, -1, "" },
			{ "ALF_Frigo_basique_boite", "", 1499, -1, "" },
			{ "ALF_Gros_Frigo_boite", "", 3568, -1, "" },
			{ "ALF_Camping_Chair_Item", "", 45, -1, "" },
			{ "ALF_bbq_M", "", 699, -1, "" },
			{ "ALF_Tente_1_Item", "", 75, -1, "" },
			{ "ALF_Batterie_boite", "", 1850, -1, "" },
			{ "ALF_Sonnette4G", "", 349, -1, "" },
			{ "ALF_Safe_1_boite", "", 18500, -1, "" }
        };
    };

    /////////////////////////////////////////////////////
    class mais {
        name = "Vendeur de graines";
        license = "";
        items[] = {
			{ "ALF_Graine_M", "", 2, -1, "" }
        };
    };
	
	/////////////////////////////////////////////////////
    class Pharmacie {
        name = "Pharmacie";
        license = "";
        items[] = {
			{ "ALF_Medoc_rhume", "", 18, -1, "" },
			{ "ALF_Medoc_toux", "", 25, -1, "" }
        };
    };
	
	/////////////////////////////////////////////////////
    class farce {
        name = "Farce et Attrape";
        license = "";
        items[] = {
			{ "ALF_Peinture_Black", "", 65, -1, "" },
			{ "ALF_Peinture_Green", "", 65, -1, "" },
			{ "ALF_sifflet", "", 25, -1, "" }
        };
    };

    /////////////////////////////////////////////////////
	class cop {
		name = "Gendarmerie";
		license = "cop";
		items[] = {
			{ "ALF_laptop_unfolded_f", "", 349, -1, "TIC" },
			{ "C2_Mag", "", 1499, -1, "GIGN" },
			{ "ALF_Perceuse_GDM_M", "", 549, -1, "GIGN" },
			{ "alf_neogend", "", 499, -1, "" },
			{ "ALF_Menottes", "", 9, -1, "" },
			{ "ALF_cle_M", "", 4, -1, "" },
			{ "ALF_TestStup", "", 25, -1, "" },
			{ "ALF_Alcootest", "", 68, -1, "" },
			{ "ALF_sifflet", "", 4, -1, "" },
			{ "ALF_Peinture_Blue", "", 65, -1, "" },
			{ "ALF_Herse_i", "", 35, -1, "" },
			{ "ALF_Radar_m_i", "", 135, -1, "" },
			{ "ALF_P_halte", "", 15, -1, "" },
			{ "ALF_P_devi_d", "", 15, -1, "" },
			{ "ALF_P_devi_g", "", 15, -1, "" },
			{ "ALF_Bracelet", "", 489, -1, "" },
			{ "ALF_Camera", "", 49, -1, "" },
			{ "ALF_Rangefinder", "", 49, -1, "" },
			{ "ALF_Banane", "", 2, -1, "" },
			{ "ALF_BaconT", "", 9, -1, "" },
			{ "ALF_WaterB_P", "", 3, -1, "" },
			{ "ALF_WaterB_G", "", 6, -1, "" },
			{ "ALF_Flash_Light", "", 15, -1, "" },
			{ "ALF_Triflash_Item", "", 35, -1, "" },
			{ "ALF_Triangle_Item", "", 35, -1, "" },
			{ "ALF_RoadCone_F", "", 35, -1, "" },
			{ "ALF_Roue", "", 45, -1, "" },
			{ "ALF_Boiteaoutils", "", 35, -1, "" },
			{ "ALF_KitMecatechnic", "", 25, -1, "" },
			{ "ALF_EarPiece", "", 49, -1, "" },
			{ "Binocular", "", 49, -1, "" },
			{ "ItemGPS", "", 35, -1, "" },
			{ "ItemMap", "", 50, -1, "" },
			{ "ItemCompass", "", 15, -1, "" },
			{ "ItemWatch", "", 39, -1, "" }
		};
	};
	class cop_SR {
		name = "Gendarmerie";
		license = "SR";
		items[] = {
			{ "ALF_laptop_unfolded_f", "", 349, -1, "SR" },
			{ "ALF_Perceuse_GDM_M", "", 549, -1, "SR" },
			{ "ALF_Tracker_i", "", 249, -1, "SR" },
			{ "alf_neogend", "", 499, -1, "" },
			{ "ALF_Menottes", "", 9, -1, "" },
			{ "ALF_cle_M", "", 4, -1, "" },
			{ "ALF_TestStup", "", 25, -1, "" },
			{ "ALF_Alcootest", "", 68, -1, "" },
			{ "ALF_Bracelet", "", 489, -1, "" },
			{ "ALF_Camera", "", 49, -1, "" },
			{ "ALF_Rangefinder", "", 49, -1, "" },
			{ "ALF_Banane", "", 2, -1, "" },
			{ "ALF_WaterB_P", "", 3, -1, "" },
			{ "ALF_WaterB_G", "", 6, -1, "" },
			{ "ALF_EarPiece", "", 49, -1, "" },
			{ "Binocular", "", 49, -1, "" },
			{ "ItemGPS", "", 35, -1, "" },
			{ "ItemMap", "", 50, -1, "" },
			{ "ItemCompass", "", 15, -1, "" },
			{ "ItemWatch", "", 39, -1, "" }
		};
	};
	class copw_SR {
		name = "Armurerie SR";
		license = "SR";
		items[] = {
			{ "ALF_X26", "", 15, -1, "" },
			{ "ALF_1Rnd_X26", "", 3, -1, "" },
			
			{ "KA_Glock_17_Single", "", 80, -1, "SR" },
			{ "KA_17Rnd_9x19_Mag", "", 5, -1, "SR" },
			{ "KA_Flashlight", "", 8, -1, "SR" },
			
			{ "KA_UMP9", "", 110, -1, "" },
			{ "KA_30Rnd_9x19_FMJ_Mag", "", 6, -1, "" },
			{ "KA_UMP45_Flashlight", "", 8, -1, "" },
			
			{ "ALF_hlc_smg_mp5a4", "", 190, -1, "" },
			{ "ALF_hlc_30Rnd_9x19_B_MP5", "", 7, -1, "" },

			{ "ALF_KA_M1014", "", 150, -1, "" },
			{ "ALF_6Rnd_M1014_buck", "", 7, -1, "" },
			{ "ALF_6Rnd_M1014_PPA", "", 7, -1, "" },
			{ "ALF_6Rnd_M1014_slug", "", 7, -1, "" },
			
			{ "optic_Holosight_blk_F", "", 8, -1, "" },
			{ "optic_Holosight_smg_blk_F", "", 8, -1, "" },
			{ "optic_aco", "", 8, -1, "" },
			{ "KA_Rakurs", "", 8, -1, "" },
			{ "acc_flashlight", "", 8, -1, "" },

			{ "KA_MCU", "", 80, -1, "" },
			{ "ALF_Brassard_GND", "", 80, -1, "" }
		};
	};
	class copw {
		name = "Armurerie";
		license = "cop";
		items[] = {
			{ "ALF_X26", "", 15, -1, "" },
			{ "ALF_1Rnd_X26", "", 3, -1, "" },
			
			{ "KA_P226_Black", "", 80, -1, "" },
			{ "KA_P226_15Rnd_9x19_FMJ_Mag", "", 5, -1, "" },
			{ "KA_P226_Flashlight", "", 8, -1, "" },
			{ "KA_P226_Silencer", "", 8, -1, "GIGN" },
			
			{ "ALF_KA_FNP45", "", 80, -1, "PSIG" },
			{ "ALF_KA_15Rnd_45ACP_Mag", "", 5, -1, "PSIG" },
			{ "KA_FNP45_Flashlight", "", 8, -1, "PSIG" },
			
			{ "ALF_KA_FNP45", "", 80, -1, "GIGN" },
			{ "ALF_KA_15Rnd_45ACP_Mag", "", 5, -1, "GIGN" },
			{ "KA_FNP45_Flashlight", "", 8, -1, "GIGN" },
			
			{ "RH_fnp45", "", 80, -1, "GIGN" },
			{ "RH_15Rnd_45cal_fnp", "", 5, -1, "GIGN" },
			{ "RH_M6X", "", 8, -1, "GIGN" },
			{ "RH_docter", "", 8, -1, "GIGN" },
			{ "RH_gemtech45", "", 8, -1, "GIGN" },
			
			{ "RH_python", "", 80, -1, "GIGN" },
			{ "RH_6Rnd_357_Mag", "", 5, -1, "GIGN" },
			
			{ "KA_Glock_17_Single", "", 80, -1, "SR" },
			{ "KA_17Rnd_9x19_Mag", "", 5, -1, "SR" },
			{ "KA_Flashlight", "", 8, -1, "SR" },
			
			{ "KA_UMP9", "", 110, -1, "" },
			{ "KA_30Rnd_9x19_FMJ_Mag", "", 6, -1, "" },
			{ "KA_UMP45_Flashlight", "", 8, -1, "" },
			{ "KA_UMP9_Silencer", "", 8, -1, "GIGN" },
			
			{ "ALF_hlc_smg_mp5a4", "", 190, -1, "" },
			{ "ALF_hlc_smg_mp5a2", "", 190, -1, "PSIG" },
			{ "ALF_hlc_30Rnd_9x19_B_MP5", "", 7, -1, "" },
			{ "hlc_acc_Surefiregrip", "", 8, -1, "PSIG" },
			
			{ "ALF_hlc_smg_mp510", "", 190, -1, "GIGN" },
			{ "ALF_hlc_30Rnd_10mm_B_MP5", "", 7, -1, "GIGN" },
			{ "hlc_muzzle_Agendasix10mm", "", 8, -1, "GIGN" },
			
			{ "SMG_03_TR_black", "", 190, -1, "GIGN" },
			{ "50Rnd_570x28_SMG_03", "", 7, -1, "GIGN" },
			
			{ "ALF_KA_M1014", "", 150, -1, "" },
			{ "ALF_6Rnd_M1014_buck", "", 7, -1, "" },
			{ "ALF_6Rnd_M1014_PPA", "", 7, -1, "" },
			{ "ALF_6Rnd_M1014_slug", "", 7, -1, "" },
			
			{ "KA_KSG_Black", "", 150, -1, "GIGN" },
			{ "7Rndx2_KSG_buck_mag", "", 7, -1, "GIGN" },
			{ "7Rndx2_KSG_ppa_mag", "", 7, -1, "GIGN" },
			{ "7Rndx2_KSG_slug_mag", "", 7, -1, "GIGN" },
			{ "KA_KSG_Flashlight_single", "", 8, -1, "GIGN" },
			
			{ "ALF_R3F_Famas_F1", "", 289, -1, "" },
			{ "ALF_R3F_Famas_F1_HG", "", 289, -1, "PSIG" },
			{ "ALF_R3F_Famas_F1_HG", "", 289, -1, "GIGN" },
			{ "ALF_R3F_25Rnd_556x45_FAMAS", "", 7, -1, "" },
			{ "R3F_AIMPOINT", "", 8, -1, "" },
			{ "R3F_LAMPE_SURB", "", 8, -1, "" },
			{ "R3F_SILENCIEUX_HK416", "", 8, -1, "GIGN" },
			
			{ "ALF_R3F_HK416S_HG", "", 300, -1, "GIGN" },
			{ "ALF_R3F_30Rnd_556x45_HK416", "", 7, -1, "GIGN" },
			{ "R3F_AIMPOINT", "", 8, -1, "GIGN" },
			{ "R3F_LAMPE_SURB", "", 8, -1, "GIGN" },
			{ "R3F_SILENCIEUX_HK416", "", 8, -1, "GIGN" },
			{ "R3F_BIPIED_HK417", "", 8, -1, "GIGN" },
			
			{ "optic_Holosight_blk_F", "", 8, -1, "" },
			{ "optic_Holosight_smg_blk_F", "", 8, -1, "" },
			{ "optic_aco", "", 8, -1, "" },
			{ "KA_Rakurs", "", 8, -1, "" },
			{ "acc_flashlight", "", 8, -1, "" },
			
			{ "KA_FNP45_shield", "", 80, -1, "PSIG" },
			{ "KA_FNP45_shield", "", 80, -1, "GIGN" },
			
			{ "NVGoggles_OPFOR", "", 80, -1, "GIGN" },
			{ "KA_MCU", "", 80, -1, "" },
			{ "ALF_Brassard_GND", "", 80, -1, "" },
			
			{ "KA_M7A3", "", 8, -1, "PSIG" },
			{ "KA_M7A3", "", 8, -1, "GIGN" },
			{ "KA_M814", "", 8, -1, "GIGN" },
			{ "KA_M84", "", 8, -1, "GIGN" },
			{ "KA_M7290", "", 8, -1, "GIGN" },
			{ "SmokeShell", "", 8, -1, "" }
		};
	};

	/////////////////////////////////////////////////////

	class med {
		name = "Pompier";
		license = "med";
		items[] = {
			{ "alf_sony", "", 299, -1, "" },
			{ "ALF_FireNozzle", "", 25, -1, "" },
			{ "ALF_FireNozzle_mag", "", 5, -1, "" },
			{ "ALF_Peinture_Red", "", 65, -1, "" },
			{ "ALF_Guardian", "", 349, -1, "" },
			{ "ALF_Bandage", "", 3, -1, "" },
			{ "ALF_Adrenaline", "", 7, -1, "SAMU" },
			{ "ALF_Atropine", "", 8, -1, "SAMU" },
			{ "ALF_Morphine", "", 9, -1, "SAMU" },
			{ "ALF_Saline", "", 14, -1, "SAMU" },
			{ "ALF_Sthetoscope", "", 25, -1, "SAMU" },
			{ "ALF_Medoc_rhume", "", 18, -1, "SAMU" },
			{ "ALF_Medoc_toux", "", 25, -1, "SAMU" },
			{ "ALF_Drap_Cadavre_Item", "", 15, -1, "" },
			{ "ALF_M_Oxy9L", "", 45, -1, "" },
			{ "ALF_Defibrilateur", "", 15, -1, "" },
			{ "ALF_P_devi_d", "", 15, -1, "" },
			{ "ALF_P_devi_g", "", 15, -1, "" },
			{ "ALF_RoadCone_F", "", 15, -1, "" },
			{ "ALF_Triflash_Item", "", 15, -1, "" },
			{ "ALF_Triangle_Item", "", 15, -1, "" },
			{ "ALF_Flash_Light", "", 15, -1, "" },
			{ "ALF_Banane", "", 2, -1, "" },
			{ "ALF_BaconT", "", 9, -1, "" },
			{ "ALF_WaterB_P", "", 3, -1, "" },
			{ "ALF_WaterB_G", "", 6, -1, "" },
			{ "ALF_Camera", "", 49, -1, "" },
			{ "ALF_Roue", "", 45, -1, "" },
			{ "ALF_Boiteaoutils", "", 35, -1, "" },
			{ "ALF_KitMecatechnic", "", 25, -1, "" },
			{ "ALF_Hache", "", 85, -1, "" },
			{ "ALF_DonDuSang_Chair_Item", "", 150, -1, "" },
			{ "ALF_Rideaux_Item", "", 150, -1, "" },
			{ "ALF_Poubelle_Medic_Item", "", 150, -1, "" },
			{ "ALF_Table_Soin_Item", "", 150, -1, "" },
			{ "ALF_Tente_Medic_Item", "", 150, -1, "" },
			{ "Binocular", "", 15, -1, "" },
			{ "ItemGPS", "", 15, -1, "" },
			{ "ItemMap", "", 15, -1, "" },
			{ "ItemCompass", "", 15, -1, "" },
			{ "ItemWatch", "", 15, -1, "" }
		};
	};

	/////////////////////////////////////////////////////
	class prison {
		name = "Magasin detenu";
		license = "";
		items[] = {
			{ "ALF_Pioche", "", 200, -1, "" },
			{ "ALF_Banane", "", 25, -1, "" },
			{ "ALF_Pomme", "", 25, -1, "" },
			{ "ALF_Peche", "", 25, -1, "" },
			{ "ALF_Pain", "", 25, -1, "" },
			{ "ALF_snickers", "", 25, -1, "" },
			{ "ALF_BakedBeans", "", 25, -1, "" },
			{ "ALF_BaconT", "", 65, -1, "" },
			{ "ALF_WaterB_G", "", 15, -1, "" },
			{ "ALF_coca", "", 25, -1, "" },
			{ "ItemGPS", "", 35, -1, "" },
			{ "ItemMap", "", 50, -1, "" },
			{ "ItemCompass", "", 15, -1, "" },
			{ "ItemWatch", "", 39, -1, "" }
        };
    };
    class prisonpro {
		name = "Magasin prison";
		license = "";
		items[] = {
			{ "ALF_iPhone", "", 699, -1, "" },
			{ "ALF_Bandage", "", 3, -1, "medWork" },
			{ "ALF_Guardian", "", 349, -1, "medWork" },
			{ "ALF_M_Oxy9L", "", 45, -1, "medWork" },
			{ "ALF_Defibrilateur", "", 15, -1, "medWork" },
			{ "ALF_X26", "", 15, -1, "" },
			{ "ALF_1Rnd_X26", "", 3, -1, "" },
			{ "KA_M1014", "", 249, -1, "" },
			{ "6Rnd_M1014_buck", "", 19, -1, "" },
			{ "6Rnd_M1014_PPA", "", 19, -1, "" },
			{ "hlc_smg_mp5a4", "", 249, -1, "" },
			{ "hlc_30Rnd_9x19_B_MP5", "", 7, -1, "" },
			{ "optic_Holosight_blk_F", "", 8, -1, "" },
			{ "optic_Holosight_smg_blk_F", "", 8, -1, "" },
			{ "KA_MCU", "", 80, -1, "" },
			{ "KA_Rakurs", "", 8, -1, "" },
			{ "optic_aco", "", 8, -1, "" },
			{ "acc_flashlight", "", 8, -1, "" },
			{ "ALF_Menottes", "", 9, -1, "" },
			{ "ALF_cle_M", "", 4, -1, "" },
			{ "ALF_Bracelet", "", 489, -1, "" },
			{ "ALF_Barile_0", "", 9, -1, "" },
			{ "ALF_Roue", "", 45, -1, "" },
			{ "ALF_Boiteaoutils", "", 35, -1, "" },
			{ "ALF_KitMecatechnic", "", 25, -1, "" },
			{ "ALF_Banane", "", 2, -1, "" },
			{ "ALF_WaterB_P", "", 3, -1, "" },
			{ "ALF_coca", "", 2, -1, "" },
			{ "ItemGPS", "", 35, -1, "" },
			{ "ItemMap", "", 50, -1, "" },
			{ "ItemCompass", "", 15, -1, "" },
			{ "ItemWatch", "", 39, -1, "" }
        };
    };

    class genstore {
		name = "Magasin général";
		license = "";
		items[] = {
			{ "ALF_Roue", "", 55, -1, "" },
			{ "ALF_Boiteaoutils", "", 75, -1, "" },
			{ "ALF_KitMecatechnic", "", 35, -1, "" },
			{ "ALF_Pioche", "", 150, -1, "" },
			{ "ALF_Batte", "", 250, -1, "" },
			{ "ALF_Hache", "", 200, -1, "" },
			{ "ALF_Faux", "", 250, -1, "" },
			{ "ALF_Camera", "", 230, -1, "" },
			{ "ALF_GoPro", "", 349, -1, "" },
			{ "ALF_Triangle_Item", "", 15, -1, "" },
			{ "ALF_Flash_Light", "", 90, -1, "" },
			{ "ALF_ZipCutter", "", 130, -1, "" },
			{ "murshun_cigs_lighter", "", 130, -1, "" },
			{ "ALF_CanneAPeche", "", 850, -1, "" },
			{ "ALF_appat", "", 75, -1, "" },
			{ "ALF_GPS", "", 453, -1, "" },
			{ "Binocular", "", 49, -1, "" },
			{ "ItemGPS", "", 35, -1, "" },
			{ "ItemMap", "", 50, -1, "" },
			{ "ItemCompass", "", 15, -1, "" },
			{ "ItemWatch", "", 39, -1, "" }
        };
    };

    class barile {
        name = "Vendeur de barile";
        license = "";
        items[] = {
			{ "ALF_Barile_P_E", "", 25, -1, "" }
        };
    };
    class vdealer {
        name = "Vendeur de drogue";
        license = "";
        items[] = {
			{ "ALF_Cocaine_U", "", 500, -1, "" }
        };
    };

    class station {
        name = "Magasin Total";
        license = "";
        items[] = {
			{ "ALF_Barile_100", "", 300, -1, "" },
			{ "ALF_Barile_0", "", 9, -1, "" },
			{ "ALF_Roue", "", 45, -1, "" },
			{ "ALF_Boiteaoutils", "", 35, -1, "" },
			{ "ALF_KitMecatechnic", "", 25, -1, "" },
			{ "ALF_Banane", "", 2, -1, "" },
			{ "ALF_WaterB_P", "", 3, -1, "" },
			{ "ALF_coca", "", 2, -1, "" },
			{ "ItemGPS", "", 35, -1, "" },
			{ "ItemMap", "", 50, -1, "" },
			{ "ItemCompass", "", 15, -1, "" },
			{ "ItemWatch", "", 39, -1, "" }
        };
    };

    class armurerie {
        name = "Armurerie";
        license = "";
        items[] = {
			{ "KA_Px4", "", 6500, -1, "" },
			{ "KA_Px4_Black", "", 6500, -1, "" },
			{ "KA_Px4_17Rnd_9x19_FMJ_Mag", "", 149, -1, "" },
			{ "KA_Glock_17_Single", "", 3450, -1, "" },
			{ "KA_17Rnd_9x19_Mag", "", 170, -1, "" }
        };
    };

    class market {
        name = "Marché";
        license = "";
        items[] = {
			{ "ALF_Banane", "", 2, -1, "" },
			{ "ALF_Pain", "", 1, -1, "" },
			{ "ALF_Kebab", "", 7, -1, "" },
			{ "ALF_snickers", "", 3, -1, "" },
			{ "ALF_BakedBeans", "", 6, -1, "" },
			{ "ALF_BaconT", "", 9, -1, "" },
			{ "ALF_WaterB_P", "", 3, -1, "" },
			{ "ALF_WaterB_G", "", 6, -1, "" },
			{ "ALF_coca", "", 2, -1, "" },
			{ "ALF_Jus", "", 2, -1, "" },
			{ "ALF_1664", "", 8, -1, "" },
			{ "ALF_Jack", "", 25, -1, "" },
			{ "ALF_Vodka", "", 15, -1, "" },
			{ "ALF_Saucisse_Crue_M", "", 10, -1, "" },
			{ "ALF_Bacon_Crue_M", "", 10, -1, "" },
			{ "ALF_CotePorc_Crue_M", "", 25, -1, "" },
			{ "ALF_Poulet_Crue_M", "", 10, -1, "" }
        };
    };

    /////////////////////////////////////////////////////

    class blackmarket {
		name = "Marché noir";
		license = "";
		items[] = {
			{ "ALF_C4", "", 84500, -1, "" },
			{ "ALF_Pc", "", 26500, -1, "" },
			{ "ALF_Badge_b", "", 5456, -1, "" },
			{ "ALF_Lockpick", "", 145, -1, "" },
			{ "ALF_ZipTies", "", 75, -1, "" },
			{ "ALF_Utility_Box_2_boite", "", 3499, -1, "" },
			{ "ALF_Headbag", "", 300, -1, "" },
			{ "ALF_PortableLight_double", "", 20, -1, "" },
			{ "ALF_PortableLight_single", "", 20, -1, "" },
			{ "ALF_BagFence_Round", "", 50, -1, "" },
			{ "ALF_BagFence_Long", "", 50, -1, "" },
			{ "ALF_Headbag", "", 300, -1, "" },
			{ "KA_MCU", "", 3499, -1, "" },
			{ "ALF_Perceuse_GDM_M", "", 549, -1, "" },
			
			{ "ALF_bnae_saa_virtual", "", 10000, -1, "" },
			{ "ALF_6Rnd_357M_Magazine", "", 5, -1, "" },
			
			{ "bnae_l35_virtual", "", 7000, -1, "" },
			{ "8Rnd_9x19_Magazine", "", 5, -1, "" },
			
			{ "ALF_RH_m1911", "", 8000, -1, "" },
			{ "ALF_RH_7Rnd_45cal_m1911", "", 5, -1, "" },
			
			{ "ALF_RH_tt33", "", 9000, -1, "" },
			{ "ALF_RH_8Rnd_762_tt33", "", 5, -1, "" },
			
			{ "RH_mak", "", 7450, -1, "" },
			{ "RH_8Rnd_9x18_Mak", "", 5, -1, "" },
			
			{ "KICKASS_Sawed_Off_Shotgun", "", 12000, -1, "" },
			{ "KICKASS_2Rnd_Sawed_Off_Shotgun_Pellets", "", 5, -1, "" },
			
			{ "ALF_bnae_spr220_so_virtual", "", 10000, -1, "" },
			{ "ALF_2Rnd_00_Buckshot_Magazine", "", 5, -1, "" },
			
			{ "ALF_RH_vz61", "", 15000, -1, "" },
			{ "ALF_RH_20Rnd_32cal_vz61", "", 5, -1, "" },
			
			{ "AEK_919K", "", 20000, -1, "" },
			{ "20Rnd_9x18_Mag", "", 5, -1, "" },
			
			{ "KA_FMG9", "", 14500, -1, "" },
			{ "KA_33Rnd_9x19_FMJ_Mag", "", 5, -1, "" }
		};
    };
    class blackmarket2	{
		name = "Marché noir";
		license = "";
		items[] = {
			{ "ALF_Lockpick", "", 145, -1, "" },
			{ "ALF_Pseudoephedrine", "", 145, -1, "" },
			{ "ALF_ZipTies", "", 75, -1, "" },
			{ "ALF_cle_1", "", 450, -1, "" },
			{ "Table_weed_boite", "", 25655, -1, "" },
			{ "ALF_Plante_W_2_Boite", "", 12500, -1, "" },
			{ "ALF_Coco_boite", "Atelier de cocaine", 60000, -1, "" }
		};
    };
	 class blackmarket3	{
		name = "Marché noir";
		license = "";
		items[] = {
			{ "RH_fn57", "", 7000, -1, "" },
			{ "RH_20Rnd_57x28_FN", "", 5, -1, "" },
			
			{ "KA_Glock_18_Single", "", 7850, -1, "" },
			{ "KA_Glock_18", "", 7850, -1, "" },
			{ "KA_Glock_17", "", 7440, -1, "" },
			{ "KA_17Rnd_9x19_Mag", "", 5, -1, "" },
			
			{ "Desert_Eagle", "", 15000, -1, "" },
			{ "7Rnd_50_AE", "", 5, -1, "" },
			
			{ "ALF_RH_tec9", "", 15000, -1, "" },
			{ "ALF_RH_32Rnd_9x19_tec", "", 5, -1, "" },
			
			{ "KA_MP7_Rifle_Black_20Rnd", "", 17000, -1, "" },
			{ "KA_MP7_Rifle_Green_20Rnd", "", 17000, -1, "" },
			{ "KA_20Rnd_46x30_FMJ", "", 5, -1, "" },
			
			{ "KA_MP7_Rifle_Black_40Rnd", "", 18000, -1, "" },
			{ "KA_MP7_Rifle_Green_40Rnd", "", 18000, -1, "" },
			{ "KA_40Rnd_46x30_FMJ", "", 5, -1, "" },
			
			{ "ALF_KA_PP19_MTK83", "", 19000, -1, "" },
			{ "ALF_KA_64Rnd_9x18_PMM_FMJ_Mag", "", 5, -1, "" },
			
			{ "ALF_SMG_01_F", "", 20000, -1, "" },
			{ "ALF_30Rnd_45ACP_Mag_SMG_01", "", 5, -1, "" },
			
			{ "Mossberg_590", "", 17000, -1, "" },
			{ "8Rnd_Mossberg_590_Pellets", "", 5, -1, "" },
			
			{ "KA_SPAS12", "", 19000, -1, "" },
			{ "8Rnd_SPAS12_buck", "", 5, -1, "" },
			
			{ "KA_RO991", "", 25000, -1, "" },
			{ "KA_32Rnd_9x19_FMJ_Mag", "", 5, -1, "" },
			
			{ "arifle_AKS_F", "", 21000, -1, "" },
			{ "30Rnd_545x39_Mag_F", "", 5, -1, "" },
			
			{ "KA_SG_552_Black", "", 26000, -1, "" },
			{ "KA_SIG_30rnd_Mk318_SOST_mag", "", 5, -1, "" },
			
			{ "KA_M4A1_F", "", 20000, -1, "" },
			{ "KA_Original_Sight_Carry_Handle", "", 2500, -1, "" },
			{ "KA_Original_Sight_Flip_Up_Sight", "", 2500, -1, "" },
			
			{ "Hand_Guard_Rail", "", 2500, -1, "" },
			{ "Hand_Guard_Rail_Covers", "", 2500, -1, "" },
			{ "Hand_Guard_Rail_Flashlight_Black", "", 2500, -1, "" },
			{ "Round_Hand_Guard", "", 2500, -1, "" },
			
			{ "103_Inches_Barrel", "", 2500, -1, "" },
			{ "103_Inches_Barrel_Flash_Hider", "", 2500, -1, "" },
			{ "145_Inches_Barrel", "", 2500, -1, "" },
			{ "145_Inches_Barrel_Bayonet", "", 2500, -1, "" },
			{ "145_Inches_Barrel_Flash_Hider", "", 2500, -1, "" },
			
			{ "ATG_Grip_MOE_Grip_MOE_Stock_Black", "", 2500, -1, "" },
			{ "ATG_Grip_Original_Grip_Lightweight_Stock", "", 2500, -1, "" },
			{ "ATG_Grip_Original_Grip_Original_Stock", "", 2500, -1, "" },
			{ "MOE_Grip_MOE_Stock_Black", "", 2500, -1, "" },
			{ "MOE_Stock_Lightweight_Stock_Black", "", 2500, -1, "" },
			{ "MVG_Grip_MOE_Grip_MOE_Stock_Black", "", 2500, -1, "" },
			{ "Original_Grip_M16_Stock", "", 2500, -1, "" },
			{ "Original_Grip_Original_Stock", "", 2500, -1, "" },
			{ "Vertical_Grip_MOE_Grip_MOE_Stock_Black", "", 2500, -1, "" },
			{ "Vertical_Grip_Original_Grip_Original_Stock", "", 2500, -1, "" }
		};
    };
};
