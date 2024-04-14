/*
	File: fn_initBusiness.sqf
	Author: Nanou
	This file is for Nanou's HeadlessClient.
*/
private["_panier","_position","_house","_var","_items","_number","_classname"];
_panier = _this select 0;
_position = _this select 1;
if(isNil "_panier" OR {isNil "_position"}) exitWith {};

_house = nearestObject [_position,"House"];
if(isNull _house) exitWith {};

uiSleep random(300);

_var = _house getVariable ["courrier",[]];
if(count _var isEqualTo 0) then {
	_items = [];
	{
		_classname = _x select 0;
		_number = _x select 1;
		_items pushBack [_classname,_number];
	} forEach _panier;
	_house setVariable ["courrier",_items,true];
} else {
	{
		_classname = _x select 0;
		_number = _x select 1;
		_var pushBack [_classname,_number];
	} forEach _panier;
	_house setVariable ["courrier",_var,true];
};
