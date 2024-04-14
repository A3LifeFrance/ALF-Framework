#include "\ALF_Client\script_macros.hpp"
/*
File: fn_iPhoneSetVolume.sqf
Author: ALF Team
Description:

*/
if(!iPhone_Speackers) then {
	iPhone_Speackers = true;
} else {
	iPhone_Speackers = false;
};

[call TFAR_fnc_ActiveSWRadio] call TFAR_fnc_setSwSpeakers;

if !(isNull (findDisplay 56400)) then {
	uiNamespace setVariable ['iphonemenu',0];
	[] call ALF_fnc_menuiPhone;
};
