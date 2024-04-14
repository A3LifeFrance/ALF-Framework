#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_menuCraft.sqf
	Author: ALF Team
*/
private _mode = _this select 3;

if(!dialog) then {createDialog "ALF_Craft_Prison"};

disableSerialization;

private _display = findDisplay 156532;
private _listmoi = _display displayCtrl 156533;
private _btnput = _display displayCtrl 156535;
private _btnTake = _display displayCtrl 156536;
private _btncraft = _display displayCtrl 156537;

_btncraft ctrlEnable false;

_btnput ctrlEnable true;
_btnput buttonSetAction format["[%1] call ALF_fnc_putInCraft;",_mode];

_btnTake ctrlEnable true;
_btnTake buttonSetAction format["[%1] call ALF_fnc_takeInCraft;",_mode];

lbClear _listmoi;

alf_craft_table = [];
alf_craft_moi = (assignedItems player) + (uniformItems player) + (vestItems player) + (backPackItems player) + [(primaryWeapon player)] + [(secondaryWeapon player)] + [(handgunWeapon player)];

private _listedItems = [];
{
	if(!(_x in _listedItems) && {_x != ""}) then {
		private _itemInfo = [_x] call life_fnc_fetchCfgDetails;
		_listedItems pushBack _x;
		private _itemCount = {_x isEqualTo (_itemInfo select 0)} count alf_craft_moi;
		if(_itemCount > 1) then {
			_listmoi lbAdd format["[x%2] %1",_itemInfo select 1,_itemCount];
		} else {
			_listmoi lbAdd format["%1",_itemInfo select 1];
		};
		_listmoi lbSetData[(lbSize _listmoi)-1,_x];
		_listmoi lbSetPicture[(lbSize _listmoi)-1,_itemInfo select 2];
	};
} forEach alf_craft_moi;
