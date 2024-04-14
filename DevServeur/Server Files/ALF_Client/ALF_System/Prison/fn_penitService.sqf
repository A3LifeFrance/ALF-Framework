#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_penitservice.sqf
	ALF Nanou
*/
if(life_penit isEqualTo 0) exitWith {["INFO","Tu ne peux pas prendre ton service ici.","warning"] spawn ALF_fnc_doMsg;};

private _name = name player;

if(life_penit_service) then {
	life_penit_service = false;
	["Info",format["%1 termine son service.",_name],"warning"] remoteExecCall ["HC_fnc_doPenitCall",HC_Life];
	player setVariable ["PenitService",life_penit_service,HC_Life];
	[name player,getPlayerUID player,"SERVICE","termine son service AP."] remoteExec ["HC_fnc_logIt",HC3_Life];
} else {
	life_penit_service = true;
	player setVariable ["PenitService",life_penit_service,HC_Life];
	["Info",format["%1 prend son service.",_name],"success"] remoteExecCall ["HC_fnc_doPenitCall",HC_Life];
	[name player,getPlayerUID player,"SERVICE","prend son service AP."] remoteExec ["HC_fnc_logIt",HC3_Life];
};
