#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_adminTP2.sqf
	Author: ALF Team

*/
(vehicle ALF_Target_TP) setPos [(_this select 0) select 0, (_this select 0) select 1, 0];
onMapSingleClick "";
openMap [false, false];
ALF_Target_TP = objNull;
