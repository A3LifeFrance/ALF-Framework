/*
	File: fn_switchCommand.sqf
	Author : ALF Adam
*/
params [
	["_mode",false,[false]],
	["_unit",objNull,[objNull]]
];

if (isNull _unit) exitWith {};

if (_mode) then {
	if !(isNull alf_GN_Command) exitWith {["COG", format["Le commandement est déjà pris par %1.", name alf_GN_Command], "danger"] remoteExec ["ALF_fnc_doMsg",_unit];};
	
	["COG",format["%1 prend le commandement.",name _unit]] call HC_fnc_doCopCall;
	alf_GN_Command = _unit;
	
	[] remoteExecCall ["ALF_fnc_returnCommand",_unit];
} else {
	["COG",format["%1 quitte le commandement.",name _unit]] call HC_fnc_doCopCall;
	alf_GN_Command = objNull;
};