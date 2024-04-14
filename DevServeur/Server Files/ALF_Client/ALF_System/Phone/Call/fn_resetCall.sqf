//TFAR
#include "\z\tfar\addons\handhelds\script_component.hpp"
/*
	File: fn_resetCall.sqf
	Author: ALF Team
*/
ALF_Phone_inCall = false;
ALF_Phone_tryCall = false;
ALF_Phone_Ring = false;

player setVariable ["callFrequence",0];

iPhone_Mute = false;
iPhone_Speackers = false;

ALF_Central = false;

ALF_Phone_CallNumber = "";

player setVariable ["call_info",0,HC3_Life];

//On vérifie si le joueur est dans une radio. Si oui on le reconnecte.
if(life_radio_connected) then {
	player setVariable ["tf_unable_to_use_radio", false];
	if !(ALF_iPhone_Freq isEqualTo 0) then {
		[(call TFAR_fnc_activeSwRadio),1,ALF_iPhone_Freq] call TFAR_fnc_SetChannelFrequency;
	};
	if !(ALF_Sony_Freq isEqualTo 0) then {
		[(call TFAR_fnc_activeSwRadio),1,ALF_Sony_Freq] call TFAR_fnc_SetChannelFrequency;
	};
	if !(ALF_Sony_FreqAdd isEqualTo 0) then {
		//On active l'additionnal channel
		private _settings = (call TFAR_fnc_activeSwRadio) call TFAR_fnc_getSwSettings;
		_settings set [TFAR_ADDITIONAL_CHANNEL_OFFSET, 1];
		[(call TFAR_fnc_activeSwRadio), _settings] call TFAR_fnc_setSwSettings;

		[(call TFAR_fnc_activeSwRadio),2,ALF_Sony_FreqAdd] call TFAR_fnc_SetChannelFrequency;
	};
} else {
	player setVariable ["tf_unable_to_use_radio", true];
	[(call TFAR_fnc_activeSwRadio), 1, getPlayerUID player] call TFAR_fnc_SetChannelFrequency;
	[(call TFAR_fnc_activeSwRadio), 2, getPlayerUID player] call TFAR_fnc_SetChannelFrequency;
};

if !(isNull (findDisplay 20000)) then {
	uiNamespace setVariable ['nokiamenu',0];
	[] call ALF_fnc_menuNokia;
	playSound "nokia_end";
};
if !(isNull (findDisplay 56400)) then {
	uiNamespace setVariable ['iphonemenu',0];
	[] call ALF_fnc_menuiPhone;
};
if !(isNull (findDisplay 32999)) then {
	uiNamespace setVariable ['sony',0];
	[] call ALF_fnc_menuSony;
};
if !(isNull (findDisplay 38999)) then {
	uiNamespace setVariable ['sonyp',0];
	[] call ALF_fnc_menuSonyP;
};

if !(isNull ALF_PhoneObject) then {
	detach ALF_PhoneObject;
	deleteVehicle ALF_PhoneObject;
	ALF_PhoneObject = objNull;
	player playActionNow "gestureNod";
	[{player playActionNow "gestureNod";}] call CBA_fnc_execNextFrame;
};
