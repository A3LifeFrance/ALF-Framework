#include "\ALF_Client\script_macros.hpp"
/*
  File: fn_takeWeed.sqf
  ALF Nanou
*/
params[
	["_obj",objNull,[objNull]]
];

[_obj,player] remoteExec ["HC_fnc_takeWeed",HC3_Life];
