/*
  File: fn_farmingXxX.sqf
  ALF Dev Team
*/
params[
	["_obj",objNull,[objNull]]
];
if(isNull _obj) exitWith {};

[_obj,player] remoteExec ["HC_fnc_farmingXxX",HC3_Life];
