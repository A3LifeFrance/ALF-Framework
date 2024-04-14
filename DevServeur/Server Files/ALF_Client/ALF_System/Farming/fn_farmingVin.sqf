/*
  File: fn_farmingVin.sqf
  ALF Nanou
*/
params[
	["_obj",objNull,[objNull]]
];
if(isNull _obj) exitWith {};

[_obj,player] remoteExec ["HC_fnc_farmingVin",HC3_Life];
