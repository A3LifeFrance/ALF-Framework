/*
	File: fn_vehicleStore.sqf
	Author: ALF TEAM
*/
params [
	["_vehicle",objNull,[objNull]],
	["_unit",objNull,[objNull]],
	["_storetext","",[""]],
	["_garage",0,[0]]
];

private _ownerID = _unit getVariable ["ALF_ownerID",-1];
if(isNull _vehicle OR {isNull _unit}) exitWith {life_garage_store = false; _ownerID publicVariableClient "life_garage_store";};

private _vInfo = _vehicle getVariable["dbInfo",[]];
if(count _vInfo isEqualTo 0) exitWith {
	["GARAGE","Erreur de stockage (fn_vehicleStore #1).","warning"] remoteExec ["ALF_fnc_doMsg",_ownerID];
	life_garage_store = false;
	_ownerID publicVariableClient "life_garage_store";
};

private _oldgarage = _vInfo select 4;
private _plate = [_vInfo select 1] call HC_fnc_mresArray;
private _uid = _vInfo select 0;

if (_oldgarage in [-1,-2] && !(_oldgarage isEqualTo _garage)) exitWith {
	["GARAGE","Vous ne pouvez pas ranger votre véhicule de service ici.","warning"] remoteExec ["ALF_fnc_doMsg",_ownerID];
	life_garage_store = false;
	_ownerID publicVariableClient "life_garage_store";
};


if !(_uid isEqualTo (getPlayerUID _unit)) exitWith {
	["ERREUR","Vous n'êtes pas le propriétaire du véhicule.","danger"] remoteExec ["ALF_fnc_doMsg",_ownerID];
	life_garage_store = false;
	_ownerID publicVariableClient "life_garage_store";
};

private _damage = [((getAllHitPointsDamage _vehicle) select 2)] call HC_fnc_mresArray;

private _query = format["UPDATE vehicles SET active='0', fuel='%3', damage='%4', gear='""[]""', id_garage='%5' WHERE pid='%1' AND plate='%2'",_uid , _plate, (fuel _vehicle), _damage,_garage];
[_query,1] call HC_fnc_asyncCall;

{
	detach _x;
	deleteVehicle _x;
} forEach (attachedObjects _vehicle);

if (!isNil "_vehicle" && {!isNull _vehicle}) then {
	deleteVehicle _vehicle;
};

life_garage_store = false;
_ownerID publicVariableClient "life_garage_store";
["INFO",_storetext,"success"] remoteExec ["ALF_fnc_doMsg",_ownerID];