#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_putInMobilier.sqf
	Author: ALF Team
*/
disableSerialization;
if((lbCurSel 157533) isEqualTo -1) exitWith {};
private _container = _this select 0;
if(isNull _container) exitWith {};

private _name = _container getVariable ["mobilier_name",""];
private _classname = "";
if (_name isEqualTo "") then {
	_array = "true" configClasses (configFile >> "CfgVehicles");
	_model = ((getModelInfo _container) select 0) select [0, count (getModelInfo _container select 0) - 4];
	{
		if ((toLower (getText (_x >> "model"))) find (toLower (_model)) > -1) exitWith {
			_classname = configName _x;
		};
	} forEach _array;
	if (_classname isEqualTo "") exitWith {};
	_container setVariable ["mobilier_name",_classname];
	_name = _classname;
};
if (_name isEqualTo "") exitWith {};
_name = [_name,"ALF_Frigo"] select (_name isEqualTo "Land_Fridge_01_F" || (_name isEqualTo "ALF_Frigo_Basique"));

private _coffre = FETCH_CONFIG2(getNumber,CONFIG_VEHICLES,_name,"maximumLoad");
if(isNil "_coffre") exitWith {};

private _display = findDisplay 157532;
private _listmoi = _display displayCtrl 157533;

private _item = lbData[157533,(lbCurSel 157533)];
private _countItem = lbValue[157533,(lbCurSel 157533)];

private _listmob = _display displayCtrl 157534;
private _btnPut = display displayCtrl 157535;
private _num = ctrlText 157537;
private _massText = _display displayCtrl 157538;

if !([_num] call TON_fnc_isnumber) exitWith {};
_num = parseNumber(_num);
if(_num < 1) exitWith {};

//ON VERIFIE QU'IL A BIEN LES ITEMS
if(_num > _countItem) exitWith {["INFO","Il n'y a pas autant sur toi.","warning"] spawn ALF_fnc_doMsg;};

if (_name in ["ALF_Frigo","ALF_Gros_Frigo"] && {!((getNumber (configfile >> "CfgMagazines" >> _item >> "ALF_Frigo")) isEqualTo 1)}) exitWith {
	["INFO","Vous pouvez poser seulement de la nourriture ou de la boisson dans le frigo.","warning"] spawn ALF_fnc_doMsg;
};

//ON VERIFIE LE POIDS MAX
private _massItem = ([_item] call life_fnc_fetchCfgDetails) select 15;
private _mass = 0;
{_mass = _mass + (([_x] call life_fnc_fetchCfgDetails) select 15);} forEach alf_craft_table;
if((_mass + (_massItem * _num)) > _coffre) exitWith {["INFO","Ce mobilier n'a pas assez de places.","warning"] spawn ALF_fnc_doMsg;};

//TOUT EST BON, ON LANCE LE PUTINMOBILIER
_btnPut ctrlEnable false;

for "_i" from 1 to _num step 1 do {
	alf_craft_table pushBack _item;
	alf_craft_moi deleteAt (alf_craft_moi find _item);
	[_item,false] call life_fnc_handleItem;
};
_container setVariable ["gear",alf_craft_table,true];

//SAUVEGARDE MOBILIER
[_container] spawn {
	_container = _this select 0;
	life_query_time = time;
	if !(alf_mobiliersave) then {
		alf_mobiliersave = true;
		waitUntil {sleep 0.3; (time - life_query_time) >= 5};
		if !(isNull _container) then {
			[_container] remoteExec ["HC_fnc_updateMobilierInv",HC2_Life];
		};
		alf_mobiliersave = false;
	};
};

//ACTUALISATION DES LISTBOX
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
		_listmoi lbSetValue [(lbSize _listmoi)-1,_itemCount];
		_listmoi lbSetPicture[(lbSize _listmoi)-1,_itemInfo select 2];
	};
} forEach alf_craft_moi;

lbClear _listmob;
_listedItems = [];
{
	if(!(_x in _listedItems) && {_x != ""}) then {
		private _itemInfo = [_x] call life_fnc_fetchCfgDetails;
		_listedItems pushBack _x;
		private _itemCount = {_x isEqualTo (_itemInfo select 0)} count alf_craft_table;
		if(_itemCount > 1) then {
			_listmob lbAdd format["[x%2] %1",_itemInfo select 1,_itemCount];
		} else {
			_listmob lbAdd format["%1",_itemInfo select 1];
		};
		_listmob lbSetData[(lbSize _listmob)-1,_x];
		_listmob lbSetValue [(lbSize _listmob)-1,_itemCount];
		_listmob lbSetPicture[(lbSize _listmob)-1,_itemInfo select 2];
	};
} forEach alf_craft_table;
_massText ctrlSetText format["Poids: %1 / %2 kg",(_mass + (_massItem * _num)),_coffre]; //On affiche la mass.

_btnPut ctrlEnable true;
