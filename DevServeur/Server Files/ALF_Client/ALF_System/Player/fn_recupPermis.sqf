#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_recupPermis.sqf
	ALF Nanou
*/
if !(license_driver) exitWith {["INFO","La prefecture ne trouve pas ton dossier.","warning"] spawn ALF_fnc_doMsg;};
if("ALF_Permis" in (magazines player)) exitWith {["INFO","Tu as deja ton permis sur toi.","warning"] spawn ALF_fnc_doMsg;};
if !(player canAdd "ALF_Permis") exitWith {["INFO","Tu n'as pas assez de place sur toi.","warning"] spawn ALF_fnc_doMsg;};

["ALF_Permis",true] spawn life_fnc_handleItem;
["INFO","Tu viens de recuperer ton permis.","success"] spawn ALF_fnc_doMsg;
