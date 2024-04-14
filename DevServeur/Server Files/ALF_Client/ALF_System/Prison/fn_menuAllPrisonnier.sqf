/*
	File: fn_menuAllPrisonnier.sqf
	Author: ALF NiiRoZz
*/
params [
	["_mode",-1,[0]],
	["_data",[],[[]]]
];
disableSerialization;

if (life_penit isEqualTo 0) exitWith {};
if (_mode isEqualTo -1) exitWith {};

private _display = findDisplay 87680;

switch (_mode) do {
	//Lancement Dialog
	case 0: {
		if (!(createDialog "ALF_All_Prisonniers")) exitWith {};
		lbClear 87681;
		[] remoteExecCall ["HC_fnc_allPrisonnier",HC_Life];
	};

	//Ajout de tous les prisonniers dans la liste
	case 1: {
		if (_data isEqualTo []) exitWith {};

		{
			lbAdd [87681, format ["%1 : %2",(_x select 0),[((_x select 1) * 60)] call BIS_fnc_secondsToString]];
		} forEach _data;
	};
};
