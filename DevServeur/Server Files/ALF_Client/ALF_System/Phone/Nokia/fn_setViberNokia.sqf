#include "\ALF_Client\script_macros.hpp"
/*
File: fn_setViberNokia.sqf
Author: ALF Team
Description:

*/
if(!ALF_Phone_Mute) then {
	ALF_Phone_Mute = true;
} else {
	ALF_Phone_Mute = false;
};
playSound "nokia_bip";
