/*
	File: fn_mresArray.sqf
	Author: Bryan "Tonic" Boardwine";
	
	Description:
	Acts as a mres (MySQL Real Escape) for arrays so they
	can be properly inserted into the database without causing
	any problems. The return method is 'hacky' but it's effective.
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