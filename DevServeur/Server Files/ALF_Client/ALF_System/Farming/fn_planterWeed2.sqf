#include "\ALF_Client\script_macros.hpp"
/*
  File: fn_planterWeed2.sqf
  ALF Nanou
*/
private["_object","_object"];
_object = _this select 0;
if !((vehicle player) isEqualTo player) exitWith {["INFO", "Il faut sortir du véhicule.", "warning"] spawn ALF_fnc_doMsg;};
if (alf_niv_illegal < 0) exitWith {["ERREUR","Vous n'avez pas l'expérience requise pour cela.","danger"] spawn ALF_fnc_doMsg;};

[_object,15] remoteExec ["HC_fnc_WeedSystem2",HC3_Life];