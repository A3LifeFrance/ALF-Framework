#include "\ALF_Client\script_macros.hpp"
/*
File: fn_knabisList.sqf
Author: ALF Team
*/
private["_position","_house","_houseName","_houseList"];
disableSerialization;
_houseList = ((findDisplay 24500) displayCtrl 24509);
lbClear _houseList;
{
	_position = call compile format["%1",_x];
	_house = nearestObject [_position, "House"];
	_houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");

	_houseList lbAdd format["%1",_houseName];
	_houseList lbSetdata [(lbSize _houseList)-1,format["%1",_position]];
} forEach life_houses;

((findDisplay 24500) displayCtrl 24509) lbSetCurSel 0;
