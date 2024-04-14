/*
	File: fn_chekSoin.sqf
	Author: ALF Adam
*/
[1,(playableUnits select {_x getVariable ["MedService",false]})] remoteExec ["ALF_fnc_soin",(remoteExecutedOwner)];