#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_keyDrop.sqf
	Author: ALF Team
	Description:

*/
private["_dialog","_list","_sel","_vehicle","_impounded","_owners","_index","_index2","_i"];
disableSerialization;

_dialog = findDisplay 123450;
_list = _dialog displayCtrl 123457;
_sel = lbCurSel _list;
if(_sel isEqualTo -1) exitWith {hint localize "STR_NOTF_noDataSelected";};
if((_list lbData _sel) isEqualTo "") exitWith {hint localize "STR_NOTF_didNotSelectVehicle";};
_index = (parseNumber(_list lbData _sel));
_vehicle = life_vehicles select _index;
if(_vehicle isKindOf "House_F") exitWith {hint localize "STR_NOTF_cannotRemoveHouseKeys";};
life_vehicles deleteAt _index;

[] call ALF_fnc_menuY;
