/*
	File: fn_vehicleUpdate.sqf
	Author : ALF TEAM
*/
params [
	["_vehicle",objNull,[objNull]],
	["_mode",1,[0]]
];
if(isNull _vehicle) exitWith {}; //NULL

private _dbInfo = _vehicle getVariable["dbInfo",[]];
if (_dbInfo isEqualTo []) exitWith {};

private _uid = _dbInfo select 0;
private _plate = [(_dbInfo select 1)] call HC_fnc_mresArray;

switch (_mode) do {
	case 1: {
		private _vehItems = getItemCargo _vehicle;
		private _vehMags = getMagazineCargo _vehicle;
		private _vehWeapons = getWeaponCargo _vehicle;
		private _vehBackpacks = getBackpackCargo _vehicle;

		private "_cargo";
		if((count (_vehItems select 0) isEqualTo 0) && {(count (_vehMags select 0) isEqualTo 0)} && {(count (_vehWeapons select 0) isEqualTo 0)} && {(count (_vehBackpacks select 0) isEqualTo 0)}) then {
			_cargo = [];
		} else {
			_cargo = [_vehItems,_vehMags,_vehWeapons,_vehBackpacks]
		};

		_cargo = [_cargo] call HC_fnc_mresArray;
		[format["UPDATE vehicles SET gear='%3' WHERE pid='%1' AND plate='%2'",_uid,_plate,_cargo],1] call HC_fnc_asyncCall;
	};
};
