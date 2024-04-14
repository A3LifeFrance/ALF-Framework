/*
	File: fn_initBusiness.sqf
	Author: Nanou
	This file is for Nanou's HeadlessClient.
*/
private["_number","_item","_position","_house","_var"];
_number = _this select 0;
_item = _this select 1;
_position = _this select 2;
if(isNil "_number" OR {isNil "_item"} OR {isNil "_position"}) exitWith {};

_house = nearestObject [_position,"House"];
if(isNull _house) exitWith {};

uiSleep random(300);

_var = _house getVariable ["courrier",[]];
if(count _var isEqualTo 0) then {
	_house setVariable ["courrier",[[_item,_number]],true];
} else {
	_var pushBack [_item,_number];
	_house setVariable ["courrier",_var,true];
};
