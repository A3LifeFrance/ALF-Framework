#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_s_onCheckedChange.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Switching it up and making it prettier..
*/
/*
private["_option","_state"];
_option = SEL(_this,0);
_state = SEL(_this,1);

switch(_option) do {
	case "objects": {
		if(EQUAL(_state,1)) then {
			life_settings_revealObjects = true;
			SVAR_PNAS["life_settings_revealObjects",true];
			LIFE_ID_RevealObjects = ["LIFE_RevealObjects","onEachFrame","life_fnc_revealObjects"] call BIS_fnc_addStackedEventHandler;
		} else {
			life_settings_revealObjects = false;
			SVAR_PNAS["life_settings_revealObjects",false];
			[LIFE_ID_RevealObjects,"onEachFrame"] call BIS_fnc_removeStackedEventHandler;
		};
	};
};
*/
