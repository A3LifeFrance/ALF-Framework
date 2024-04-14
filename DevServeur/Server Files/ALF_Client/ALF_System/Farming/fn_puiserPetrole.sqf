#include "\ALF_Client\script_macros.hpp"
/*
  File: fn_puiserPetrole.sqf
  ALF Team
*/
params[
	["_obj",objNull,[objNull]]
];
if(isNull _obj) exitWith {};
private _uid = getPlayerUID player;

if (alf_niv_minage < 6) exitWith {["INFO", "Tu ne sais pas comment t'y prendre..", "warning"] spawn ALF_fnc_doMsg;};

[_obj,_uid,player] remoteExec ["HC_fnc_petroleSystem",HC3_Life];