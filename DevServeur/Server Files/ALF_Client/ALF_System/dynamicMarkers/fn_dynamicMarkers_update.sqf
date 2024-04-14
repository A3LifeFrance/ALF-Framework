params [
	["_marker","",[""]]
];

if (_marker isEqualTo "") exitWith {};

private _index = -1;
{
	if (_marker in _x) exitWith {_index = _forEachIndex};
} forEach alf_dynamic_markers;

if (_index != -1) then {
	alf_dynamic_markers deleteAt _index;
};