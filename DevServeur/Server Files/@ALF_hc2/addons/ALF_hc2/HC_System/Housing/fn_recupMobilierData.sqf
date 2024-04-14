/*
	File: fn_recupMobilierData.sqf
	Author: ALF NiiRoZz
*/
params [
	["_mobilier",objNull,[objNull]]
];
if (isNull _mobilier) exitWith {};

missionNamespace setVariable ["ALF_Mobilier_Data",(_mobilier getVariable ["mobilier_data",[-1,0,0,0,0,0]]),remoteExecutedOwner];
