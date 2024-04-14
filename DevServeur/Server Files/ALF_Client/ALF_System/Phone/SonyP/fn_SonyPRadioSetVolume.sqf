#include "\ALF_Client\script_macros.hpp"
/*
File: fn_SonyRadioSetVolume.sqf
Author: ALF Team
*/
if(!life_radio_connected) exitWith {hint "Tu n'es pas connecté à la radio.";};

private["_mode","_volume"];
_mode = _this select 0;
switch (_mode) do {
	case "UP" : {
		_volume = (call TFAR_fnc_ActiveSwRadio) call TFAR_fnc_getSwVolume;
		_volume = _volume + 1;
		if(_volume > 10) then { _volume = 10;};
		[(call TFAR_fnc_ActiveSWRadio), _volume] call TFAR_fnc_setSwVolume;
	};
	case "DOWN" : {
		_volume = (call TFAR_fnc_ActiveSwRadio) call TFAR_fnc_getSwVolume;
		_volume = _volume - 1;
		if(_volume < 1) then { _volume = 1; };
		[(call TFAR_fnc_ActiveSWRadio), _volume] call TFAR_fnc_setSwVolume;
	};
};
