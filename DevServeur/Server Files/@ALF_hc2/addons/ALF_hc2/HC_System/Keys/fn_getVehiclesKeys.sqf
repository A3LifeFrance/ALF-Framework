/*
	File: fn_getVehiclesKeys.sqf
*/
params[
	["_unit",objNull,[objNull]],
	["_mode",0,[0]]
];
if(isNull _unit) exitWith {};

private _array = missionNamespace getVariable [format["%1_KEYS",getPlayerUID _unit],[]];
private _array2 = [];
private _array3 = [];

if (_mode isEqualTo 1 || {_mode isEqualTo 3}) then {
	_array2 = missionNamespace getVariable ["GENDARMERIE_KEYS",[]];
};

if (_mode isEqualTo 2 || {_mode isEqualTo 3}) then {
	_array3 = missionNamespace getVariable ["POMPIERS_KEYS",[]];
};

[_array+_array2+_array3] remoteExecCall ["ALF_fnc_setVehiclesKeys",_unit];