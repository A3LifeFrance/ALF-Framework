#include "\ALF_Client\script_macros.hpp"
/*
	File: buisinessCarShop.sqf
	Author: Nanou
*/
private _building = _this select 0;
private _var = _building getVariable ["business",[]];
if(count _var isEqualTo 0) exitWith {};
life_pInact_curTarget = _building;
private _owner = _var select 0;
private _secteur = _var select 4;
private _uid = getPlayerUID player;
if !(_uid isEqualTo _owner) exitWith {["INFO","N'étant pas le propriétaire, tu n'as pas accès au magasin.","warning"] spawn ALF_fnc_doMsg;};

private _shop = "";
private _shopTitle = "";
switch (_secteur) do { 
	case 0 : {_shop = "b_0"; _shopTitle = "Magasin 0";};
	case 1 : {_shop = "b_1"; _shopTitle = "Magasin 1";};
	case 2 : {_shop = "b_2"; _shopTitle = "Magasin 2";};
	case 3 : {_shop = "b_3"; _shopTitle = "Magasin 3";};
	case 4 : {_shop = "b_4"; _shopTitle = "Magasin 4";};
	case 5 : {_shop = "b_5"; _shopTitle = "Magasin 5";};
	case 6 : {_shop = "b_6"; _shopTitle = "Magasin 6";};
	case 7 : {_shop = "b_7"; _shopTitle = "Magasin 7";};
	case 8 : {_shop = "b_8"; _shopTitle = "Magasin 8";};
	case 9 : {_shop = "b_1"; _shopTitle = "Magasin 1";};
	case 10 : {_shop = "b_10"; _shopTitle = "Magasin 10";};
	case 11 : {_shop = "b_11"; _shopTitle = "Magasin 11";};
	case 12 : {_shop = "b_12"; _shopTitle = "Magasin 12";};
	case 13 : {_shop = "b_13"; _shopTitle = "Magasin 13";};
	case 14 : {_shop = "b_14"; _shopTitle = "Magasin 14";};
	case 15 : {_shop = "b_15"; _shopTitle = "Magasin 15";};
	case 16 : {_shop = "b_16"; _shopTitle = "Magasin 16";};
	case 17 : {_shop = "b_17"; _shopTitle = "Magasin 17";};
	case 18 : {_shop = "b_18"; _shopTitle = "Magasin DIR";};
	case 19 : {_shop = "b_19"; _shopTitle = "Magasin BIE";};
	case 20 : {_shop = "b_0"; _shopTitle = "Magasin 0";};
	case 21 : {_shop = "b_21"; _shopTitle = "Magasin 21";};
	case 22 : {_shop = "b_20"; _shopTitle = "Magasin Ferry Martinez";};
	case 23 : {_shop = "b_0"; _shopTitle = "Magasin Tribunal";};
	case 24 : {_shop = "b_0"; _shopTitle = "Magasin 0";};
	case 25 : {_shop = "b_0"; _shopTitle = "Magasin 0";};
	case 26 : {_shop = "b_3"; _shopTitle = "Magasin 3";};
	case 27 : {_shop = "b_3"; _shopTitle = "Magasin 3";};
	case 28 : {_shop = "b_3"; _shopTitle = "Magasin 3";};
};
if(_shop isEqualTo "") exitWith {["INFO","Erreur dans le magasin.","warning"] spawn ALF_fnc_doMsg;};

disableSerialization;
if(dialog) exitWith {};
if(!createDialog "Life_Vehicle_Shop_v3") exitWith {};

life_veh_shop = [_shop,(_building modelToWorld [-8,-12,0]),getDir _building,_building];

ctrlSetText [2301,_shopTitle];
ctrlEnable [2309,false];

private _vehicleList = M_CONFIG(getArray,"CarShops",_shop,"vehicles");
private _control = CONTROL(2300,2302);
lbClear _control;

{
	private _className = _x select 0;
	private _levelAssert = _x select 1;
	private _levelName = _levelAssert select 0;
	private _levelType = _levelAssert select 1;
	private _levelValue = _levelAssert select 2;
	private _showall = true;

	if !(_levelValue isEqualTo -1) then {
		private _level = GVAR_MNS _levelName;
		if(_level isEqualType {}) then {_level = call _level;};

		_showall = switch(_levelType) do {
			case "SCALAR": {_level >= _levelValue};
			case "BOOL": {_level};
			case "EQUAL": {_level isEqualTo _levelValue};
			default {false};
		};
	};

	if(_showall) then {
		private _vehicleInfo = [_className] call life_fnc_fetchVehInfo;
		_control lbAdd (_vehicleInfo select 3);
		_control lbSetPicture [(lbSize _control)-1,(_vehicleInfo select 2)];
		_control lbSetData [(lbSize _control)-1,_className];
		_control lbSetValue [(lbSize _control)-1,_ForEachIndex];
	};
} forEach _vehicleList;

[] call life_fnc_vehicleShopInit3DPreview;
((findDisplay 2300) displayCtrl 2302) lbSetCurSel 0;
