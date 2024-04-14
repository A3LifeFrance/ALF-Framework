#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_lightHouseAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Lights up the house.
*/
params [
	["_house",objNull,[objNull]]
];
if(isNull _house || {!(_house isKindOf "House_F")}) exitWith {};

if !([_house] call ALF_fnc_hasEnergy) exitWith {["Maison", "La maison n'a pas d'électricité.", "danger"] spawn ALF_fnc_doMsg;};

if(isNull (_house GVAR ["lightSource",objNull])) then {
	[_house,true] remoteExecCall ["life_fnc_lightHouse",RCLIENT];
} else {
	[_house,false] remoteExecCall ["life_fnc_lightHouse",RCLIENT];
};