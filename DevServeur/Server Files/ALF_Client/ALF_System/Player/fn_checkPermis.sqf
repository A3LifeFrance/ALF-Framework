#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_checkPermis.sqf
	ALF Nanou
*/
["INFO","Demande auprès de la préfecture.. Merci de patienter..","success"] spawn ALF_fnc_doMsg;

sleep 3;

["INFO",format["Il vous reste %1 point(s) sur votre permis.",life_permis],"success"] spawn ALF_fnc_doMsg;
