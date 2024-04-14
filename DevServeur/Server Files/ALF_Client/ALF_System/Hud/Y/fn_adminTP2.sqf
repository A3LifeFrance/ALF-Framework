#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_adminTP.sqf
	Author: ALF Team

*/
closeDialog 0;

openMap [true, false];
ALF_Target_TP = lbData[123490,lbCurSel (123490)];
ALF_Target_TP = call compile format ["%1", ALF_Target_TP];
if (isNil "ALF_Target_TP" || isNull ALF_Target_TP) exitWith {};
if (ALF_Target_TP == player) exitWith {};
onMapSingleClick "[_pos] call ALF_fnc_actionTP2";
