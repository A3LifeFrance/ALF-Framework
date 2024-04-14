/*
	File: fn_mresToArray.sqf
*/
params [
    ["_array","",[""]]
];
if(_array isEqualTo "") exitWith {[]};

_array = toArray(_array);

for "_i" from 0 to (count _array)-1 do {
	_sel = _array select _i;
	if (_sel isEqualTo 96) then {
		_array set[_i,39];
	};
};

_array = toString(_array);
_array = call compile format["%1", _array];
_array;