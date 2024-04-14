#include "script_macros.hpp"
/*
	File: init.sqf
*/

IHBYYVHBOLLOUJUBIOJNOOIYUGU = false;
publicVariable "IHBYYVHBOLLOUJUBIOJNOOIYUGU";
LACLEQUISERTAFAIRECRASHTONJEU = false;
publicVariable "LACLEQUISERTAFAIRECRASHTONJEU";
PSOUZUYBBDIDIIDODOVYYYSONOO = false;
publicVariable "PSOUZUYBBDIDIIDODOVYYYSONOO";
NSDJHBKJNZDIHKJIZYGDIJUIHZS = false;
publicVariable "NSDJHBKJNZDIHKJIZYGDIJUIHZS";

ALF_Blackmarket = "b4l1st1c-s3ll3r.onion"; //DN1
publicVariable "ALF_Blackmarket";
ALF_Blackmarket2 = "w33d-s3ll3r.onion"; //Graine
publicVariable "ALF_Blackmarket2";
ALF_Blackmarket3 = "wh1te-wid0w.onion"; //Pot + table Weed
publicVariable "ALF_Blackmarket3";
ALF_Blackmarket4 = "dsf546sdf5s6d2sd.onion"; //DN2
publicVariable "ALF_Blackmarket4";
ALF_Blackmarket5 = "dr0pb0x.onion"; //Livraison aérienne crime
publicVariable "ALF_Blackmarket5";

[4,true,8] execFSM "\ALF_server\FSM\timeModule.fsm";

/* Set OwnerID players for Headless Client */
TON_fnc_requestClientID = {(_this select 1) setVariable ["ALF_ownerID", owner (_this select 1),true];};
"life_fnc_RequestClientId" addPublicVariableEventHandler TON_fnc_requestClientID;

/* Event handler for disconnecting players */
addMissionEventHandler ["HandleDisconnect",{_this call TON_fnc_clientDisconnect; false;}];
[] call compile PreProcessFileLineNumbers "\ALF_server\functions.sqf";

addMissionEventHandler ["Ended", {
    diag_log format ["ALF_End_Game : %1",_this select 0];
}];

//Fonctions serveur.
[] execVM "\ALF_server\Farming\ALF_Dealer.sqf";
[] execVM "\ALF_server\Farming\ALF_Eggs.sqf";

//Mobilier System
ALF_Mobiliers_Items = ["Table_weed_boite","ALF_Plante_W_2_Boite","M_ALF_Security_boite","ALF_Cupidon","ALF_Chest_boite",
						"ALF_Safe_1_boite","ALF_Batterie_boite","ALF_TV_2_boite","ALF_TV_1_boite","ALF_Table_B_2_boite",
						"ALF_Table_B_1_boite","ALF_Table_2_boite","ALF_Table_1_boite","ALF_stock_2_boite","ALF_stock_1_boite",
						"ALF_lit_2_ver_boite","ALF_lit_2_Ble_boite","ALF_lit_2_Bla_boite","ALF_lit_2_R_boite","ALF_lit_2_N_boite",
						"ALF_lit_1_ver_boite","ALF_lit_1_Ble_boite","ALF_lit_1_Bla_boite","ALF_lit_1_R_boite","ALF_lit_1_N_boite",
						"ALF_chaise_2_ver_boite","ALF_chaise_2_Ble_boite","ALF_chaise_2_Bla_boite","ALF_chaise_2_N_boite","ALF_chaise_2_R_boite",
						"ALF_chaise_1_ver_boite","ALF_chaise_1_Ble_boite","ALF_chaise_1_Bla_boite","ALF_chaise_1_N_boite","ALF_chaise_1_R_boite",
						"ALF_canap_2_boite","ALF_canap_ver_boite","ALF_canap_Ble_boite","ALF_canap_Bla_boite","ALF_canap_N_boite",
						"ALF_canap_R_boite","ALF_Frigo_boite","ALF_Gros_Frigo_boite","ALF_Katana","ALF_Utility_Box_8_boite",
						"ALF_Utility_Box_3_boite","ALF_Utility_Box_2_boite","ALF_Frigo_basique_boite","ALF_Conteneur_Ent_boite","ALF_Coco_boite"];
publicVariable "ALF_Mobiliers_Items";

ALF_Mobiliers_Objects = ["Land_Table_weed","Land_ALF_Plante_W_2","ALF_Barrel","M_ALF_Security","ALF_Cupidon_M",
						"ALF_Batterie","ALF_Safe_1","ALF_Chest","ALF_TV_2","ALF_TV_1",
						"ALF_Table_B_2","ALF_Table_B_1","ALF_Table_2","ALF_Table_1","Alf_stock_2",
						"Alf_stock_1","ALF_lit_2_ver","ALF_lit_2_Ble","ALF_lit_2_Bla","ALF_lit_2_R",
						"ALF_lit_2_N","ALF_lit_1_ver","ALF_lit_1_Ble","ALF_lit_1_Bla","ALF_lit_1_R",
						"ALF_lit_1_N","ALF_chaise_2_ver","ALF_chaise_2_Ble","ALF_chaise_2_Bla","ALF_chaise_2_N",
						"ALF_chaise_2_R","ALF_chaise_1_ver","ALF_chaise_1_Ble","ALF_chaise_1_Bla","ALF_chaise_1_N",
						"ALF_chaise_1_R","ALF_canap_2_c","ALF_canap_ver","ALF_canap_Ble","ALF_canap_Bla",
						"ALF_canap_N","ALF_canap_R","ALF_Frigo","ALF_Gros_Frigo","ALF_Katana_M",
						"ALF_Utility_Box_8","ALF_Utility_Box_3","ALF_Utility_Box_2","ALF_Frigo_Basique","ALF_CaveVin","Land_ALF_Coco"];
publicVariable "ALF_Mobiliers_Objects";

ALF_Mobiliers_Objects_Data = ["alf_objects\table_weed\table_weed.p3d","alf_objects\alf_p_weed\alf_plante_w_2.p3d","alf_mobiliers\alf_barrel\barrel.p3d","alf_mobiliers\alf_security\alf_security.p3d","alf_batiments\alf_cupidon\alf_cupidon_m.p3d",
							"alf_mobiliers\alf_batterie\alf_batterie.p3d","alf_mobiliers\alf_safe_1\alf_safe_1.p3d","alf_mobiliers\alf_chest\alf_chest.p3d","alf_mobiliers\alf_tv_2\alf_tv_2.p3d","alf_mobiliers\alf_tv_1\alf_tv_1.p3d",
							"alf_mobiliers\alf_table_b_2\alf_table_b_2.p3d","alf_mobiliers\alf_table_b_1\alf_table_b_1.p3d","alf_mobiliers\alf_table_2\alf_table_2.p3d","alf_mobiliers\alf_table_1\alf_table_1.p3d","alf_mobiliers\alf_stock_2\alf_stock_2.p3d",
							"alf_mobiliers\alf_stock_1\alf_stock_1.p3d","alf_mobiliers\alf_lit_2\alf_lit_5.p3d","alf_mobiliers\alf_lit_2\alf_lit_4.p3d","alf_mobiliers\alf_lit_2\alf_lit_3.p3d","alf_mobiliers\alf_lit_2\alf_lit_1.p3d",
							"alf_mobiliers\alf_lit_2\alf_lit_2.p3d","alf_mobiliers\alf_lit_1\alf_lit_5.p3d","alf_mobiliers\alf_lit_1\alf_lit_4.p3d","alf_mobiliers\alf_lit_1\alf_lit_3.p3d","alf_mobiliers\alf_lit_1\alf_lit_1.p3d",
							"alf_mobiliers\alf_lit_1\alf_lit_2.p3d","alf_mobiliers\alf_chaise_2\alf_chaise_5.p3d","alf_mobiliers\alf_chaise_2\alf_chaise_4.p3d","alf_mobiliers\alf_chaise_2\alf_chaise_3.p3d","alf_mobiliers\alf_chaise_2\alf_chaise_2.p3d",
							"alf_mobiliers\alf_chaise_2\alf_chaise_1.p3d","alf_mobiliers\alf_chaise\alf_chaise_5.p3d","alf_mobiliers\alf_chaise\alf_chaise_4.p3d","alf_mobiliers\alf_chaise\alf_chaise_3.p3d","alf_mobiliers\alf_chaise\alf_chaise_2.p3d",
							"alf_mobiliers\alf_chaise\alf_chaise_1.p3d","alf_mobiliers\alf_canap_2\alf_canap_2.p3d","alf_mobiliers\alf_canap_1\alf_canap_5.p3d","alf_mobiliers\alf_canap_1\alf_canap_4.p3d","alf_mobiliers\alf_canap_1\alf_canap_3.p3d",
							"alf_mobiliers\alf_canap_1\alf_canap_2.p3d","alf_mobiliers\alf_canap_1\alf_canap_1.p3d","a3\structures_f_heli\items\electronics\fridge_01_f.p3d","alf_mobiliers\alf_frigo\alf_frigo.p3d","alf_mobiliers\alf_katana\alf_katana_m.p3d",
							"alf_batiments\alf_edf\alf_utility_box_8.p3d","alf_batiments\alf_edf\alf_utility_box_3.p3d","alf_batiments\alf_edf\alf_utility_box_2.p3d","alf_items_2019\alf_frigo_basique.p3d","alf_items_2019\alf_cavevin.p3d","alf_batiments\alf_h_cocaine\alf_coco.p3d"];		
publicVariable "ALF_Mobiliers_Objects_Data";

//BIE Transformateur
ALF_BIE_SECTEUR_1 = (nearestObjects [(getMarkerPos "bie_secteur_1"),["Land_ALF_Trafo"],5000]) select 0;
publicVariable "ALF_BIE_SECTEUR_1";
ALF_BIE_SECTEUR_2 = (nearestObjects [(getMarkerPos "bie_secteur_2"),["Land_ALF_Trafo"],5000]) select 0;
publicVariable "ALF_BIE_SECTEUR_2";
ALF_BIE_SECTEUR_3 = (nearestObjects [(getMarkerPos "bie_secteur_3"),["Land_ALF_Trafo"],5000]) select 0;
publicVariable "ALF_BIE_SECTEUR_3";

disableRemoteSensors true;

//Obligatoire à ajouter lors d'un ajout de meuble à la même index que la classname du meuble dans ALF_Mobiliers_Objects
/*
	Script pour recuperer cette array :
	_array = [];

	{
		_vehicle = _x createVehicle position player;
		_data = (getModelInfo _vehicle) select 1;
		_array pushBack _data;
		deleteVehicle _vehicle;
	} forEach ALF_Mobiliers_Objects;
	copyToClipboard (str _array);
	systemChat "Fini";
*/
