/*
    File: fn_fetchMarkers.sqf
    Author: NiiRoZz
*/
params [
	["_entreprise",[],[[]]],
	["_coplevel","",[""]],
	["_mediclevel","",[""]]
];

private _return = [];

_coplevel = parseNumber _coplevel;
_mediclevel = parseNumber _mediclevel;

if !(_entreprise isEqualTo []) then {
	if ((_entreprise select 0) isEqualTo 4) then {
		{
			_return pushBack _x;
		} forEach ALF_allMarkers_Depanneur;
	} else {
		if ((_entreprise select 0) isEqualTo 18) then {
			{
				_return pushBack _x;
			} forEach ALF_allMarkers_DIR;
		};
	};
};

if (_coplevel > 0) then {
	{
		_return pushBack _x;
	} forEach ALF_allMarkers_Gendarme;
};

if (_mediclevel > 0) then {
	{
		_return pushBack _x;
	} forEach ALF_allMarkers_Pompier;
};

_return