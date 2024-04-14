/*
    File: fn_expansionFire.sqf
    Author: NiiRoZz
*/
private ["_direction","_distance","_ambiancefeu"];
uiSleep ([900, 2700] call BIS_fnc_randomInt);
ALF_allFeux = ALF_allFeux - [objNull];

while {!(ALF_allFeux isEqualTo [])} do {
	_direction = windDir;
	_distance = linearConversion [0, 1, windStr, 10, 26, true];
	{
		_pos = _x getPos [_distance, _direction];
		if (count (nearestObjects [_pos, ["ALF_AmbianceFeuForet"], 8]) isEqualTo 0) then {

			 _alltress = nearestTerrainObjects [_pos, ["Tree"], 10, false, true];

			if !(_alltress isEqualTo []) then {
				_ambiancefeu = "ALF_AmbianceFeuForet" createVehicle [0,0,0];
				_ambiancefeu setPos _pos;
				_sound = createSoundSource ["ALFfeuForet", position _ambiancefeu, [], 0];
				_sound attachTo [_ambiancefeu];
				ALF_allAmbianceFeux pushBack [_ambiancefeu,_sound];

				for "_i" from 1 to ([2,4] call BIS_fnc_randomInt) do {
					if !(_alltress isEqualTo []) then {
						_tree = selectRandom _alltress;
						_alltress = _alltress - [_tree];

						_feu = "ALF_GrosFeuForet" createVehicle [0,0,0];
						_feu setPosATL (getPosATL _tree);
						_feu setVariable ["firealf",65,true];
						ALF_allFeux pushBack _feu;

						for "_j" from 1 to ([2,4] call BIS_fnc_randomInt) do {
							_pos = _feu getPos [[1,6] call BIS_fnc_randomInt, [_direction - 45,_direction + 45] call BIS_fnc_randomInt];
							_feu2 = "ALF_MoyenFeuForet" createVehicle [0,0,0];
							_feu2 setPos _pos;
							_feu2 setVariable ["firealf",25,true];
							ALF_allFeux pushBack _feu2;
						};
					};
				};
			};
		};
	} forEach (+ ALF_allFeux);
	uiSleep ([900, 2700] call BIS_fnc_randomInt);
	ALF_allFeux = ALF_allFeux - [objNull];
};