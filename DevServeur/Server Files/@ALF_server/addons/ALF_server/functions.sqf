/*
	File: functions.sqf
*/
TON_fnc_index =
compileFinal "
	params [
		""_item"",
		[""_stack"",[],[[]]]
	];
	if (_stack isEqualTo []) exitWith {-1};

	_stack findIf {_item in _x}
";
publicVariable "TON_fnc_index";

TON_fnc_isnumber =
compileFinal "
	params [
		[""_value"","""",[""""]]
	];

	if (_value isEqualTo """") exitWith {false};

	_arr = toArray(_value);
	_return = true;

	{
		if (_x < 48 || _x > 57) exitWith {
			_return = false;
		};
	} forEach _arr;
	_return;
";

publicVariable "TON_fnc_isnumber";

TON_fnc_clientGetKey =
compileFinal "
	params [
		[""_vehicle"",objNull,[objNull]],
		[""_unit"",objNull,[objNull]]
	];
	if(isNull _vehicle || {isNull _unit}) exitWith {};
	if(player isEqualTo _unit && {!(_vehicle in life_vehicles)}) then {
		life_vehicles pushBack _vehicle;
		[getPlayerUID player,_vehicle,1] remoteExecCall [""HC_fnc_keyManagement"",HC2_Life];
	};
";
publicVariable "TON_fnc_clientGetKey";
