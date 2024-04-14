#include "\ALF_Client\script_macros.hpp"
/*
File: fn_recherchePlaque.sqf
Author: ALF Team
*/
private _v = _this select 0;
if(isNull _v) exitWith {};

private _a = ["Es-tu sur de vouloir mettre ce vehicule en fouriere?","INFO","OUI","NON"] call BIS_fnc_guiMessage;
if (!_a) exitWith {};

if(isNull _v) exitWith {};
[_v] remoteExec ["HC_fnc_copStoreVehicle",HC2_Life];
