params [
	["_marker","",[""]]
];

if (_marker isEqualTo "") exitWith {};

_marker setMarkerAlpha 0;
private _new = [_marker] call HC_fnc_dynamicMarkers_getPos;

if (_new isEqualTo [[0,0,0], 0]) exitWith {
	diag_log format["[DM] Marker %1 n'a pas de position", _marker];
	deleteMarker _marker;
	private _object = missionNamespace getVariable [format["dyn_marker_linked_%1", _marker], objNull];
	if (!(isNull _object)) then {deleteVehicle _object};
};

_marker setMarkerPos (_new select 0);
private _object = missionNamespace getVariable [format["dyn_marker_linked_%1", _marker], objNull];
if (!(isNull _object)) then {
	_object setPosATL (_new select 0);
	_object setDir (_new select 1)
};

{
	_x setPos ([_new, 8] call CBA_fnc_randPos);
} forEach (missionNamespace getVariable [format["dyn_marker_supp_%1", _marker], []]);
[format["UPDATE dynamic_markers SET pos='%1' WHERE name='%2'", _new, _marker], 1] call HC_fnc_asyncCall;

[_marker] remoteExecCall ["ALF_fnc_dynamicMarkers_update", -2];