#include "\ALF_Client\script_macros.hpp"
/*
File: fn_iPhoneRadioDisconnect.sqf
Author: ALF Team
*/
private _myRadio = _this select 0;
life_radio_connected = false;
player setVariable ["tf_unable_to_use_radio", true];
[_myRadio, 1, getPlayerUID player] call TFAR_fnc_SetChannelFrequency;
[_myRadio, 2, getPlayerUID player] call TFAR_fnc_SetChannelFrequency;
if(ALF_Sony_FreqAdd isEqualTo 60) then {[_myRadio, 1] call TFAR_fnc_setAdditionalSwChannel;};
ALF_Sony_Freq = 0;
player setVariable ["SonyFreq",0,([HC3_Life] + (((missionNamespace getVariable ["ALF_AllMedics",[]])) apply {_x getVariable ["ALF_ownerID",HC3_Life]}))];
ALF_Sony_FreqAdd = 0;
player setVariable ["SonyFreqAdd",0,([HC3_Life] + (((missionNamespace getVariable ["ALF_AllMedics",[]])) apply {_x getVariable ["ALF_ownerID",HC3_Life]}))];