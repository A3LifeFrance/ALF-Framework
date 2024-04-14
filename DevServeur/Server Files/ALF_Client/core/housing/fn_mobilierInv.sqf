#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_mobilierInv.sqf
	ALF TEAM
*/
disableSerialization;
params [
	["_container",objNull,[objNull]]
];
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

//CHECK ANTI GLITCH
private _inUse = _container getVariable ["inUse",""];
if !(_inUse isEqualTo "") exitWith {["INFO","Quelqu'un regarde déjà dedans.","warning"] spawn ALF_fnc_doMsg;};

//SET ANTI GLITCH
_container setVariable ["inUse",(getPlayerUID player),true];

if(isNull (findDisplay 157532)) then {createDialog "ALF_Mobiler_Inv"};
private _display = findDisplay 157532;
private _listmoi = _display displayCtrl 157533;
private _listmob = _display displayCtrl 157534;
private _btnput = _display displayCtrl 157535;
private _btnTake = _display displayCtrl 157536;
private _massText = _display displayCtrl 157538;

life_pInact_curObject = _container;
alf_craft_table = _container getVariable ["gear",[]];
alf_craft_moi = [(goggles player)] + [(headgear player)] + [(uniform player)] + [(vest player)] + [(backpack player)] + (assignedItems player) + (uniformItems player) + (vestItems player) + (backPackItems player) + [(primaryWeapon player)] + [(secondaryWeapon player)] + [(handgunWeapon player)];

//MES ITEMS
private _listedItems = [];
lbClear _listmoi;
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


_listedItems = [];
private _mass = 0;
lbClear _listmob;
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

_btnput ctrlEnable true;
_btnput buttonSetAction "[life_pInact_curObject] call life_fnc_putInMobilier;";

_btnTake ctrlEnable true;
_btnTake buttonSetAction "[life_pInact_curObject] call life_fnc_takeInMobilier;";

//BOUCLE ANTI GLITCH
[_container] spawn {
	_container = _this select 0;
	for "_i" from 0 to 1 step 0 do {
		if(isNull _container) exitWith {closeDialog 157532;};
		if(isNull (findDisplay 157532)) exitWith {_container setVariable ["inUse","",true]};
		if !((_container getVariable ["inUse",""]) isEqualTo (getPlayerUID player)) exitWith {closeDialog 157532;};
		uiSleep 0.3;
	};
};
