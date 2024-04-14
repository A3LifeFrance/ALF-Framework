#include "\ALF_Client\script_macros.hpp"
/*
File: fn_loadLeboncoin.sqf
Author: ALF Team
*/
if !(uiNamespace getVariable ['internetmenu',0] isEqualTo 9) exitWith {};
private["_vehs","_position","_house","_houseName","_list","_btn"];
_vehs = _this select 0;

disableSerialization;
_list = ((findDisplay 24500) displayCtrl 24532);
lbClear _list;

{
	private _lenght = count(toArray(_x select 4));
	if !(_lenght isEqualTo 9) then {
		_vehicleInfo = [_x select 1] call life_fnc_fetchVehInfo;
		_list lbAdd (_vehicleInfo select 3);
		_tmp = [_x select 0,_x select 1,_x select 2,_x select 3];
		_tmp = str(_tmp);
		_list lbSetData [(lbSize _list)-1,_tmp];
		_list lbSetPicture [(lbSize _list)-1,_vehicleInfo select 2];
	};
} forEach _vehs;

{
	_position = call compile format["%1",_x];
	_house = nearestObject [_position, "House"];
	_houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");

	_list lbAdd format["%1",_houseName];
	_list lbSetdata [(lbSize _list)-1,format["%1",_position]];
} forEach life_houses;
lbSort _list;

((findDisplay 24500) displayCtrl 24532) lbSetCurSel 0;

_btn = ((findDisplay 24500) displayCtrl 24530);
_btn ctrlShow true;
_btn buttonSetAction "uiNamespace setVariable ['internetmenu',8]; [] call ALF_fnc_menuInternet;";
