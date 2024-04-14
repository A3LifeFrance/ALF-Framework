/*
	File: fn_spikeStrip.sqf
	Author: ALF TEAM
*/
params [
	["_spikeStrip",objNull,[objNull]]
];
if(isNull _spikeStrip) exitWith {}; //Bad vehicle type passed.

private "_nearVehicles";
waitUntil {_nearVehicles = (getPos _spikeStrip) nearEntities [["Car"],6]; count _nearVehicles > 0 || {isNull _spikeStrip}};
if(isNull _spikeStrip) exitWith {};

_nearVehicles params [
	["_vehicle",objNull,[objNull]]
];

if(isNull _vehicle) exitWith {
	deleteVehicle _spikeStrip;
};

[_vehicle,["HitLFWheel",1.0]] remoteExecCall ["setHitPointDamage",_vehicle];
[_vehicle,["HitRFWheel",1.0]] remoteExecCall ["setHitPointDamage",_vehicle];

deleteVehicle _spikeStrip;
