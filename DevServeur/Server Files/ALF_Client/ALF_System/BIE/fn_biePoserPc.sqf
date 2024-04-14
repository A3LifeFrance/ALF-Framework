/*
	File: biePoserC4
	Author: ALF Team
*/
params[
	["_obj",objNull,[objNull]]
];
if(isNull _obj) exitWith {};

private _action = ["Es-tu sur de vouloir hacker le system?","Belle-Ile Energie","OUI","NON"] call BIS_fnc_guiMessage;
if !(_action) exitWith {};

["ALF_Pc",false] call life_fnc_handleItem;

[_obj,player] remoteExec ["HC_fnc_biePoserPC",HC3_Life];
