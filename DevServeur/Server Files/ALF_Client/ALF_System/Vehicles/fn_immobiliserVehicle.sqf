/*
File: fn_immobiliserVehicle.sqf
Author: ALF NiiRoZz
*/
params [
	["_mode",-1,[0]],
	["_veh",objNull,[objNull]]
];

if (_mode isEqualTo -1 || {isNull _veh}) exitWith {};

switch (_mode) do {
	//On immobilise le vehicule
	case 0: {
		_vehicules = missionNamespace getVariable ["VehiculeImmobiliser",[]];
		_vehicules pushBack _veh;
		missionNamespace setVariable ["VehiculeImmobiliser",_vehicules,true];
		["Vehicule", "Ce véhicule est désormais immobilisé.", "danger", false] spawn ALF_fnc_doMsg;
		_veh animateSource ["sabot", 0];
	};

	case 1: {
		_vehicules = missionNamespace getVariable ["VehiculeImmobiliser",[]];
		_vehicules = _vehicules - [_veh];
		missionNamespace setVariable ["VehiculeImmobiliser",_vehicules,true];
		["Vehicule", "Ce véhicule n'est désormais plus immobilisé.", "danger", false] spawn ALF_fnc_doMsg;
		_veh animateSource ["sabot", 1];
	};
};