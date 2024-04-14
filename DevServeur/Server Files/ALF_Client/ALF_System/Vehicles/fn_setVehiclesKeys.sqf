/*
	File: fn_setVehiclesKeys.sqf
*/
params[
	["_array",[],[[]]]
];
if(_array isEqualTo []) exitWith {};

{
	if !(_x in life_vehicles) then {
		life_vehicles pushBack _x;
	};
} forEach _array;
