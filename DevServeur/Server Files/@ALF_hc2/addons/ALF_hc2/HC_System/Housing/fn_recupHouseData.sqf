/*
	File: fn_recupSonnette.sqf
	Author: ALF NiiRoZz
*/
params [
	["_objhouse",objNull,[objNull]]
];
if (isNull _objhouse) exitWith {};

missionNamespace setVariable ["ALF_House_Data",[(_objhouse getVariable ["house_owner",[]]),(_objhouse getVariable ["sonnette",0])],remoteExecutedOwner];