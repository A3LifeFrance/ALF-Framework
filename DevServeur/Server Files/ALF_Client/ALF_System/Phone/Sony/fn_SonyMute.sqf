#include "\ALF_Client\script_macros.hpp"
/*
File: fn_SonyMute.sqf
Author: ALF Team
Description:

*/
private["_myRadio","_myFrequence","_myRadioCode","_myRadioSetting"];
iPhone_Mute = true;

_myRadio = call TFAR_fnc_activeSwRadio;
_myFrequence = call TFAR_fnc_currentSWFrequency;
_myRadioCode = _myRadio call TFAR_fnc_getSwRadioCode;
_myRadioSetting = call TFAR_fnc_getTransmittingDistanceMultiplicator;
[format[localize "STR_transmit_end",format ["%1<img size='1.5' image='%2'/>", getText (ConfigFile >> "CfgWeapons" >> _myRadio >> "displayName"),
	getText(configFile >> "CfgWeapons"  >> _myRadio >> "picture")],1,_myFrequence],
format["TANGENT	RELEASED	%1%2	%3	%4",_myFrequence,_myRadioCode, getNumber(configFile >> "CfgWeapons" >> _myRadio >> "tf_range") * _myRadioSetting, getText(configFile >> "CfgWeapons" >> _myRadio >> "tf_subtype")]
] call TFAR_fnc_ProcessTangent;

if !(isNull (findDisplay 32999)) then {
	uiNamespace setVariable ['sony',0];
	[] call ALF_fnc_menuSony;
};
