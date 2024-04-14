#include "\ALF_Client\script_macros.hpp"
/*
File: fn_setiPhoneViber.sqf
Author: ALF Team
Description:

*/
if(!ALF_Phone_Mute) then {
	ALF_Phone_Mute = true;
} else {
	ALF_Phone_Mute = false;
};

if !(isNull (findDisplay 56400)) then {
	uiNamespace setVariable ['iphonemenu',5];
	[] call ALF_fnc_menuiPhone;
};