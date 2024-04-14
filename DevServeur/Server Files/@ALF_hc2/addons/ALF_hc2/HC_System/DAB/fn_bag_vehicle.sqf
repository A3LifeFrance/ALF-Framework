/*
	File: fn_bag_vehicle.sqf
	Author: ALF Dev Team
*/

params [
	["_type",0,[0]],
	["_veh",objNull,[objNull]],
	["_unit",objNull,[objNull]]
];

if (isNull _veh) exitWith {};

if (_type isEqualTo 0) then {
	private _actual = _veh getVariable ["valise_stock", 0];
	if (_actual >= 5) exitWith {["CAMION","Ce camion est plein.","danger"] remoteExec ["ALF_fnc_doMsg",_unit];};
	
	_actual = _actual + 1;

	_veh setVariable ["valise_stock", _actual];
	
	[_veh,1] remoteExecCall ["ALF_fnc_bag_stock",_unit];
} else {
	private _actual = _veh getVariable ["valise_stock", 0];
	if (_actual <= 0) exitWith {["CAMION","Ce camion est vide.","danger"] remoteExec ["ALF_fnc_doMsg",_unit];};
	
	_actual = _actual - 1;

	_veh setVariable ["valise_stock", _actual];
	
	[_veh,1] remoteExecCall ["ALF_fnc_bag_unstock",_unit];
};