#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_copservice.sqf
	ALF Nanou
*/
if(life_copLevel isEqualTo 0) exitWith {["INFO","Tu ne peux pas prendre ton service ici.","warning"] spawn ALF_fnc_doMsg;};

private _name = name player;

if(life_gendarme_service) then {
	life_gendarme_service = false;
	player setVariable ["tf_unable_to_use_radio", true];
	life_radio_connected = false;
	ALF_Sony_Freq = 0;
	ALF_Sony_FreqAdd = 0;
	[(call TFAR_fnc_activeSwRadio), 1, getPlayerUID player] call TFAR_fnc_SetChannelFrequency;
	[(call TFAR_fnc_activeSwRadio), 2, getPlayerUID player] call TFAR_fnc_SetChannelFrequency;
	player setVariable ["SonyFreq",0,([HC3_Life] + (((missionNamespace getVariable ["ALF_AllGendarmes",[]])) apply {_x getVariable ["ALF_ownerID",HC3_Life]}))];
	player setVariable ["SonyFreqAdd",0,([HC3_Life] + (((missionNamespace getVariable ["ALF_AllGendarmes",[]])) apply {_x getVariable ["ALF_ownerID",HC3_Life]}))];
	["Info",format["%1 termine son service.",_name]] remoteExecCall ["HC_fnc_doCopCall",HC_Life];
	[name player,"termine son service"] remoteExecCall ["HC_fnc_copLogIt",HC3_Life];
	player setVariable ["CopService",life_gendarme_service,[HC_Life,HC3_Life]];
	[0] remoteExecCall ["HC_fnc_priseService",HC3_Life];
} else {
	life_gendarme_service = true;
	player setVariable ["CopService",life_gendarme_service,[HC_Life,HC3_Life]];
	["Info",format["%1 prend son service.",_name]]remoteExecCall ["HC_fnc_doCopCall",HC_Life];
	[name player,"prend son service"] remoteExecCall ["HC_fnc_copLogIt",HC3_Life];
	[0] remoteExecCall ["HC_fnc_priseService",HC3_Life];
};