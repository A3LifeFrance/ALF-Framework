/*
	File: bieAllumer
	Author: ALF Team
*/
params[
	["_obj",objNull,[objNull]]
];
if(isNull _obj) exitWith {};

private _action = ["Es-tu sur de vouloir allumer le courant?","Belle-Ile Energie","OUI","NON"] call BIS_fnc_guiMessage;
if !(_action) exitWith {};

[_obj,player] remoteExecCall ["HC_fnc_bieAllumer",HC3_Life];
