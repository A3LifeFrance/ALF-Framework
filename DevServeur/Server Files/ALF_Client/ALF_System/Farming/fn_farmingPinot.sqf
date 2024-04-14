/*
  File: fn_farmingPinot.sqf
  ALF Nanou
*/
params[
	["_obj",objNull,[objNull]]
];
if(isNull _obj) exitWith {};

[_obj,player] remoteExec ["HC_fnc_farmingPinot",HC3_Life];
