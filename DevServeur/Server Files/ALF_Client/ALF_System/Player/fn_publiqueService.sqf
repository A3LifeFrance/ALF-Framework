#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_publiqueservice.sqf
	ALF Nanou
*/
if(life_publique isEqualTo 0) exitWith {["INFO","Tu ne peux pas prendre ton service ici.","warning"] spawn ALF_fnc_doMsg;};
private _name = name player;
if(life_publique_service) then {
	life_publique_service = false;
	["Info",format["%1 termine son service.",_name],"warning"] spawn ALF_fnc_doMsg;
	[name player,getPlayerUID player,"SERVICE","termine son service."] remoteExec ["HC_fnc_logIt",HC3_Life];
} else {
	life_publique_service = true;
	["Info",format["%1 prend son service.",_name],"success"] spawn ALF_fnc_doMsg;
	[name player,getPlayerUID player,"SERVICE","prend son service."] remoteExec ["HC_fnc_logIt",HC3_Life];
};
