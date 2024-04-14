#include "\ALF_Client\script_macros.hpp"
/*
File: fn_onAirRadioReleased.sqf
Author: ALF Team
*/
if !(airradio_speaking) exitWith {};

private _radio = call TFAR_fnc_activeLrRadio;
[format[localize "STR_transmit_end",format ["%1<img size='1.5' image='%2'/>",[_radio select 0, "displayName"] call TFAR_fnc_getLrRadioProperty,
	getText(configFile >> "CfgVehicles"  >> typeof (_radio select 0) >> "picture")], 4, 888],
format["TANGENT_LR	RELEASED	%1%2	%3	%4", 888, (call TFAR_fnc_activeLrRadio) call TFAR_fnc_getLrRadioCode, ([_radio select 0, "tf_range"] call TFAR_fnc_getLrRadioProperty) * (call TFAR_fnc_getTransmittingDistanceMultiplicator), [_radio select 0, "tf_subtype"] call TFAR_fnc_getLrRadioProperty]
] call TFAR_fnc_ProcessTangent;

airradio_speaking = false;
