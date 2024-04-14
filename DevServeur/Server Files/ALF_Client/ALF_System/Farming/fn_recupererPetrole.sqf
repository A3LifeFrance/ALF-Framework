#include "\ALF_Client\script_macros.hpp"
/*
  File: fn_recupererPetrole.sqf
  ALF Team
*/
params [
	["_obj",objNull,[objNull]]
];
if(isNull _obj) exitWith {};

if (alf_niv_minage < 6) exitWith {["ERREUR","Vous n'avez pas l'expérience requise pour cela.","danger"] spawn ALF_fnc_doMsg;};

[_obj,player] remoteExec ["HC_fnc_recupererPetrole",HC3_Life];
