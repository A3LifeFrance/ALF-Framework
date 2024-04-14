/*
	File: fn_startDiagnostic.sqf
	Author: ALF TEAM
*/
params [
	["_elevator", [], [[]]],
	["_unit", objNull, [objNull]]
];

private _garage = (nearestObjects [_unit,["Land_ALF_AtelierMecanique"],30]) select 0;
if (isNull (_garage getVariable [(_elevator select 0) + "_veh_charge", objNull])) exitWith {};

if ((_garage getVariable [(_elevator select 0) + "_diag", 0]) isEqualTo 2) exitWith {
	[_elevator, _unit] spawn HC_fnc_startRepair;
};

if ((_garage getVariable [(_elevator select 0) + "_diag", 0]) != 0) exitWith {
	private _time = time - (_garage getVariable [(_elevator select 0) + "_diagTime", 0]);
	_time = 120 - _time;
	["GARAGE", format["Un diagnostic est déjà en cours. Il reste %1 de diagnostic.",[_time] call BIS_fnc_secondsToString], "warning"] remoteExec ["ALF_fnc_doMsg",_unit];
};
if ((_garage animationSourcePhase (_elevator select 1)) < 0.5) exitWith {
	["GARAGE", "Merci d'attendre la lévée de l'élévateur.", "warning"] remoteExec ["ALF_fnc_doMsg",_unit];
};

private _veh = _garage getVariable [(_elevator select 0) + "_veh_charge", objNull];
if (isNull _veh) exitWith {};

_garage setVariable [(_elevator select 0) + "_diag", 1];
_garage setVariable [(_elevator select 0) + "_diagTime", time];

["GARAGE", "Vous avez lancé le diagnostic.", "warning"] remoteExec ["ALF_fnc_doMsg",_unit];

uisleep 120;

if (
	((_garage getVariable[(_elevator select 0) + "_veh_charge", objNull]) == _veh) && 
	((_garage animationSourcePhase (_elevator select 1)) > 0.5)
	) then {

	playSound3D ["ALF_Client2\sounds\bip.ogg", _garage, false, _garage modelToWorld (_garage selectionPosition [(_elevator select 0), "Memory"]), 2, 1, 20];
	_garage setVariable [(_elevator select 0) + "_diag", 2];
};