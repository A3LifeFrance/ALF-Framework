#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_takeInMobilier.sqf
	Author: ALF Team
*/
disableSerialization;
if((lbCurSel 157534) isEqualTo -1) exitWith {};
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
private _listmob = _display displayCtrl 157534;

private _item = lbData[157534,(lbCurSel 157534)];
private _countItem = lbValue[157534,(lbCurSel 157534)];

private _btnTake = display displayCtrl 157536;
private _num = ctrlText 157537;
private _massText = _display displayCtrl 157538;

if !([_num] call TON_fnc_isnumber) exitWith {};
_num = parseNumber(_num);
if(_num < 1) exitWith {};

//ON VERIFIE QU'IL A BIEN LES ITEMS
if(_num > _countItem) exitWith {["INFO","Il n'y a pas autant dans ton coffre.","warning"] spawn ALF_fnc_doMsg;};

//ON RECUPERE LES DETAILS DE L'ITEM
private _info = [_item] call life_fnc_fetchCfgDetails;

//ON VERIFIE SI C'EST UN UNIFORM
private _isUniform = false;
if((_info select 5) isEqualTo 801) then {
	_isUniform = true;
};

//ON VERIFIE SI C'EST UNE VESTE
private _isVest = false;
if((_info select 5) isEqualTo 701) then {
	_isVest = true;
};

//ON VERIFIE SI C'EST UN SAC
private _isBackPack = false;
if((_info select 16) isEqualTo 1) then {
	_isBackPack = true;
};

//ON VERIFIE LE POIDS MAX
if (!(player canAdd [_item,_num]) && {!(_isBackPack)} && {!(_isUniform)} && {!(_isVest)}) exitWith {["INFO","Tu n'as pas assez de places.","warning"] spawn ALF_fnc_doMsg;};
if(_isBackPack && {_num > 1}) exitWith {["INFO","Tu peux pas ajouter plusieurs sacs en même tant.","warning"] spawn ALF_fnc_doMsg;};
if(_isUniform && {_num > 1}) exitWith {["INFO","Tu peux pas ajouter plusieurs uniformes en même tant.","warning"] spawn ALF_fnc_doMsg;};
if(_isVest && {_num > 1}) exitWith {["INFO","Tu peux pas ajouter plusieurs vestes en même tant.","warning"] spawn ALF_fnc_doMsg;};

//TOUT EST BON, ON LANCE LE TAKAINMOBILIER
_btnTake ctrlEnable false;

for "_i" from 1 to _num step 1 do {
	alf_craft_moi pushBack _item;
	alf_craft_table deleteAt (alf_craft_table find _item);
	[_item,true] call life_fnc_handleItem;
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

//ON ACTUALISE LES LISTBOX
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
private _mass = 0;
_listedItems = [];
{
	_mass = _mass + (([_x] call life_fnc_fetchCfgDetails) select 15);
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
_massText ctrlSetText format["Poids: %1 / %2 kg",_mass,_coffre]; //On affiche la mass.

_btnTake ctrlEnable true;
