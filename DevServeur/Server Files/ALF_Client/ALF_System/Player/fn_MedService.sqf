#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_prisedeservice.sqf
	ALF Nanou
*/
if(life_medicLevel isEqualTo 0) exitWith {["INFO","Tu ne peux pas prendre ton service ici.","warning"] spawn ALF_fnc_doMsg;};

private _name = name player;

if(life_pompier_service) then {
	life_pompier_service = false;
	player setVariable ["tf_unable_to_use_radio", true];
	life_radio_connected = false;
	ALF_Sony_Freq = 0;
	ALF_Sony_FreqAdd = 0;
	[(call TFAR_fnc_activeSwRadio), 1, getPlayerUID player] call TFAR_fnc_SetChannelFrequency;
	[(call TFAR_fnc_activeSwRadio), 2, getPlayerUID player] call TFAR_fnc_SetChannelFrequency;
	player setVariable ["SonyFreq",0,([HC3_Life] + (((missionNamespace getVariable ["ALF_AllMedics",[]])) apply {_x getVariable ["ALF_ownerID",HC3_Life]}))];
	player setVariable ["SonyFreqAdd",0,([HC3_Life] + (((missionNamespace getVariable ["ALF_AllMedics",[]])) apply {_x getVariable ["ALF_ownerID",HC3_Life]}))];
	player setVariable ["MedService",life_pompier_service,[HC_Life,HC3_Life]];
	["Info",format["%1 termine son service.",_name]] remoteExecCall ["HC_fnc_doMedCall",HC_Life];
	[name player,"termine son service"] remoteExecCall ["HC_fnc_medLogIt",HC3_Life];
	[1] remoteExecCall ["HC_fnc_priseService",HC3_Life];
} else {
	life_pompier_service = true;
	player setVariable ["MedService",life_pompier_service,[HC_Life,HC3_Life]];
	["Info",format["%1 prend son service.",_name]] remoteExecCall ["HC_fnc_doMedCall",HC_Life];
	[name player,"prend son service"] remoteExecCall ["HC_fnc_medLogIt",HC3_Life];
	[1] remoteExecCall ["HC_fnc_priseService",HC3_Life];
};
