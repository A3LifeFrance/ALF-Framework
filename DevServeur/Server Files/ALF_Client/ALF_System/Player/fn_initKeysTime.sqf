#include "\ALF_Client\script_macros.hpp"
/*
	initKeysTime.sqf
*/
params [
	["_data",[],[[]]]
];
if(_data isEqualTo []) exitWith {};

private _entities = entities [["Car","Air","Ship"], [], false, true];

{
	_x params [
		["_mode",-1,[0]],
		["_wtf","",["",[]]]
	];

	if(_mode isEqualTo 0) then {
		{
			private _veh = _x;
			if (alive _veh) then {
				private _plate = [_veh] call ALF_fnc_getPlaque;
				if(!(isNil "_plate") && {((call compile format["%1",_wtf]) apply {toLower _x}) isEqualTo _plate}) then {
					if !(_veh in life_vehicles) then {
						life_vehicles pushBack _veh;
					};
				};
			};
		} forEach _entities;
	} else {
		private _house = nearestObject [(call compile format["%1",_wtf]),"House"];
		if !(_house in life_vehicles) then {
			life_vehicles pushBack _house;
		};
	};
} forEach _data;
