#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_s_onSliderChange.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Called when the slider is changed for any field and updates the view distance for it.
*/
params [
	["_mode",-1,[0]],
	["_value",-1,[0]]
];
if(_mode isEqualTo -1 || {_value isEqualTo -1}) exitWith {};

disableSerialization;
switch (_mode) do {
	case 0:
	{
		life_settings_viewDistanceFoot = round(_value);
		ctrlSetText[123481,format["%1",round(_value)]];
		[] call ALF_fnc_updateViewDistance;
		SVAR_PNAS["life_viewDistanceFoot",round(_value)];
	};

	case 1:
	{
		life_settings_viewDistanceCar = round(_value);
		ctrlSetText[123483,format["%1",round(_value)]];
		[] call ALF_fnc_updateViewDistance;
		SVAR_PNAS["life_viewDistanceCar",round(_value)];
	};

	case 2:
	{
		life_settings_viewDistanceAir = round(_value);
		ctrlSetText[123485,format["%1",round(_value)]];
		[] call ALF_fnc_updateViewDistance;
		SVAR_PNAS["life_viewDistanceAir",round(_value)];
	};

	case 3: {
		((findDisplay 20300) displayCtrl 20305) ctrlSetStructuredText parseText format["<t size='1' color='#000000' style='0' align='left'>%1L</t>",round(_value)];
		((findDisplay 20300) displayCtrl 20306) ctrlSetStructuredText parseText format["<t size='1' color='#000000' style='0' align='left'>%1€</t>",round (life_fuelPrices*_value)];
	};

	case 4: {
		player setDir (360 - _value);
	};
};
