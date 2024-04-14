/*
	File: bieDehacking
	Author: ALF Team
*/
params[
	["_obj",objNull,[objNull]]
];
if(isNull _obj) exitWith {};

private _action = ["Es-tu sur de vouloir reparer le système?","Belle-Ile Energie","OUI","NON"] call BIS_fnc_guiMessage;
if !(_action) exitWith {};

[_obj,player] remoteExec ["HC_fnc_bieReparerSystem",HC3_Life];
