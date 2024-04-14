#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_vehicleShopMenu.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Blah
*/
private["_shop","_sideCheck","_spawnPoints","_shopTitle"];
(SEL(_this,3)) params [
	["_shop","",[""]],
	["_spawnPoints","",["",[]]],
	["_shopTitle","",[""]]
];

disableSerialization;
//Long boring series of checks
if(dialog) exitWith {};
if(_shop isEqualTo "") exitWith {};
if(_shop in ["cop","cop_heli","shipg"] && {life_coplevel < 7}) exitWith {["INFO","Tu n'as pas accès a ceci.","warning"] spawn ALF_fnc_doMsg;};
if(_shop in ["pompier","pompier_heli","shipp"] && {life_mediclevel < 9}) exitWith {["INFO","Tu n'as pas accès a ceci.","warning"] spawn ALF_fnc_doMsg;};

if(!createDialog "Life_Vehicle_Shop_v2") exitWith {};

life_veh_shop = [_shop,_spawnPoints];

ctrlSetText [2301,_shopTitle];
ctrlEnable [2309,false];

private _display = findDisplay 2300;
private _btnbuy = _display displayCtrl 2309;
if(_shop in ["cop","cop_heli","shipg"]) then {
	_btnbuy buttonSetAction "[-1] spawn life_fnc_vehicleShopBuyCopSP;";
} else {
	if(_shop in ["pompier","pompier_heli","shipp"]) then {
		_btnbuy buttonSetAction "[-2] spawn life_fnc_vehicleShopBuyCopSP;";
	} else {
		_btnbuy buttonSetAction "[] spawn life_fnc_vehicleShopBuy;";
	};
};

//Fetch the shop config.
_vehicleList = M_CONFIG(getArray,"CarShops",_shop,"vehicles");

_control = CONTROL(2300,2302);
lbClear _control; //Flush the list.

//Loop through
{
	_className = SEL(_x,0);
	_levelAssert = SEL(_x,1);
	_levelName = SEL(_levelAssert,0);
	_levelType = SEL(_levelAssert,1);
	_levelValue = SEL(_levelAssert,2);
	_licValue = SEL(_x,2);
	_showall = true;

	if(_licValue isEqualTo "") then {
		if(!(EQUAL(_levelValue,-1))) then {
			_level = GVAR_MNS _levelName;
			if(_level isEqualType {}) then {_level = call _level;};
			_showall = switch(_levelType) do {
				case "SCALAR": {_level >= _levelValue};
				case "BOOL": {_level};
				case "EQUAL": {EQUAL(_level,_levelValue)};
				default {false};
			};
		};
	} else {
		_level = LICENSE_VALUE(_licValue);
		if !(_level) then {_showall = false;};
	};

	if(_showall) then {
		_vehicleInfo = [_className] call life_fnc_fetchVehInfo;
		_control lbAdd (_vehicleInfo select 3);
		_control lbSetPicture [(lbSize _control)-1,(_vehicleInfo select 2)];
		_control lbSetData [(lbSize _control)-1,_className];
		_control lbSetValue [(lbSize _control)-1,_ForEachIndex];
	};
} forEach _vehicleList;
lbSort _control;

[] call life_fnc_vehicleShopInit3DPreview;
((findDisplay 2300) displayCtrl 2302) lbSetCurSel 0;
