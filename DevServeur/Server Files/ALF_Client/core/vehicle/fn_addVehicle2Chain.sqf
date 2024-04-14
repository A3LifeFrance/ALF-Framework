/*
	File: fn_addVehicle2Chain.sqf
	Author: ALF TEAM
*/
params[
	["_veh",objNull,[objNull]]
];
if(isNull _veh) exitWith {};

if !(_veh in life_vehicles) then {
	life_vehicles pushBack _veh;
};