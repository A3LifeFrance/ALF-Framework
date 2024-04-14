#include "\ALF_Client\script_macros.hpp"

//TFAR
#include "\z\tfar\addons\handhelds\script_component.hpp"

/*
File: fn_connectRadioSonyP.sqf
Author: ALF Team
*/
private _freq = _this select 0;
if(isNil "_freq") exitWith {};
private _myfreq = ALF_Sony_Freq;
private _myfreqAdd = ALF_Sony_FreqAdd;

if(_freq isEqualTo _myfreq) exitWith {
	if(_myfreqAdd isEqualTo 0) then {
		player setVariable ["tf_unable_to_use_radio", true];
		life_radio_connected = false;
	};
	[(call TFAR_fnc_activeSwRadio), 1, getPlayerUID player] call TFAR_fnc_SetChannelFrequency;
	ALF_Sony_Freq = 0;
	player setVariable ["SonyFreq",0,([HC3_Life] + (((missionNamespace getVariable ["ALF_AllMedics",[]])) apply {_x getVariable ["ALF_ownerID",HC3_Life]}))];
	[] call ALF_fnc_menuSonyP;
};
if(_freq isEqualTo _myfreqAdd) exitWith {
	if(_myfreq isEqualTo 0) then {
		player setVariable ["tf_unable_to_use_radio", true];
		life_radio_connected = false;
	};
	[(call TFAR_fnc_activeSwRadio), 2, getPlayerUID player] call TFAR_fnc_SetChannelFrequency;

	private _settings = (call TFAR_fnc_activeSwRadio) call TFAR_fnc_getSwSettings;
	_settings set [TFAR_ADDITIONAL_CHANNEL_OFFSET, -1];
	[(call TFAR_fnc_activeSwRadio), _settings] call TFAR_fnc_setSwSettings;

	ALF_Sony_FreqAdd = 0;
	player setVariable ["SonyFreqAdd",0,([HC3_Life] + (((missionNamespace getVariable ["ALF_AllMedics",[]])) apply {_x getVariable ["ALF_ownerID",HC3_Life]}))];
	[] call ALF_fnc_menuSonyP;
};

player setVariable ["tf_unable_to_use_radio", false];

if(_freq isEqualTo 60) then {
	private _settings = (call TFAR_fnc_activeSwRadio) call TFAR_fnc_getSwSettings;
	_settings set [TFAR_ADDITIONAL_CHANNEL_OFFSET, 1];
	[(call TFAR_fnc_activeSwRadio), _settings] call TFAR_fnc_setSwSettings;

	[(call TFAR_fnc_activeSwRadio), 2, _freq] call TFAR_fnc_SetChannelFrequency;
	ALF_Sony_FreqAdd = 60;
	player setVariable ["SonyFreqAdd",60,([HC3_Life] + (((missionNamespace getVariable ["ALF_AllMedics",[]])) apply {_x getVariable ["ALF_ownerID",HC3_Life]}))];
	if(_myfreq isEqualTo 0) then {[(call TFAR_fnc_activeSwRadio), 1, getPlayerUID player] call TFAR_fnc_SetChannelFrequency;};
} else {
	if(ALF_Sony_FreqAdd isEqualTo 0) then {
		private _settings = (call TFAR_fnc_activeSwRadio) call TFAR_fnc_getSwSettings;
		_settings set [TFAR_ADDITIONAL_CHANNEL_OFFSET, -1];
		[(call TFAR_fnc_activeSwRadio), _settings] call TFAR_fnc_setSwSettings;
	};

	[(call TFAR_fnc_activeSwRadio), 1, _freq] call TFAR_fnc_SetChannelFrequency;
	ALF_Sony_Freq = _freq;
	player setVariable ["SonyFreq",_freq,([HC3_Life] + (((missionNamespace getVariable ["ALF_AllMedics",[]])) apply {_x getVariable ["ALF_ownerID",HC3_Life]}))];
};

[] spawn {
	if !(life_radio_connected) then {
		life_radio_connected = true;
		private _myRadio = call TFAR_fnc_activeSwRadio;
		for "_i" from 0 to 1 step 0 do {
			if !(life_radio_connected) exitWith {};
			if(player getVariable ["tf_unable_to_use_radio",false] && {!(ALF_Phone_inCall)}) then {
				player setVariable ["tf_unable_to_use_radio", false];
			};
			if !(alive player) exitWith {[_myRadio] call ALF_fnc_sonyPRadioDisconnect;};
			private _radios = player call TFAR_fnc_radiosList;
			if(count _radios < 1) exitWith {[_myRadio] call ALF_fnc_sonyPRadioDisconnect;};
			if !([(call TFAR_fnc_activeSwRadio),_myRadio] call TFAR_fnc_isSameRadio) exitWith {[_myRadio] call ALF_fnc_sonyPRadioDisconnect;};
			sleep 1;
		};
	};
};

[] call ALF_fnc_menuSonyP;
