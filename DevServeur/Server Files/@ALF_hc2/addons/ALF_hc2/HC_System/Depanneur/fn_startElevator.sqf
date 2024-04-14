/*
	File: fn_startElevator.sqf
	Author: ALF TEAM
*/
params [
	["_elevator", [], [[]]],
	["_mode", true, [true]],
	["_unit", objNull, [objNull]]
];

private _garage = (nearestObjects [_unit,["Land_ALF_AtelierMecanique"],30]) select 0;
if (isNull _garage) exitWith {};

if (((_garage animationSourcePhase (_elevator select 1)) != 0) && ((_garage animationSourcePhase (_elevator select 1)) < 0.5)) exitWith {};

private _veh = objNull;
private _distance = 10;
private _pos = _garage modelToWorld (_garage selectionPosition [(_elevator select 0), "Memory"]);
{
	if ((_x distance _pos) < _distance) then {
		_distance = (_x distance _pos);
		_veh = _x;
	};
} forEach (nearestObjects [_unit,["Car"],10]);

if (isNull _veh) exitWith {};

_veh allowDamage false;

_garage setVariable[(_elevator select 0) + "_diag", 0];
[_garage, (_elevator select 0) + "_diag", 0, false] remoteExec ["ALF_fnc_setVariable",_unit];

private _t = 0;
if (_mode) then {
	_garage animateSource [(_elevator select 1), 1];

	_garage setVariable [(_elevator select 0) + "_veh_charge", _veh];
	
	for "_i" from 0 to 1 step 0 do {
		sleep 1;
		if (_t > 30) exitWith {};
		if ((_garage animationSourcePhase (_elevator select 1)) > 0.05) exitWith {};
		_veh setPosATL [(getPosATL _veh select 0), (getPosATL _veh select 1), (getPosATL _veh select 2) + 0.03];
		_t = _t + 1;
	};
} else {
	_garage animateSource [(_elevator select 1), 0];

	_garage setVariable [(_elevator select 0) + "_veh_charge", objNull];
	_garage setVariable [(_elevator select 0) + "_in_repair", false];
	_garage setVariable [(_elevator select 0) + "_diag", 0];
	[_garage, (_elevator select 0) + "_diag", 0, false] remoteExec ["ALF_fnc_setVariable",_unit];

	waitUntil {((_garage animationSourcePhase (_elevator select 1)) < 0.50)};

	for "_i" from 0 to 1 step 0 do {
		sleep 1;
		if (_t > 30) exitWith {};
		_veh setPosATL [(getPosATL _veh select 0), (getPosATL _veh select 1), (getPosATL _veh select 2) + 0.03];
		if ((_garage animationSourcePhase (_elevator select 1)) < 0.45) exitWith {};
		_t = _t + 1;
	};
};

_veh allowDamage true;