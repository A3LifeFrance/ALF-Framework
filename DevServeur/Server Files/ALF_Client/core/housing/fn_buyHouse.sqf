#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_buyHouse.sqf
	Author: Bryan "Tonic" Boardwine
*/

_house = param [0,objNull,[objNull]];
private _uid = getPlayerUID player;

if (isNull _house) exitWith {};
if !(_house isKindOf "House_F") exitWith {};
if !(isNil {_house getVariable "ALF_PorteFermer"}) exitWith {hint localize "STR_House_alreadyOwned";};
if !(license_home) exitWith {hint localize "STR_House_License"};
if (count life_houses >= (LIFE_SETTINGS(getNumber,"house_limit"))) exitWith {hint format[localize "STR_House_Max_House",LIFE_SETTINGS(getNumber,"house_limit")]};
if ((typeOf(_house) isEqualTo "Land_i_Shed_Ind_F") && count(nearestObjects[player, ["Land_tailleuse","Tank"], 60]) > 0) exitWith {["ERREUR","Ce batiment est interdit à l'achat.","warning"] spawn ALF_fnc_doMsg;};
closeDialog 0;

private _houseCfg = [(typeOf _house)] call life_fnc_houseConfig;
if(EQUAL(count _houseCfg,0)) exitWith {};

private _action = [
	format[localize "STR_House_BuyMSG",
	[(_houseCfg select 0)] call life_fnc_numberText,
	(_houseCfg select 1)],localize "STR_House_Purchase",localize "STR_Global_Buy",localize "STR_Global_Cancel"
] call BIS_fnc_guiMessage;

if(_action) then {
	private _handle = [(_houseCfg select 0),false] call ALF_fnc_handleCB;
	if (_handle) exitWith {};

	[_uid,_house,profileName] remoteExec ["HC_fnc_addHouse",HC2_Life];
	[0] call SOCK_fnc_updatePartial;

	[name player,getPlayerUID player,"MAISON",format["A acheté un bien pour %1€ | POS : %2 | MAISON : %3.",(_houseCfg select 0), getPos _house, typeOf _house]] remoteExec ["HC_fnc_logIt",HC3_Life];

	_house setVariable ["uid",floor(random 99999)];

	life_vehicles pushBack _house;
	life_houses pushBack (str(getPosATL _house));
	private _marker = createMarkerLocal [format["house_%1",(_house GVAR "uid")],getPosATL _house];
	private _houseName = FETCH_CONFIG2(getText,CONFIG_VEHICLES,(typeOf _house), "displayName");
	_marker setMarkerTextLocal _houseName;
	_marker setMarkerColorLocal "ColorBlue";
	_marker setMarkerTypeLocal "loc_Lighthouse";

	_house setVariable ["ALF_PorteFermer",true,true];
};