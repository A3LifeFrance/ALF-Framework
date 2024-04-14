/*
	File: fn_houseConfig.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master config file for buyable houses?
*/
params [
	["_house","",[""]]
];
if(_house isEqualTo "") exitWith {[]};
/*
	Return Format:
	[price,# of containers allowed,XP]
*/
switch (true) do {
	case (_house in ["Land_ALF_Caravane"]): {[35000,1,35]};
	case (_house in ["Land_i_Garage_V1_F","Land_i_Garage_V2_F"]): {[45000,2,40]};
	case (_house in ["Land_House_Small_02_F"]): {[60000,8,60]};
	case (_house in ["Land_House_Small_01_F","Land_House_Small_03_F","Land_House_Small_06_F","Land_House_Small_04_F","Land_House_Small_05_F","Land_i_House_Small_01_b_brown_F"]): {[90000,9,80]};
	case (_house in ["Land_i_House_Small_01_V1_F","Land_i_House_Small_01_V2_F","Land_i_House_Small_01_V3_F","Land_House_Big_01_F"]): {[100000,10,100]};
	case (_house in ["Land_i_House_Small_02_V1_F","Land_i_House_Small_02_V2_F","Land_i_House_Small_02_V3_F"]): {[105000,12,100]};
	case (_house in ["Land_i_House_Small_02_b_blue_F","Land_i_House_Small_02_b_brown_F","Land_i_House_Small_02_b_pink_F","Land_i_House_Small_02_b_white_F","Land_i_House_Small_02_b_whiteblue_F","Land_i_House_Small_02_b_yellow_F"]): {[105000,12,100]};
	case (_house in ["Land_i_House_Small_03_V1_F"]): {[110000,14,125]};
	case (_house in ["Land_i_Stone_HouseSmall_V2_F","Land_i_Stone_HouseSmall_V1_F","Land_i_Stone_HouseSmall_V3_F","Land_House_Big_05_F"]): {[160000,16,150]};
	case (_house in ["Land_Addon_04_F"]): {[160000,16,150]};
	case (_house in ["Land_ALF_AppartementDroite","Land_ALF_AppartementGauche"]): {[200000,16,150]};
	case (_house in ["Land_ALF_MaisonMetal","Land_ALF_MaisonMetal_Blanc","Land_ALF_MaisonMetal_Verte","Land_ALF_MaisonMetal_Rouge","Land_ALF_MaisonMetal_Grise"]): {[225000,18,150]};
	case (_house in ["Land_i_House_Big_02_V1_F","Land_i_House_Big_02_V2_F","Land_i_House_Big_02_V3_F","Land_House_Big_02_F","Land_i_House_Big_02_b_blue_F","Land_i_House_Big_02_b_white_F","Land_i_House_Big_02_b_whiteblue_F","Land_i_House_Big_02_b_yellow_F","Land_i_House_Big_02_b_brown_F","Land_i_House_Big_02_b_pink_F"]): {[250000,18,175]};
	case (_house in ["Land_HouseA","Land_HouseB","Land_HouseC","Land_HouseD"]): {[260000,20,200]};
	case (_house in ["Land_i_House_Big_01_V1_F","Land_i_House_Big_01_V2_F","Land_i_House_Big_01_V3_F","Land_House_Big_03_F","Land_House_Big_04_F","Land_i_House_Big_01_b_white_F","Land_i_House_Big_01_b_brown_F","Land_i_House_Big_01_b_blue_F","Land_i_House_Big_01_b_whiteblue_F","Land_i_House_Big_01_b_pink_F","Land_i_House_Big_01_b_yellow_F"]): {[270000,22,250]};
	case (_house in ["Land_Hotel_02_F"]): {[400000,25,250]};
	case (_house in ["Land_ALF_MaisonMitoyenne","Land_ALF_MaisonMitoyenne1"]): {[500000,30,350]};
	case (_house in ["Land_ALF_MaisonModerne","Land_ALF_MaisonModerne_Blanc","Land_ALF_MaisonModerne_Verte","Land_ALF_MaisonModerne_Rouge","Land_ALF_MaisonModerne_Grise"]): {[1500000,45,1000]};
	case (_house in ["Land_ALF_MaisonContemporaine"]): {[1800000,45,1000]};
	case (_house in ["Land_ALF_Villa_F"]): {[2000000,30,1000]};
	case (_house in ["Land_i_Shed_Ind_F"]): {[600000,40,20]};
	case (_house in ["Land_ALF_NightClub"]): {[500000,100,1000]};
	default {[]};
};