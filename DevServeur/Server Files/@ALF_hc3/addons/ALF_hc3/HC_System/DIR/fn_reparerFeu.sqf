/*
    File: fn_reparerFeu.sqf
    Author: NiiRoZz
*/
params [
	["_feu",objNull,[objNull]]
];

if (isNull _feu) exitWith {};

if (_feu getVariable ["ALF_FeuCasse",false]) then {
	_feu setVariable ["ALF_FeuCasse",false];

	//[25] remoteExec ["ALF_fnc_addXP",remoteExecutedOwner];
};