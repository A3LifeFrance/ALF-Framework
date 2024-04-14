/*
	File: fn_mresArray.sqf
*/
params [
    ["_array",[],[[]]]
];
_array = toArray(str _array);
private _count = (count _array) - 1;

for "_i" from 0 to _count do {
    _sel = _array select _i;
    if (!(_i isEqualTo 0) && {!(_i isEqualTo _count)} && {_sel isEqualTo 34}) then {
        _array set[_i,96];
    };
};

str(toString(_array));