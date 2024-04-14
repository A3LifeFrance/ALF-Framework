params [
	["_marker","",[""]]
];

if (_marker isEqualTo "") exitWith {};

private _index = -1;
{
	if (_marker in _x) exitWith {_index = _forEachIndex};
} forEach alf_dynamic_markers;

if (_index isEqualTo -1) then {
	alf_dynamic_markers pushBack [_marker, getMarkerPos _marker];
} else {
	(alf_dynamic_markers select _index) set [1, getMarkerPos _marker];
};

if ((markerAlpha _marker) isEqualTo 0) then {
	_marker setMarkerAlphaLocal 1;
};