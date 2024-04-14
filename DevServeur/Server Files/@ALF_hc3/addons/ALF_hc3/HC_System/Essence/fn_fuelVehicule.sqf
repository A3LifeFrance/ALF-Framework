/*
    File: fn_fuelVehicule.sqf
    Author: NiiRoZz
*/
params [
	["_veh",objNull,[objNull]],
	["_pistolet",objNull,[objNull]],
	["_player",objNull,[objNull]],
	["_pos",[],[[]]]
];

if (isNull _veh || {isNull _pistolet} || {isNull _player}) exitWith {};

_station = nearestObject [_player,"Land_ALF_station"];

if (isNull _station) exitWith {};

/*
if (_veh getVariable ["ALF_EHEngine",-1] isEqualTo -1) then {
	private _ideh = _veh addEventHandler ["Engine", {
		params [
			["_veh",objNull,[objNull]],
			["_engineState",false,[false]]
		];

		if (_engineState && {({typeOf _x isEqualTo "ALF_Pistolet_Essence"} count (attachedObjects _veh)) > 0}) then {
			[3,_veh] remoteExecCall ["ALF_fnc_pistoletEssence",_veh];
		};
	}];
	_veh setVariable ["ALF_EHEngine",_ideh];
};
*/

private _vehicleInfo = [typeOf _veh] call life_fnc_fetchVehInfo;
private _fuelCapa = _vehicleInfo select 11;
private _timer = _fuelCapa / 1900;
private _litre = 0;

while {fuel _veh < 1 && {({typeOf _x isEqualTo "ALF_Pistolet_Essence"} count (attachedObjects _veh)) > 0} && {((_station getVariable ["station_litre", 3000]) - (_litre / 2)) > 0}} do {
	if (_pos distance _veh >= 8) exitWith {[4,_veh] remoteExecCall ["ALF_fnc_pistoletEssence",_player];};
	[_veh,((fuel _veh) + (2/_fuelCapa))] remoteExecCall ["setFuel",_veh];
	_pistolet setVariable ["ALF_NombreLitre",((_pistolet getVariable ["ALF_NombreLitre",0]) + 1),true];
	_litre = _litre + 0.5;
	uiSleep _timer;
};

[_litre / 2,_station] remoteExecCall ["HC_fnc_updateStation",HC2_Life];

while {({typeOf _x isEqualTo "ALF_Pistolet_Essence"} count (attachedObjects _veh)) > 0} do {
	if (_pos distance _veh >= 8) exitWith {[4,_veh] remoteExecCall ["ALF_fnc_pistoletEssence",_player];};
};