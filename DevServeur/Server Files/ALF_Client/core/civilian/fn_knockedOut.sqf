#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_knockedOut.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Starts and monitors the knocked out state.
*/
params [
	["_target",objNull,[objNull]]
];

if(isNull _target) exitWith {};
if !(_target isEqualTo player) exitWith {};
if(alf_ms_active) exitWith {};

private _radio = call TFAR_fnc_activeSwRadio;

if !(_radio isEqualTo "") then {
	player unassignItem _radio;
	player removeItem _radio;
	_holder = "GroundWeaponHolder" createVehicle [0,0,0];
	_holder setPos (player getPos [[5,10] call BIS_fnc_randomInt, random 360]);
	_holder addItemCargoGlobal [_radio, 1];
};

player setUnconscious true;
life_isknocked = true;
sleep 15;
player setUnconscious false;
player playMoveNow "AmovPpneMstpSrasWrflDnon";
life_isknocked = false;
