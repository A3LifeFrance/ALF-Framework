#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_settingsMenu
	Author: Bryan "Tonic" Boardwine

	Description:
	Setup the settings menu.
*/
disableSerialization;

ctrlSetText[123481, format["%1", life_settings_viewDistanceFoot]];
ctrlSetText[123483, format["%1", life_settings_viewDistanceCar]];
ctrlSetText[123485, format["%1", life_settings_viewDistanceAir]];

/* Set up the sliders */
{
	slidersetRange [SEL(_x,0),100,8000];
	CONTROL(123450,SEL(_x,0)) sliderSetSpeed [100,100,100];
	sliderSetPosition [SEL(_x,0),SEL(_x,1)];
} forEach [[123480,life_settings_viewDistanceFoot],[123482,life_settings_viewDistanceCar],[123484,life_settings_viewDistanceAir]];
