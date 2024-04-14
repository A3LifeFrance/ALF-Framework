/*
	File: fn_bieEteindre.sqf
	Author: ALF TEAM
*/
params [
	["_object",objNull,[objNull]],
	["_unit",objNull,[objNull]]
];
if (isNull _object || {isNull _unit}) exitWith {};

_object animateSource ["disable_source",0,true];

["BIE","Tu as allumé le courant de ce secteur.","success"] remoteExec ["ALF_fnc_doMsg",_unit];

[_object] call HC_fnc_actionLamps;