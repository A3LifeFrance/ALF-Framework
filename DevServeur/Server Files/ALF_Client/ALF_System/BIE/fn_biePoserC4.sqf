/*
	File: biePoserC4
	Author: ALF Team
*/
params[
	["_obj",objNull,[objNull]]
];
if(isNull _obj) exitWith {};

private _action = ["Es-tu sur de vouloir poser le C4?","Belle-Ile Energie","OUI","NON"] call BIS_fnc_guiMessage;
if !(_action) exitWith {};

[_obj,player] remoteExec ["HC_fnc_biePoserC4",HC3_Life];
