/*
	File: fn_pilot.sqf
	Author: NiiRoZz
*/
params [
	["_mode",-1,[0]],
	["_license",false,[false]]
];

if (_mode isEqualTo -1) exitWith {};

switch (_mode) do {
	case 0: {
		[1,license_pilot] remoteExecCall ["ALF_fnc_pilot",remoteExecutedOwner];
	};

	case 1: {
		licence_pilotTarget = _license;
	};

	case 2: {
		license_pilot = true;
		[1] call SOCK_fnc_updatePartial;
	};
	
	case 3: {
		license_pilot = false;
		[1] call SOCK_fnc_updatePartial;
	};
};