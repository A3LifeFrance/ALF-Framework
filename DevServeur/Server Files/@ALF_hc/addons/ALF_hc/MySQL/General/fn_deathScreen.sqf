/*
	File: fn_deathScreen.sqf
	Author: ALF TEAM
*/
[(playableUnits select {_x getVariable ["MedService",false]})] remoteExec ["life_fnc_deathScreen",(remoteExecutedOwner)];