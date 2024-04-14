#include "\ALF_Client\script_macros.hpp"
/*
File: fn_SonySetVolume.sqf
Author: ALF Team
Description:

*/
if(!iPhone_Speackers) then {
	iPhone_Speackers = true;
} else {
	iPhone_Speackers = false;
};

[call TFAR_fnc_ActiveSWRadio] call TFAR_fnc_setSwSpeakers;

if !(isNull (findDisplay 38999)) then {
	uiNamespace setVariable ['sonyp',0];
	[] call ALF_fnc_menuSonyP;
};
