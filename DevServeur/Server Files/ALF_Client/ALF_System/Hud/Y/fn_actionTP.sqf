#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_adminTP.sqf
	Author: ALF Team

*/
private ["_pos"];
_pos = [_this select 0, _this select 1, _this select 2];
(vehicle player) setPos [_pos select 0, _pos select 1, 0];
onMapSingleClick "";
openMap [false, false];
