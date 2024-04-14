#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_adminTP.sqf
	Author: ALF Team

*/
closeDialog 0;

openMap [true, false];
onMapSingleClick "[_pos select 0, _pos select 1, _pos select 2] call ALF_fnc_actionTP";
