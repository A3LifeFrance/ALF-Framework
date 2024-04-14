#include "\ALF_Client\script_macros.hpp"
/*
File: fn_callSetSpeaker.sqf
Author: ALF Team
Description:

*/
[call TFAR_fnc_ActiveSWRadio] call TFAR_fnc_setSwSpeakers;
playSound "nokia_bip";
