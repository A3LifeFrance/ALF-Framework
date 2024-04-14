/*
	File:
	Author:

	This file is for Nanou's HeadlessClient.

	Description:

*/
params[
	["_player",objNull,[objNull]]
];
if(isNull _player) exitWith {};

[1,ALFMARKET_Items_PriceArr] remoteExecCall ["ALF_fnc_updateClientBourse", _player];