#include "\ALF_Client\script_macros.hpp"
/*
Author: ALF Nanou
*/
private _car = nearestObject[position player,"Car"];
if (player distance _car > 15) exitWith {};

[_car,player] remoteExec ["HC_fnc_putInFourriere",HC2_Life];
