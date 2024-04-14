#include "\ALF_hc\hc_macros.hpp"
/*
	File: fn_getCameraVar.sqf
	Author: Nanou
	This file is for Nanou's HeadlessClient.
*/
params [
	["_obj",objNull,[objNull]]
];

if (isNull _obj) exitWith {};

missionNamespace setVariable ["ALF_retrieveArrayCamera",(_obj getVariable["camera",[]]),remoteExecutedOwner];
