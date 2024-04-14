/*
	File: fn_adminCamera.sqf
	Author: ALF Adam

*/
closeDialog 0;

[player, true] call TFAR_fnc_forceSpectator;
["Paste",["ALF_BelleIle",getposATL player]] call BIS_fnc_camera;

waitUntil {uiSleep 1; (isNull(findDisplay 314))};

[player, false] call TFAR_fnc_forceSpectator;