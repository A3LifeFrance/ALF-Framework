#include "\ALF_Client\script_macros.hpp"
/*
File: fn_SonyUnmute.sqf
Author: ALF Team
Description:

*/
private["_myRadio","_myFrequence","_myRadioCode","_myRadioSetting"];
iPhone_Mute = false;

_myRadio = call TFAR_fnc_activeSwRadio;
_myFrequence = player getVariable "callFrequence";
[_myRadio, 1, _myFrequence] call TFAR_fnc_SetChannelFrequency;

[format[localize "STR_transmit",format ["%1<img size='1.5' image='%2'/>", getText (ConfigFile >> "CfgWeapons" >> _myRadio >> "displayName"),
	getText(configFile >> "CfgWeapons"  >> _myRadio >> "picture")], 1, call TFAR_fnc_currentSWFrequency],
format["TANGENT	PRESSED	%1%2	%3	%4",call TFAR_fnc_currentSWFrequency, _myRadio call TFAR_fnc_getSwRadioCode, getNumber(configFile >> "CfgWeapons" >> _myRadio >> "tf_range") * (call TFAR_fnc_getTransmittingDistanceMultiplicator), getText(configFile >> "CfgWeapons" >> _myRadio >> "tf_subtype")],
-1
] call TFAR_fnc_ProcessTangent;

if !(isNull (findDisplay 32999)) then {
	uiNamespace setVariable ['sony',0];
	[] call ALF_fnc_menuSony;
};
