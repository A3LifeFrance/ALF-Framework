private _new = [[0,0,0], 0];

{
	_position = _x select 0;
	if (count((format["((%1 distance (getMarkerPos (configName _x))) < getNumber(_x >> 'distance'))", _position]) configClasses (missionConfigFile >> "ALF_DYN_MARKERS")) isEqualTo 0) exitWith {
		_new = _x;
	};
} forEach ([getArray(configFile >> "ALF_MARKERS" >> "dynamic_markers" >> getText(missionConfigFile >> "ALF_DYN_MARKERS" >> ([_this, 0, "", [""]] call BIS_fnc_param) >> "positions"))] call CBA_fnc_shuffle);

_new;