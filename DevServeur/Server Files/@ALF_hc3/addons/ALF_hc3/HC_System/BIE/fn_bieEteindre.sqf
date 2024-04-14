/*
	File: fn_bieEteindre.sqf
	Author: ALF TEAM
*/
params [
	["_object",objNull,[objNull]],
	["_unit",objNull,[objNull]]
];
if (isNull _object || {isNull _unit}) exitWith {};

_object animateSource ["disable_source",1,true];

["BIE","Tu as éteint le courant de ce secteur.","warning"] remoteExec ["ALF_fnc_doMsg",_unit];

//[_object] call HC_fnc_actionLamps;
