diag_log "[DM] Initialisation";

private _missing = [];

{
	private _name = configName _x;
	private _result = [format["SELECT pos FROM dynamic_markers WHERE name='%1'", _name], 2] call HC_fnc_asyncCall;
	
	if (_result isEqualTo []) then {
		_missing pushBack _name;
		diag_log format["[DM] Marker %1 pas en DB.", _name];
	} else {
		_result = call compile (_result select 0);
		_marker = [_name, _result] call HC_fnc_dynamicMarkers_create;
	};
} forEach ("true" configClasses (missionConfigFile >> "ALF_DYN_MARKERS"));

{
	private _pos = [_x] call HC_fnc_dynamicMarkers_getPos;
	if (_pos isEqualTo [[0,0,0], 0]) then {
		diag_log format["[DM] Marker %1 n'a pas de position", _x];
	} else {
		[format["INSERT INTO dynamic_markers (name, pos) VALUES ('%1','%2')", _x, _pos], 1] call HC_fnc_asyncCall;
		diag_log format["[DM] Marker %1 pas en DB. FIX", _x];
		_marker = [_x, _pos] call HC_fnc_dynamicMarkers_create;
	};
} forEach _missing;

diag_log "[DM] Initialisé";