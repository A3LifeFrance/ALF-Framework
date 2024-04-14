/*
	File: fn_lightHouse.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Tells clients to either turn the lights on for that house
	or off.
*/
private["_lightSource","_exit"];
params [
	["_house",objNull,[objNull]],
	["_mode",false,[false]]
];

if(isNull _house) exitWith {};
if(!(_house isKindOf "House_F")) exitWith {};

_exit = false;
if(_mode) then {
	_lightSource = "#lightpoint" createVehicleLocal [0,0,0];

	switch(true) do {
		case ((typeOf _house) in ["Land_House_Small_02_F","Land_House_Small_01_F","Land_House_Small_03_F","Land_House_Small_06_F","Land_House_Small_04_F","Land_House_Small_05_F","Land_i_House_Small_01_b_brown_F","Land_ALF_Caravane","Land_i_Garage_V1_F","Land_i_Garage_V2_F","Land_HouseA","Land_HouseB","Land_HouseC","Land_HouseD","Land_Hotel_02_F","Land_i_Stone_HouseSmall_V2_F","Land_i_Stone_HouseSmall_V1_F","Land_i_Stone_HouseSmall_V3_F"]): {_lightSource lightAttachObject [_house,[0,0,2.4]];};
		case ((typeOf _house) in ["Land_i_House_Big_01_V1_F","Land_i_House_Big_01_V2_F","Land_i_House_Big_01_V3_F","Land_House_Big_03_F","Land_i_House_Big_01_b_white_F","Land_i_House_Big_01_b_brown_F","Land_i_House_Big_01_b_blue_F","Land_i_House_Big_01_b_whiteblue_F","Land_i_House_Big_01_b_pink_F"]): {_lightSource lightAttachObject [_house,[0,-2,3.8]];};
		case ((typeOf _house) in ["Land_i_House_Big_02_V1_F","Land_i_House_Big_02_V2_F","Land_i_House_Big_02_V3_F","Land_House_Big_02_F","Land_i_House_Big_02_b_blue_F","Land_i_House_Big_02_b_white_F","Land_i_House_Big_02_b_whiteblue_F","Land_i_House_Big_02_b_yellow_F","Land_i_House_Big_02_b_brown_F","Land_i_House_Big_02_b_pink_F"]): {_lightSource lightAttachObject [_house,[2,0,3.5]];};
		case ((typeOf _house) in ["Land_i_House_Small_01_V1_F","Land_i_House_Small_01_V2_F","Land_i_House_Small_01_V3_F","Land_House_Big_01_F"]): {_lightSource lightAttachObject [_house,[-1.5,0,2]]};
		case ((typeOf _house) in ["Land_i_House_Small_02_V1_F","Land_i_House_Small_02_V2_F","Land_i_House_Small_02_V3_F"]): {_lightSource lightAttachObject [_house,[2,0,2.4]]};
		case ((typeOf _house) in ["Land_i_House_Small_03_V1_F","Land_i_House_Small_03_V3_F"]): {_lightSource lightAttachObject [_house,[-3.3,1,2.5]]};
		case ((typeOf _house) in ["Land_ALF_Villa_F"]): {_lightSource lightAttachObject [_house,[-3.3,1,2.5]]};
		case ((typeOf _house) in ["Land_ALF_MaisonMetal","Land_ALF_MaisonMetal_Blanc","Land_ALF_MaisonMetal_Verte","Land_ALF_MaisonMetal_Rouge","Land_ALF_MaisonMetal_Grise","Land_ALF_MaisonMitoyenne","Land_ALF_MaisonMitoyenne1"]): {_lightSource lightAttachObject [_house,[-3.3,1,2.5]];};
		case ((typeOf _house) in ["Land_ALF_MaisonModerne","Land_ALF_MaisonModerne_Blanc","Land_ALF_MaisonModerne_Verte","Land_ALF_MaisonModerne_Rouge","Land_ALF_MaisonModerne_Grise","Land_ALF_MaisonContemporaine"]): {_lightSource lightAttachObject [_house,[-3.3,1,2.5]];};
		default {_exit = true;};
	};
	if(_exit) exitWith {deleteVehicle _lightSource;};

	_lightSource setLightColor [250,150,50];
	_lightSource setLightAmbient [1,1,0.2];
	_lightSource setLightAttenuation [1,0,0,0];
	_lightSource setLightIntensity 10;
	_lightSource setLightUseFlare true;
	_lightSource setLightFlareSize 0.2;
	_lightSource setLightFlareMaxDistance 50;
	_house setVariable ["lightSource",_lightSource];
} else {
	if(isNull (_house getVariable["lightSource",objNull])) exitWith {};
	deleteVehicle (_house getVariable["lightSource",objNull]);
};