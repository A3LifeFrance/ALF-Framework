#include "\ALF_Client\script_macros.hpp"
/*
File: fn_onMegaphonePressed.sqf
Author: ALF Team
*/
if !(megaphone_speaking) exitWith {};

private _freq = (vehicle player) getVariable ["Megaphone",0];

/*
_radio = call TFAR_fnc_activeSwRadio;
[format[localize "STR_transmit_end",format ["%1<img size='1.5' image='%2'/>", getText (ConfigFile >> "CfgWeapons" >> _radio >> "displayName"),
	getText(configFile >> "CfgWeapons"  >> _radio >> "picture")], 1, _freq],
format["TANGENT	RELEASED	%1%2	%3	%4", _freq, (call TFAR_fnc_activeSwRadio) call TFAR_fnc_getSwRadioCode, getNumber(configFile >> "CfgWeapons" >> _radio >> "tf_range") * (call TFAR_fnc_getTransmittingDistanceMultiplicator), getText(configFile >> "CfgWeapons" >> _radio >> "tf_subtype")]
] call TFAR_fnc_ProcessTangent;
*/

[
	"",
	format [
		"TANGENT_LR	RELEASED	%1%2	%3	%4",
		_freq,
		"_bluefor",
		10000 * (call TFAR_fnc_getTransmittingDistanceMultiplicator), 
		"airborne"
	]
] call TFAR_fnc_processTangent;

megaphone_speaking = false;