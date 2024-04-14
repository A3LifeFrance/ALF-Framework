#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_sellHouse.sqf
	Author: Bryan "Tonic" Boardwine
	Modified : NiiRoZz

	Description:
	Sells the house and delete all mobilier near house.
*/
private["_house","_uid","_action","_houseCfg"];
_house = param [0,objNull,[objNull]];
_uid = getPlayerUID player;

if(isNull _house) exitWith {};
if(!(_house isKindOf "House_F")) exitWith {};
if(isNil {_house getVariable "ALF_PorteFermer"}) exitWith {hint localize "STR_House_noOwner";};
closeDialog 0;

_houseCfg = [(typeOf _house)] call life_fnc_houseConfig;
if(count _houseCfg isEqualTo 0) exitWith {};

_action = [
	format[localize "STR_House_SellHouseMSG",
	(round(SEL(_houseCfg,0)/2)) call life_fnc_numberText,
	SEL(_houseCfg,1)],localize "STR_pInAct_SellHouse",localize "STR_Global_Sell",localize "STR_Global_Cancel"
] call BIS_fnc_guiMessage;

if(_action) then {
	[_house] remoteExecCall ["HC_fnc_sellHouse",HC2_Life];

	deleteMarkerLocal format["house_%1",_house getVariable "uid"];
	_house setVariable ["uid",nil];

	life_cash = life_cash + (round((_houseCfg select 0)/2));
	[0] call SOCK_fnc_updatePartial;
	_index = life_vehicles find _house;

	if(_index != -1) then {
		life_vehicles deleteAt _index;
	};

	_index = life_houses find (str(getPosATL _house));
	if(_index != -1) then {
		life_houses deleteAt _index;
	};
	
	[name player,getPlayerUID player,"MAISON",format["A vendu un bien pour %1€ | POS : %2 | MAISON : %3.",(round((_houseCfg select 0)/2)), getPos _house, typeOf _house]] remoteExec ["HC_fnc_logIt",HC3_Life];

	[_house] remoteExecCall ["HC_fnc_sellHousemobilier",HC2_Life];
};
