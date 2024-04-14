#include "\ALF_Client\script_macros.hpp"
/*
File: fn_iPhoneRadioDisconnect.sqf
Author: ALF Team
*/
private _myRadio = _this select 0;
life_radio_connected = false;
ALF_iPhone_Freq = 0;
player setVariable ["tf_unable_to_use_radio", true];
[_myRadio, 1, getPlayerUID player] call TFAR_fnc_SetChannelFrequency;
