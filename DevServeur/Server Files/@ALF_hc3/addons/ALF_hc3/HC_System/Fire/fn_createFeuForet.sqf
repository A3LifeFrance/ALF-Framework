/*
    File: fn_createFeuForet.sqf
    Author: NiiRoZz
*/
params [
	["_pos",[],[[]]]
];

if !(ALF_allAmbianceFeux isEqualTo []) exitWith {};

private _ambiancefeu = "ALF_AmbianceFeuForet" createVehicle [0,0,0];
_ambiancefeu setPosATL _pos;
_sound = createSoundSource ["ALFfeuForet", position _ambiancefeu, [], 0];
_sound attachTo [_ambiancefeu];

_alltress = nearestTerrainObjects [_ambiancefeu, ["Tree"], 40];

if (_alltress isEqualTo []) exitWith {ALF_allAmbianceFeux = []; deleteVehicle _ambiancefeu};

ALF_HC_Fire pushBack _ambiancefeu;
publicVariable "ALF_HC_Fire";
["INCENDIE","ALERTE INCENDIE !! DEPART D'INCENDIE DANS UNE FORET !!"] remoteExecCall ["HC_fnc_doMedCall",HC_Life];

ALF_allAmbianceFeux = [[_ambiancefeu,_sound]];

ALF_allFeux = [];

sleep 3;
for "_i" from 0 to 315 step 45 do {
	_pos = _ambiancefeu getPos [26, _i];
	_feu = "ALF_AmbianceFeuForet" createVehicle [0,0,0];
	_feu setPos _pos;
	_sound = createSoundSource ["ALFfeuForet", position _feu, [], 0];
	_sound attachTo [_feu];
	ALF_allAmbianceFeux pushBack [_feu,_sound];
};
for "_i" from 0 to 315 step 45 do {
	_pos = _ambiancefeu getPos [50, _i];
	_feu = "ALF_AmbianceFeuForet" createVehicle [0,0,0];
	_feu setPos _pos;
	_sound = createSoundSource ["ALFfeuForet", position _feu, [], 0];
	_sound attachTo [_feu];
	ALF_allAmbianceFeux pushBack [_feu,_sound];
};

for "_i" from 1 to 9 do {
	_tree = selectRandom _alltress;
	_alltress = _alltress - [_tree];

	_feu = "ALF_GrosFeuForet" createVehicle [0,0,0];
	_feu setPosATL (getPosATL _tree);
	_feu setVariable ["firealf",65,true];
	ALF_allFeux pushBack _feu;

	for "_j" from 1 to 5 do {
		_pos = _feu getPos [[7,20] call BIS_fnc_randomInt, random 360];
		_feu2 = "ALF_MoyenFeuForet" createVehicle [0,0,0];
		_feu2 setPos _pos;
		_feu2 setVariable ["firealf",25,true];
		ALF_allFeux pushBack _feu2;
	};
};

sleep 3;

[] spawn HC_fnc_ambientFire;

[] spawn HC_fnc_expansionFire;