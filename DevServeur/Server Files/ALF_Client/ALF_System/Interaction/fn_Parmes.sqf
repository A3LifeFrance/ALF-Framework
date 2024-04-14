/*
	File: fn_Parmes.sqf
	Author: NiiRoZz
*/
params [
	["_mode",-1,[0]],
	["_license",false,[false]],
	["_rank",[],[[]]]
];

if (_mode isEqualTo -1) exitWith {};

switch (_mode) do {
	case 0: {
		[1,license_gun,[life_copLevel,life_medicLevel,life_penit,life_publique,license_PMO,license_SR,license_TIC,license_PSIG,license_GIGN,license_CYNO]] remoteExecCall ["ALF_fnc_Parmes",remoteExecutedOwner];
	};

	case 1: {
		licence_gunTarget = _license;
		licence_rankTarget = _rank;
	};

	case 2: {
		license_gun = false;
		[1] call SOCK_fnc_updatePartial;
	};
	
	case 3: {
		license_gun = true;
		[1] call SOCK_fnc_updatePartial;
	};
};