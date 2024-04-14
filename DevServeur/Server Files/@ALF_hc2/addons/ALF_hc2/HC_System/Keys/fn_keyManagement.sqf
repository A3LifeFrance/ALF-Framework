/*
	File: fn_keyManagement.sqf
*/

private["_uid","_input","_mode","_arr"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_mode = [_this,2,0,[0]] call BIS_fnc_param;

if(_uid isEqualTo "") exitWith {};

switch(_mode) do {
	case 0: {
		_input = [_this,1,[],[[]]] call BIS_fnc_param;
		_arr = [];
		{
			if(!isNull _x && {!(_x isKindOf "House")}) then {
				_arr pushBack _x;
			};
		} forEach _input;

		_arr = _arr - [objNull];
		missionNamespace setVariable[format["%1_KEYS",_uid],_arr];
	};

	case 1: {
		_input = [_this,1,objNull,[objNull]] call BIS_fnc_param;
		if(isNull _input OR {_input isKindOf "House"}) exitWith {};
		_arr = missionNamespace getVariable [format["%1_KEYS",_uid],[]];
		_arr pushBack _input;
		_arr = _arr - [objNull];
		missionNamespace setVariable[format["%1_KEYS",_uid],_arr];
	};

	case 2: {
		_arr = missionNamespace getVariable[format["%1_KEYS",_uid],[]];
		_arr = _arr - [objNull];
		missionNamespace setVariable[format["%1_KEYS",_uid],_arr];
	};
};