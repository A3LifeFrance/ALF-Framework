/*
File: fn_returnSearchURLDN.sqf
Author: ALF Team
*/
private _url = _this select 0;
if(_url isEqualTo "") exitWith {};

if(_url isEqualTo ALF_Blackmarket) exitWith {
	alf_shop_panier = [];
	uiNamespace setVariable ['internetmenu',5];
	[] call ALF_fnc_menuInternet;
	[] spawn ALF_fnc_detectingBad;
};
if(_url isEqualTo ALF_Blackmarket2) exitWith {
	alf_shop_panier = [];
	uiNamespace setVariable ['internetmenu',1];
	[] call ALF_fnc_menuInternet;
	[] spawn ALF_fnc_detectingBad;
};
if(_url isEqualTo ALF_Blackmarket3) exitWith {
	alf_shop_panier = [];
	uiNamespace setVariable ['internetmenu',10];
	[] call ALF_fnc_menuInternet;
	[] spawn ALF_fnc_detectingBad;
};
if(_url isEqualTo ALF_Blackmarket4) exitWith {
	alf_shop_panier = [];
	uiNamespace setVariable ['internetmenu',12];
	[] call ALF_fnc_menuInternet;
	[] spawn ALF_fnc_detectingBad;
};
if(_url isEqualTo ALF_Blackmarket5) exitWith {
	uiNamespace setVariable ['internetmenu',14];
	closedialog 0;
	["crime"] spawn ALF_fnc_mission_buy; 
	[] spawn ALF_fnc_detectingBad;
};