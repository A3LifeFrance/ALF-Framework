#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_recupIDcard.sqf
	ALF Nanou
*/
if("ALF_identite" in (magazines player)) exitWith {["INFO","Tu as deja une carte d'identite sur toi.","warning"] spawn ALF_fnc_doMsg;};
if !(player canAdd "ALF_identite") exitWith {["INFO","Tu n'as pas assez de place sur toi.","warning"] spawn ALF_fnc_doMsg;};

["ALF_identite",true] spawn life_fnc_handleItem;
["INFO","Tu viens de recuperer ta carte d'identite.","success"] spawn ALF_fnc_doMsg;
