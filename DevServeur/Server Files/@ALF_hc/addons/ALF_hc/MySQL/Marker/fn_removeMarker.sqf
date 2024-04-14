/*
    File: fn_removeMarker.sqf
    Author: NiiRoZz
*/
params [
	["_name","",[""]]
];
private _mode = -1;

{
	if ((_x select 0) isEqualTo _name) exitWith {
		_mode = 0;
		ALF_allMarkers_Depanneur deleteAt _forEachIndex;
	};
} forEach ALF_allMarkers_Depanneur;

if (_mode > -1) exitWith {
	[_name] remoteExecCall ["deleteMarkerLocal",-2];
};

{
	if ((_x select 0) isEqualTo _name) exitWith {
		_mode = 0;
		ALF_allMarkers_DIR deleteAt _forEachIndex;
	};
} forEach ALF_allMarkers_DIR;

if (_mode > -1) exitWith {
	[_name] remoteExecCall ["deleteMarkerLocal",-2];
};

{
	if ((_x select 0) isEqualTo _name) exitWith {
		_mode = 0;
		ALF_allMarkers_Gendarme deleteAt _forEachIndex;
	};
} forEach ALF_allMarkers_Gendarme;

if (_mode > -1) exitWith {
	[_name] remoteExecCall ["deleteMarkerLocal",(playableUnits select {_x getVariable ["CopService",false]})];
};

{
	if ((_x select 0) isEqualTo _name) exitWith {
		_mode = 0;
		ALF_allMarkers_Pompier deleteAt _forEachIndex;
	};
} forEach ALF_allMarkers_Pompier;

if (_mode > -1) exitWith {
	[_name] remoteExecCall ["deleteMarkerLocal",(playableUnits select {_x getVariable ["MedService",false]})];
};