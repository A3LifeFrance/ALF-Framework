#include "\ALF_Client\script_macros.hpp"
/*
File: fn_onAirRadioPressed.sqf
Author: ALF Team
*/
if !((vehicle player) isKindOf "Air") exitWith {};
if !((vehicle player) call TFAR_fnc_hasVehicleRadio) exitWith {};
if (ALF_Phone_inCall OR {ALF_Phone_tryCall}) exitWith {};

airradio_speaking = true;

private _radio = call TFAR_fnc_activeLrRadio;
[format[localize "STR_transmit",format ["%1<img size='1.5' image='%2'/>",[_radio select 0, "displayName"] call TFAR_fnc_getLrRadioProperty,
	getText(configFile >> "CfgVehicles"  >> typeof (_radio select 0) >> "picture")], 4, 888],
format["TANGENT_LR	PRESSED	%1%2	%3	%4", 888, _radio call TFAR_fnc_getLrRadioCode, ([_radio select 0, "tf_range"] call TFAR_fnc_getLrRadioProperty)  * (call TFAR_fnc_getTransmittingDistanceMultiplicator), [_radio select 0, "tf_subtype"] call TFAR_fnc_getLrRadioProperty],
-1
] call TFAR_fnc_ProcessTangent;

[] spawn {
	for "_i" from 0 to 1 step 0 do {
		if !(airradio_speaking) exitWith {};
		if((vehicle player) isEqualTo player) exitWith {[] call ALF_fnc_onAirRadioReleased;};
		if(!alive player) exitWith {[] call ALF_fnc_onAirRadioReleased;};
		sleep 0.2;
	};
};
