/*
	File: fn_FirstJoinServer.sqf
	Author: ALF Team

	This file is for Nanou's HeadlessClient.

	Description:

*/
params [
	["_uid","",[""]]
];
if(_uid isEqualTo "") exitWith {};

[format["UPDATE players SET firstSpawn='0' WHERE playerid='%1'",_uid],1] call HC_fnc_asyncCall;
