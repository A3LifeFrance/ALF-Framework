/*
    File: fn_iem.sqf
    Author: ALF Dev Team
*/
private ["_pos","_eyeDir","_pPos","_impactPos","_norm","_angle","_blurEffect"];
params [
    ["_pos",[],[[]]]
];
if (_pos isEqualTo []) exitWith {};
if (player distance _pos > 7) exitWith {};

_pos set[2,(_pos select 2)+0.2];
if (lineIntersects [eyePos player, ATLtoASL _pos,player]) exitWith {};

_eyeDir = eyeDirection player;
_pPos = getPosATL player;
_impactPos = [(_pos select 0)-(_pPos select 0),(_pos select 1)-(_pPos select 1),(_pos select 2)-(_pPos select 2)];
_norm = sqrt((_impactPos select 0)^2+(_impactPos select 1)^2+(_impactPos select 2)^2);
_angle = aCos ((_eyeDir select 0)*((_impactPos select 0) / _norm)+((_impactPos select 1) / _norm)*(_eyeDir select 1)+((_impactPos select 2) / _norm)*(_eyeDir select 2));

playSound "flashbang";

if (_angle < 90) then {
	_items = (assignedItems player) + (uniformItems player) + (vestItems player) + (backPackItems player);
	_techObjs = ["ItemGPS","ALF_Info_Cam","ALF_3310","ALF_iPhone","ALF_laptop_unfolded_f","ALF_Camera","alf_neogend","ALF_Defibrilateur","ALF_GoPro","ALF_GPS","ALF_Pc"];
	{
		if(_x in _techObjs) then {
			[_x,false] call life_fnc_handleItem;
		};
	} forEach _items;

	_blurEffect = ppEffectCreate ["DynamicBlur",500];
	_blurEffect ppEffectEnable true;

	_blurEffect ppEffectAdjust [2.1];
	_blurEffect ppEffectCommit 0.1;
	sleep 2;
	_blurEffect ppEffectAdjust [0];
	_blurEffect ppEffectCommit 2;
	sleep 2;
	_blurEffect ppEffectEnable false;
	ppEffectDestroy _blurEffect;
};