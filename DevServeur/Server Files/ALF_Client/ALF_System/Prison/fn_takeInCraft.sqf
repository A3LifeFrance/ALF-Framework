#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_menuCraft.sqf
	Author: ALF Team
*/
disableSerialization;
if((lbCurSel 156534) isEqualTo -1) exitWith {};

private _display = findDisplay 156532;
private _listmoi = _display displayCtrl 156533;
private _listtable = _display displayCtrl 156534;
private _item = lbData[156534,(lbCurSel 156534)];
private _btnTake = _display displayCtrl 156536;
private _btncraft = _display displayCtrl 156537;
_btnTake ctrlEnable false;
_btncraft ctrlEnable false;

alf_craft_moi pushBack _item;
alf_craft_table deleteAt (alf_craft_table find _item);

lbClear _listmoi;
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

lbClear _listtable;
_listedItems = [];
{
	if(!(_x in _listedItems) && {_x != ""}) then {
		private _itemInfo = [_x] call life_fnc_fetchCfgDetails;
		_listedItems pushBack _x;
		private _itemCount = {_x isEqualTo (_itemInfo select 0)} count alf_craft_table;
		if(_itemCount > 1) then {
			_listtable lbAdd format["[x%2] %1",_itemInfo select 1,_itemCount];
		} else {
			_listtable lbAdd format["%1",_itemInfo select 1];
		};
		_listtable lbSetData[(lbSize _listtable)-1,_x];
		_listtable lbSetPicture[(lbSize _listtable)-1,_itemInfo select 2];
	};
} forEach alf_craft_table;

_btnTake ctrlEnable true;

//Système pour voir si on active le btn crafter
private _p = 0;
private _n = 0;
private _v = 0;
private _bc = 0;
private _f = 0;
private _bn = 0;
private _pm = 0;
private _eau = 0;
private _bois = 0;
private _coc = 0;
private _son = 0;
private _pio = 0;
private _pech = 0;
private _coca = 0;
private _cui = 0;
private _mais = 0;
private _fraise = 0;

//On comptabilise les items
{
	switch (_x) do {
		case "ALF_pierre_small": {
			_p = _p + 1;
		};
		case "ALF_Sonnette4G": {
			_son = _son + 1;
		};
		case "ALF_Vodka": {
			_v = _v + 1;
		};
		case "ALF_BaconT": {
			_bc = _bc + 1;
		};
		case "ALF_Fer": {
			_f = _f + 1;
		};
		case "ALF_Banane": {
			_bn = _bn + 1;
		};
		case "ALF_Pomme": {
			_pm = _pm + 1;
		};
		case "ALF_WaterB_G": {
			_eau = _eau + 1;
		};
		case "ALF_Buche": {
			_bois = _bois + 1;
		};
		case "ALF_Cocaine": {
			_coc = _coc + 1;
		};
		case "ALF_Pioche": {
			_pio = _pio + 1;
		};
		case "ALF_Peche": {
			_pech = _pech + 1;
		};
		case "ALF_coca": {
			_coca = _coca + 1;
		};
		case "ALF_Cuivre": {
			_cui = _cui + 1;
		};
		case "ALF_Mais": {
			_mais = _mais + 1;
		};
		case "ALF_Fraise": {
			_fraise = _fraise + 1;
		};
	};
	if(_x find "alf_3310" > -1) then {
		_n = _n + 1;
	};
} forEach alf_craft_table;

//On check si on peut crafter
if (_type isEqualTo 1) then { //Boulangerie
	//Tarte pommes
	if(_mais >= 1 && {_pm >= 3}) exitWith {
		_btncraft ctrlEnable true;
		_btncraft buttonSetAction "[9] call ALF_fnc_craftItem; closeDialog 0;";
	};
	//Tarte fraises
	if(_mais >= 1 && {_fraise >= 3}) exitWith {
		_btncraft ctrlEnable true;
		_btncraft buttonSetAction "[10] call ALF_fnc_craftItem; closeDialog 0;";
	};
	//Confiture pommes
	if(_pm >= 4) exitWith {
		_btncraft ctrlEnable true;
		_btncraft buttonSetAction "[11] call ALF_fnc_craftItem; closeDialog 0;";
	};
	//Confiture fraises
	if(_fraise >= 4) exitWith {
		_btncraft ctrlEnable true;
		_btncraft buttonSetAction "[12] call ALF_fnc_craftItem; closeDialog 0;";
	};
} else { //Prison
	//C4
	if(_n >= 1 && {_v >= 2} && {_son >= 1}) exitWith {
		_btncraft ctrlEnable true;
		_btncraft buttonSetAction "[0] call ALF_fnc_craftItem; closeDialog 0;";
	};
	//Ciseaux inox
	if(_p >= 1 && {_bc >= 2} && {_f >= 1} && {_eau >= 2}) exitWith {
		_btncraft ctrlEnable true;
		_btncraft buttonSetAction "[1] call ALF_fnc_craftItem; closeDialog 0;";
	};
	//Vodka
	if(_bn >= 1 && {_pm >= 3} && {_eau >= 1}) exitWith {
		_btncraft ctrlEnable true;
		_btncraft buttonSetAction "[2] call ALF_fnc_craftItem; closeDialog 0;";
	};
	//Batte
	if(_p >= 1 && {_bois >= 3}) exitWith {
		_btncraft ctrlEnable true;
		_btncraft buttonSetAction "[3] call ALF_fnc_craftItem; closeDialog 0;";
	};
	//couteau
	if(_p >= 1 && {_f >= 1} && {_bc >= 5}) exitWith {
		_btncraft ctrlEnable true;
		_btncraft buttonSetAction "[4] call ALF_fnc_craftItem; closeDialog 0;";
	};
	//coco
	if(_bn >= 2 && {_coc >= 1}) exitWith {
		_btncraft ctrlEnable true;
		_btncraft buttonSetAction "[5] call ALF_fnc_craftItem; closeDialog 0;";
	};
	//pioche
	/*
	if(_pio >= 1 && {_pech >= 1} && {_bn >= 2} && {_bc >= 2}) exitWith {
		_btncraft ctrlEnable true;
		_btncraft buttonSetAction "[6] call ALF_fnc_craftItem; closeDialog 0;";
	};
	*/
	//piege
	if(_cui >= 2 && {_coca >= 4} && {_n >= 1} && {_v >= 2}) exitWith {
		_btncraft ctrlEnable true;
		_btncraft buttonSetAction "[8] call ALF_fnc_craftItem; closeDialog 0;";
	};
	//safe
	if(_cui >= 2 && {_coca >= 4}) exitWith {
		_btncraft ctrlEnable true;
		_btncraft buttonSetAction "[7] call ALF_fnc_craftItem; closeDialog 0;";
	};
};