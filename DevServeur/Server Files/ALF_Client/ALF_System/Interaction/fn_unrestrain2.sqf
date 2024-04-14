#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_unrestrain2.sqf
	Author:

	Description:

*/
private _unit = param [0,objNull,[objNull]];
if (isNull _unit || {!([_unit] call ALF_fnc_checkMenotter)}) exitWith {};

[_unit,"gestureNod"] remoteExecCall ["playActionNow",_unit];

_array = _unit getVariable ["ALF_MenotterSurrender",[false,false]];
_array set [0,false];
_unit setVariable ["ALF_MenotterSurrender",_array,true];


["INFO", "Cette personne est détaché.", "success"] spawn ALF_fnc_doMsg;
["INFO", "Tu es détaché.", "success"] remoteExec ["ALF_fnc_doMsg",_unit];
