#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_adminSpec.sqf
	Author: ALF Team

*/
private _unit = lbData[123490,lbCurSel (123490)];
_unit = call compile format ["%1", _unit];
if (isNil "_unit") exitWith {};
if (isNull _unit) exitWith {};
if (_unit == player) exitWith {};

closeDialog 0;

_unit switchCamera "INTERNAL";
[player, true] call TFAR_fnc_forceSpectator;
AM_Exit = (findDisplay 46) displayAddEventHandler ["KeyDown","if ((_this select 1) == 68) then {(findDisplay 46) displayRemoveEventHandler [""KeyDown"",AM_Exit];player switchCamera ""INTERNAL"";[player, false] call TFAR_fnc_forceSpectator;};false"];
