#include "\ALF_Client\script_macros.hpp"
/*
File: fn_setRadarM.sqf
Author: ALF Team
*/
private["_radar"];
_radar = _this select 0;
_radar setVariable ["RadarM",[0,0,[]],true];
[_radar] call ALF_fnc_radarMenu;
