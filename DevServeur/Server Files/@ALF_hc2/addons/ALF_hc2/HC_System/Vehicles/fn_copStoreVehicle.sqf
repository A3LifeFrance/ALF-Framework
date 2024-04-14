/*
	File: fn_copStoreVehicle.sqf
*/
params[
	["_v",objNull,[objNull]]
];
if(isNull _v) exitWith {};

private _vI = _v getVariable["dbInfo",[]];
if(count(_vI) isEqualTo 0) exitWith {};

private _uid = _vI select 0;
private _plate = _vI select 1;
_plate = [_plate] call HC_fnc_mresArray;

private _damage = getAllHitPointsDamage _v;
_damage = _damage select 2;
_damage = [_damage] call HC_fnc_mresArray;

private _fuel = (fuel _v);

[format["UPDATE vehicles SET active='0', fuel='%3', damage='%4', gear='""[]""' WHERE pid='%1' AND plate='%2'",_uid , _plate, _fuel, _damage],1] call HC_fnc_asyncCall;

if(!(isNil "_v") && {!(isNull _v)}) then {
	deleteVehicle _v;
};
