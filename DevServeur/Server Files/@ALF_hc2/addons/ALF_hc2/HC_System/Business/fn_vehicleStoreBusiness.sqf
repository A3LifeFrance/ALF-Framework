/*
	File: fn_vehicleStoreBusiness.sqf
*/
params [
	["_vehicle",objNull,[objNull]],
	["_unit",objNull,[objNull]]
];
private _ownerID = _unit getVariable ["ALF_ownerID",-1];

if(isNull _vehicle || {isNull _unit}) exitWith {life_garage_store = false; _ownerID publicVariableClient "life_garage_store";};
private _vInfo = _vehicle getVariable["dbInfo",[]];
private _vInfo2 = _vehicle getVariable["business_veh",[]];

// not persistent so just do this!
if(count _vInfo isEqualTo 0 || {count _vInfo2 isEqualTo 0}) exitWith {
	["ERREUR","Erreur vehicleStoreBusiness #1","danger"] remoteExec ["ALF_fnc_doMsg",_ownerID];
	life_garage_store = false;
	_ownerID publicVariableClient "life_garage_store";
};

private _plate = _vInfo select 1;
_plate = [_plate] call HC_fnc_mresArray;
private _siret = _vInfo2 select 0;

// save damage.
private _damage = getAllHitPointsDamage _vehicle;
_damage = _damage select 2;
_damage = [_damage] call HC_fnc_mresArray;

private _fuel = (fuel _vehicle);

private _query = format["UPDATE vehicles SET active='0', fuel='%3', damage='%4', gear='""[]""' WHERE type='%1' AND plate='%2'",_siret,_plate,_fuel,_damage];
[_query,1] call HC_fnc_asyncCall;

if(!isNil "_vehicle" && {!isNull _vehicle}) then {
	deleteVehicle _vehicle;
};

life_garage_store = false;
_ownerID publicVariableClient "life_garage_store";
["INFO","Le véhicule d'enteprise est au garage.","success"] remoteExec ["ALF_fnc_doMsg",_ownerID];
