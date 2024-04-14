#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_vehicleShopBuy.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Does something with vehicle purchasing.
*/
if((time - life_action_delay) < 0.5) exitWith {["INFO", "Tu appuis trop vite.", "warning"] spawn ALF_fnc_doMsg;};
life_action_delay = time;

private _exit = false;
private _className = lbData[2302,(lbCurSel 2302)];
private _vIndex = lbValue[2302,(lbCurSel 2302)];
private _classNameLife = _className;
private _vehicleList = M_CONFIG(getArray,"CarShops",SEL(life_veh_shop,0),"vehicles");
private _licenses = M_CONFIG(getText,CONFIG_LIFE_VEHICLES,_classNameLife,"licenses");
private _purchasePrice = M_CONFIG(getNumber,CONFIG_LIFE_VEHICLES,_classNameLife,"achat");

if !(_licenses isEqualTo "") then {
	if !(LICENSE_VALUE(_licenses)) then {_exit = true;};
};
if(_exit) exitWith {["INFO", "Tu n'as pas la licence requise.", "warning"] spawn ALF_fnc_doMsg; closeDialog 0;};
if(_purchasePrice < 0) exitWith {closeDialog 0;}; //Bad price entry

private _spawnPoints = life_veh_shop select 1;
private _spawnPoint = "";

if ((life_veh_shop select 0) in ["pompier_heli","cop_heli"]) then {
	if (((getMarkerPos _spawnPoints) nearEntities [["Air"],35]) isEqualTo []) exitWith {_spawnPoint = _spawnPoints};
} else {
	if (((getMarkerPos _spawnPoints) nearEntities [["Car","Ship","Air"],5]) isEqualTo []) exitWith {_spawnPoint = _spawnPoints};
};
if(_spawnPoint isEqualTo "") exitWith {["INFO", "Un véhicule gène le point de spawn.", "warning"] spawn ALF_fnc_doMsg; closeDialog 0;};

if(_purchasePrice > life_cash) then {
	private _handle = [_purchasePrice,false] call ALF_fnc_handleCB;
	if(_handle) exitWith {closeDialog 0; _exit = true;};
	[name player,getPlayerUID player,"VEHICULE",format["A acheté %1 pour %2€ par carte.",getText(configFile >> "CfgVehicles" >> _className >> "displayName"),[_purchasePrice] call life_fnc_numberText]] remoteExec ["HC_fnc_logIt",HC3_Life];
} else {
	life_cash = life_cash - _purchasePrice;
	[0] call SOCK_fnc_updatePartial;
	[name player,getPlayerUID player,"VEHICULE",format["A acheté %1 pour %2€ en cash | CASH apres achat : %3€.",getText(configFile >> "CfgVehicles" >> _className >> "displayName"),[_purchasePrice] call life_fnc_numberText, life_cash]] remoteExec ["HC_fnc_logIt",HC3_Life];
};
if(_exit) exitWith {closeDialog 0;};

private _color = "";
if (M_CONFIG(getNumber,"LifeCfgVehicles",_className,"textures") in [1,2]) then {
	_color = lbData[2304,(lbCurSel 2304)];
};

closeDialog 0;

["INFO", format["Merci d'avoir acheté chez nous. Détail de votre commande: %1 pour %2€",getText(configFile >> "CfgVehicles" >> _className >> "displayName"),[_purchasePrice] call life_fnc_numberText], "success"] spawn ALF_fnc_doMsg;

private _havok = ["V_ALF_Havok_Yellow","V_ALF_Havok_Silver","V_ALF_Havok_Red","V_ALF_Havok_Purple","V_ALF_Havok_Pink","V_ALF_Havok_Orange","V_ALF_Havok_Green","V_ALF_Havok_Darkred","V_ALF_Havok_Darkgreen","V_ALF_Havok_Blue","V_ALF_Havok_White","V_ALF_Havok_Black"];
private _ec145 = ["V_ALF_EC145_Yellow","V_ALF_EC145_Silver","V_ALF_EC145_Red","V_ALF_EC145_Purple","V_ALF_EC145_Pink","V_ALF_EC145_Orange","V_ALF_EC145_Green","V_ALF_EC145_Darkred","V_ALF_EC145_Darkgreen","V_ALF_EC145_Blue","V_ALF_EC145_White","V_ALF_EC145_Black"];
private _ec135 = ["V_ALF_EC135_Gendarmerie"];
private _pw207 = ["V_ALF_PW207_Yellow","V_ALF_PW207_Silver","V_ALF_PW207_Red","V_ALF_PW207_Purple","V_ALF_PW207_Pink","V_ALF_PW207_Orange","V_ALF_PW207_Green","V_ALF_PW207_Darkred","V_ALF_PW207_Darkgreen","V_ALF_PW207_Blue","V_ALF_PW207_White","V_ALF_PW207_Black","V_ALF_PW207_Pompier"];

private _vehicle = _className createVehicle [0,0,1000];
_vehicle allowDamage false; //Temp disable damage handling..

if ((life_veh_shop select 0) in ["pompier_heli","cop_heli","civ_heli"]) then {
	_hs = nearestObjects[getMarkerPos _spawnPoint,["Land_HeliPad"],30] select 0;

	switch (true) do { 
		case (_className in _havok) : {_vehicle setPosATL (_hs modelToWorld [0,-1,0.35]);}; 
		case (_className in _ec145) : {_vehicle setPosATL (_hs modelToWorld [0,-1,0.35]);};
		case (_className in _ec135) : {_vehicle setPosATL (_hs modelToWorld [0,-1.5,0.35]);};
		case (_className in _pw207) : {_vehicle setPosATL (_hs modelToWorld [0,2,0.35]);};
		default {_vehicle setPosATL (_hs modelToWorld [0,2,0.35]);};
	};

	_vehicle setDir (getDir _hs);
	sleep 0.6;
} else {
	_vehicle setPos (getMarkerPos _spawnPoint);
	_vehicle setVectorUp (surfaceNormal (getMarkerPos _spawnPoint));
	_vehicle setDir (markerDir _spawnPoint);
};

_vehicle lock 2;
if (_color != "") then {
	_vehicle setObjectTextureGlobal [0,_color];
};
[_vehicle] call life_fnc_clearVehicleAmmo;
_vehicle addMagazineCargoGlobal ["ALF_Roue",1];
_vehicle setVariable["vehicle_info_owners",getPlayerUID player,true];
_vehicle disableTIEquipment true;
_vehicle animateSource ["assu", 1, true];
_vehicle animateSource ["tracker", 1, true];

if(_className in ["V_ALF_Megane_G_Gendarmerie","V_ALF_Focus_Gendarmerie","V_ALF_Berlingo_Gendarmerie","V_ALF_Subaru_Gendarmerie","V_ALF_GIGN","V_ALF_RS_01_Gendarmerie","V_ALF_Titan_Gendarmerie","V_ALF_DV15_Gendarmerie","V_ALF_Vito_Gendarmerie","V_ALF_Passat_GND"]) then {
	_vehicle setVariable ["TF_RadioType", "alf_megaphone", true];
	{_vehicle setHit[_x,1];} forEach ["lightg01_h","lightg02_h","lightg03_h","lightg04_h","lightg05_h","lightg06_h","lightg07_h","lightg08_h"];
};

if(_vehicle isKindOf "Air") then {
	_vehicle setVariable ["TF_RadioType", "alf_radioheli", true];
	private _freq = random[1000, 5000, 9999];
	_vehicle setVariable ["helicofreq", _freq, true];
};

[_vehicle,true] remoteExecCall ["enableDynamicSimulation",HC3_Life];
_vehicle allowDamage true;

life_vehicles pushBack _vehicle;

[(getPlayerUID player),_vehicle,player,_color] remoteExec ["HC_fnc_vehicleCreate",HC2_Life];

true;