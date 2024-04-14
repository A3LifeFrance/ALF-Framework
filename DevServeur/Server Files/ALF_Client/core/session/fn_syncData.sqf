#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_syncData.sqf
	Author: Bryan "Tonic" Boardwine"
	Description:
	Used for player manual sync to the server.
*/
if(isNil "life_session_time") then {life_session_time = false;};
if(life_session_time) exitWith {["Sauvegarde","Tu peux sauvegarder ton joueur une fois par minute.", "danger", false] spawn ALF_fnc_doMsg;};

[] call SOCK_fnc_updateRequest;
[] spawn {
	life_session_time = true;
	sleep (1 * 60);
	life_session_time = false;
};
["Sauvegarde","Ton joueur a été sauvegardé avec succès.", "success", false] spawn ALF_fnc_doMsg;
