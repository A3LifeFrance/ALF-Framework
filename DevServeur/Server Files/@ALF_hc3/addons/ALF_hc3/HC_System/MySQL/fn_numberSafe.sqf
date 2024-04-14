/*
	File: fn_numberSafe.sqf
*/
params [
	["_nmb",0,[0]]
];

private "_return";
if !(_nmb isEqualTo (floor _nmb)) then {
	private _decimals = 6;
	private _nmbstr = str _nmb;
	private _index = _nmbstr find ".";
	if (_index > -1) then {
		_decimals = count (_nmbstr select [_index]);
	};
	_return =_nmb toFixed 6;
} else {
	_return = _nmb toFixed 0;
};

_return