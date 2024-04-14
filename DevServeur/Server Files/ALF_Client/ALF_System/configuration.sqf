#include "\ALF_Client\script_macros.hpp"

ALF_Killed = false;
alf_bouton_magique = false;

/*
*****************************
**** Peche Variables *****
*****************************
*/
ALF_PoissonSousLeau = false;
ALF_PoissonsortieDeLeau = false;
ALF_PecheEnCours = false;
ALF_perteHammecon = false;

/*
*****************************
**** Bois Variables *****
*****************************
*/

ALF_placeBoisDIR = false;
ALF_boisActive = objNull;

/*
*****************************
******** Poker System *******
*****************************
*/
ALF_Poker_selectPlayer_Active = false;
ALF_Poker_selectPlayer = [];
ALF_Current_Partie = -1;

/*
*****************************
********* XP System *********
*****************************
*/
alf_contrats = 0;

alf_xp_recolte = 0;
alf_xp_minage = 0;
alf_xp_peche = 0;
alf_xp_illegal = 0;

alf_niv_recolte = 0;
alf_niv_minage = 0;
alf_niv_peche = 0;
alf_niv_illegal = 0;

alf_xp_mt = time;
// alf_xp_m = profileNamespace getVariable ["alf_xp_m", false];
alf_xp_m = false;
alf_xp_mc = 0;

/*
*****************************
****** Medical System *******
*****************************
*/
ALF_groupeSanguin = "";
alf_ms_active = false;
alf_ms_isdead = false;
ALF_actionID_Blesse = -1;

alf_ms_bpm = 80;
alf_ms_mmHg = 120;
alf_ms_resp = 15;
alf_ms_spo2 = 97;
alf_ms_pain = 0;
alf_ms_bleeding = false;
alf_ms_bouteille = false;

alf_deseases = [];
alf_medecine = [];
alf_vaccins = [];
alf_ordonnance = [0, 0];

/*
*****************************
**** Craft Variables *****
*****************************
*/

alf_craft_moi = [];
alf_craft_table = [];

/*
*****************************
**** internet Variables *****
*****************************
*/

alf_shop_panier = [];

/*
*****************************
**** inspectTel Variables *****
*****************************
*/

ALF_inspectTelMarker = "";
ALF_inspectTeltime = time;

/*
*****************************
**** Bracelet Electronique Variables *****
*****************************
*/

ALF_Bracelettime = 0;
ALF_Bracelet = false;

/*
*****************************
**** Viande Variables *****
*****************************
*/

ALF_PoserViandeObject = objNull;
ALF_PoserViandeActive = false;
ALF_EventHandlerPoserViande = -1;
ALF_PoserViandeBBQ = objNull;

/*
*****************************
**** PoserChargePorte Variables *****
*****************************
*/

ALF_PoserChargeObject = objNull;
ALF_PoserPerceuseActive = false;
ALF_PoserChargeActive = false;
ALF_EventHandlerPoserCharge = -1;
ALF_PoserChargeHouse = objNull;

/*
*****************************
**** Prison Variables *****
*****************************
*/

ALF_timePrison = 0;
ALF_Prison = false;
ALF_Prison_Coffre = 0;

/*
*****************************
**** Essence Variables *****
*****************************
*/

ALF_ActivePrisepistolet = false;

/*
*****************************
**** Animation Variables *****
*****************************
*/

ALF_Animation = false;

/*
*****************************
**** Markers Variables *****
*****************************
*/

alf_dynamic_markers = [];

/*
*****************************
**** Business Variables *****
*****************************
*/

alf_b_level = 1;
b_0 = false;
b_1 = false;
b_2 = false;
b_3 = false;
b_4 = false;
b_5 = false;
b_6 = false;
b_7 = false;
b_8 = false;
b_9 = false;
b_10 = false;
b_11 = false;
b_12 = false;
b_13 = false;
b_14 = false;
b_15 = false;
b_16 = false;
b_17 = false;
b_18 = false;
b_19 = false;
b_20 = false;
b_21 = false;
b_22 = false;
b_23 = false;
b_24 = false;

/*
*****************************
**** Frequences Variables *****
*****************************
*/
ALF_Sony_Freq = 0;
ALF_Sony_FreqAdd = 0;
ALF_iPhone_Freq = 0;

/*
*****************************
****** Life Variables *******
*****************************
*/
ALF_count_Cops = 0;
ALF_count_Meds = 0;
ALF_count_Penit = 0;

life_pompier_service = false;
life_gendarme_service = false;
life_publique_service = false;
life_penit_service = false;

alf_gendarmerie_command = false;

ALF_House_Data = [];
ALF_Mobilier_Data = [];

ALF_itstimetoloadTFAR = false;

life_query_time = time;
life_action_delay = time;
life_vehicle_action = objNull;
life_session_completed = false;
life_garage_store = false;
life_session_tries = 0;
life_clothing_filter = 0;
life_action_inUse = false;
alf_object = objNull;
life_knockout = false;
life_interrupted = false;
life_respawned = false;
tawvd_addon_disable = true;
life_save_gear = [];

life_mobilier_active = false;
life_mobilier_activeObj = objNull;
life_mobilier_activeHouse = objNull;
life_mobilier_activeMun = "";
life_mobilier_activename = "";
life_mobilier_activePos = [];
life_mobilier_activeDir = 0;

life_disable_getin = false;
life_disable_getout = false;
life_preview_3D_vehicle_cam = objNull;
life_preview_3D_vehicle_object = objNull;
life_preview_light = objNull;
life_pos_exist = false;
life_pos_attach = [];
life_civ_position = [];
life_markers = false;
life_fadeSound = false;
life_permis_action = false;
life_permis_time = false;
life_firenozzle = false;
jesuisassis = false;
life_firstCombatActive = false;
life_combattime = time;
life_ilyadeladn = false;
action_adn = false;
alf_brancard = objNull;
alf_admin_btn = false;
alf_admin_invi = false;

alf_organe = 0;

alf_gearsave = false;
alf_mobiliersave = false;
alf_moneysave = false;

life_killer = "";
life_lastShooter = objNull;
life_lastWShooter = [];

// Phone System
ALF_forfait = -1;
ALF_Phone_Number = "";

ALF_Phone_callnumber = "";
ALF_Phone_callAnonyme = false;

ALF_Phone_incall = false;
ALF_Phone_Ring = false;
ALF_Phone_trycall = false;
ALF_Phone_Avion = false;
ALF_Phone_Mute = false;
ALF_Phone_SMS = false;
ALF_Phone_Anonyme = false;
ALF_Phone_Historique = [];
ALF_Central = false;
ALF_PhoneObject = objNull;

// Phone radio
life_radio_connected = false;

// TFAR Speackers
megaphone_speaking = false;
airradio_speaking = false;

// System Message
message1_active = false;
message2_active = false;
message3_active = false;
message4_active = false;
message5_active = false;
message6_active = false;
message1_smsactive = false;
message2_smsactive = false;
message3_smsactive = false;
message4_smsactive = false;
message1_copactive = false;
message2_copactive = false;
message3_copactive = false;
message4_copactive = false;
messagecallin_active = false;
messagebfm_active = false;
hud_xp_active = false;

// init iPhone
iPhone_Mute = false;
iPhone_Speackers = false;

// init Farming System
life_hit_time = time;
life_attachObject = false;
life_ALF_Hit = 0;

// settings
life_settings_viewDistanceFoot = GVAR_PNAS["life_viewDistanceFoot", 500];
life_settings_viewDistanceCar = GVAR_PNAS["life_viewDistanceCar", 800];
life_settings_viewDistanceAir = GVAR_PNAS["life_viewDistanceAir", 2500];

// uniform price (0), Hat Price (1), Glasses Price (2), vest Price (3), backpack Price (4)
life_clothing_purchase = [-1, -1, -1, -1, -1];

/*
*****************************
****** Life Variables *******
*****************************
*/
life_playerfirstjoinserver = false;
life_use_atm = true;
life_is_alive = false;
life_thirst = 100;
life_hunger = 100;
alf_drug = 0;
life_drunk = 0;
life_cash = 0;
life_permis = 0;
ALF_Playtime = 0;

life_adminlevel = 0;
life_donor = false;
life_duredon = 0;
life_coplevel = 0;
life_medicLevel = 0;
life_publique = 0;
life_penit = 0;

// Contacts System
life_contacts = [];

// Assurances
life_axa = 0;
life_axacount = 0;
life_axaprocount = 0;
life_axabank = 0;

// Bank System + Hsbc
life_livreta = 0;
life_livretb = 0;
life_livretc = 0;
life_laactive = false;
life_lbactive = false;
life_lcactive = false;
life_activecb = 0;

life_hsbc = 0;
life_hsbcactive = false;

life_istazed = false;
life_isknocked = false;
life_vehicles = [];

/* setup license */
{
    _varname = gettext(_x >> "variable");
    SVAR_MNS [LICENSE_VARname(_varname), false];
} forEach ("true" configClasses (missionConfigFile >> "Licenses"));