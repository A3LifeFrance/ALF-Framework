/*
	Author: ALF Nanou
*/
params[
	["_obj",objNull,[objNull]]
];
if(isNull _obj) exitWith {};

[_obj,player] remoteExec ["HC_fnc_farmingPlanche",HC3_Life];
