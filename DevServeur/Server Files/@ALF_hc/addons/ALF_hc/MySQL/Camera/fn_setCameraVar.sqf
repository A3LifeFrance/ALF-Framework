#include "\ALF_hc\hc_macros.hpp"
/*
	File: fn_setCameraVar.sqf
	Author: Nanou
	This file is for Nanou's HeadlessClient.
*/
params [
	["_atm",objNull,[objNull]],
	["_time","",[""]],
	["_nearPlayersFace",[],[[]]]
];

if (isNull _atm || {_time isEqualTo ""} || {_nearPlayersFace isEqualTo []}) exitWith {};

private _stock = _atm getVariable ["camera",[]];
if(count _stock > 0) then {
	_stock pushBack [_time,[_nearPlayersFace]];
	_atm setVariable ["camera",_stock];
} else {
	_atm setVariable ["camera",[[_time,[_nearPlayersFace]]]];
};
