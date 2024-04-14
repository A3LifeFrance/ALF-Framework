/*
	File: fn_cleanupRequest.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Client sends a cleanup request when they hit Abort,
	the server will then monitor when that client aborts and
	delete the weapon holders.
*/
params [
	["_client",objNull,[objNull]]
];
if(isNull _client) exitWith {};

for "_i" from 1 to 26 step 1 do {
	if !(alive _client) exitWith {
		_containers = nearestObjects[(getPosATL _client),["WeaponHolderSimulated"],5];
		if (count _containers > 0) then {
			{deleteVehicle _x;} forEach _containers;
		};
		deleteVehicle _client;
	};

	uiSleep 1;
};
