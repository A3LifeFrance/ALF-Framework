#include "\ALF_Client\script_macros.hpp"
/*
  File: fn_cocaine.sqf
  ALF Team
*/
params [
	["_obj",objNull,[objNull]],
	["_mode",0,[0]]
];
if(isNull _obj) exitWith {};

if (alf_niv_illegal < 1) exitWith {["ERREUR","Vous n'avez pas l'expérience requise pour cela.","danger"] spawn ALF_fnc_doMsg;};

[_obj,_mode,player] remoteExec ["HC_fnc_cocaine",HC3_Life];
