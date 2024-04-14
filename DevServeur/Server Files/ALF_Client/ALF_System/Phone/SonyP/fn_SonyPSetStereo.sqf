#include "\ALF_Client\script_macros.hpp"
/*
File: fn_SonySetStereo.sqf
Author: ALF Team
*/
if(!life_radio_connected) exitWith {hint "Tu n'es pas connecté à la radio.";};
private _type = _this select 0;
private _mode = _this select 1;
private _freq = ALF_Sony_Freq;
private _freq2 = ALF_Sony_FreqAdd;

if(_type isEqualTo 1 && _freq isEqualTo 0) exitWith {hint "Tu n'as pas ce mode d'activé.";};
if(_type isEqualTo 2 && _freq2 isEqualTo 0) exitWith {hint "Tu n'as pas ce mode d'activé.";};

switch (_type) do {
	case 1 : {
		switch (_mode) do {
			case "G" : {
				[(call TFAR_fnc_ActiveSWRadio), 1] call TFAR_fnc_setSwStereo;
			};
			case "M" : {
				[(call TFAR_fnc_ActiveSWRadio), 0] call TFAR_fnc_setSwStereo;
			};
			case "D" : {
				[(call TFAR_fnc_ActiveSWRadio), 2] call TFAR_fnc_setSwStereo;
			};
		};
	};
	case 2 : {
		switch (_mode) do {
			case "G" : {
				[(call TFAR_fnc_ActiveSWRadio), 1] call TFAR_fnc_setAdditionalSwStereo;
			};
			case "M" : {
				[(call TFAR_fnc_ActiveSWRadio), 0] call TFAR_fnc_setAdditionalSwStereo;
			};
			case "D" : {
				[(call TFAR_fnc_ActiveSWRadio), 2] call TFAR_fnc_setAdditionalSwStereo;
			};
		};
	};
};
