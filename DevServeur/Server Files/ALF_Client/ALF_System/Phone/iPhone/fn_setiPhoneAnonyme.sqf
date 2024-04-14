#include "\ALF_Client\script_macros.hpp"
/*
File: fn_setiPhoneAnonyme.sqf
Author: ALF Team
Description:

*/
if(!ALF_Phone_Anonyme) then {
	ALF_Phone_Anonyme = true;
} else {
	ALF_Phone_Anonyme = false;
};

if !(isNull (findDisplay 56400)) then {
	uiNamespace setVariable ['iphonemenu',5];
	[] call ALF_fnc_menuiPhone;
};