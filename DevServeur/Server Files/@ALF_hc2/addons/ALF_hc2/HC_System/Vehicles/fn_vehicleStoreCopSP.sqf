/*
	File: fn_vehicleStoreCopSP.sqf
	Author: ALF TEAM
*/
params [
	["_vehicle",objNull,[objNull]],
	["_type",-1,[-1]],
	["_unit",objNull,[objNull]],
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

private _plate = [_vInfo select 1] call HC_fnc_mresArray;

private _mode = -1;
if ((_vehicle getVariable ["vehicle_info_owners",""]) isEqualTo "Pompiers") then {
	_mode = -2;
};

if !(_type isEqualTo _mode) exitWith {
	["ERREUR","Vous ne pouvez pas rentrer votre véhicule de service ici.","danger"] remoteExec ["ALF_fnc_doMsg",_ownerID];
	life_garage_store = false;
	_ownerID publicVariableClient "life_garage_store";
};

private _damage = [((getAllHitPointsDamage _vehicle) select 2)] call HC_fnc_mresArray;

private _query = "";
if (_type isEqualTo -1) then {
	_query = format["UPDATE vehicles_cop SET active='0', fuel='%2', damage='%3', gear='""[]""', id_garage='%4' WHERE plate='%1'",_plate,(fuel _vehicle), _damage,_garage];
} else {
	_query = format["UPDATE vehicles_med SET active='0', fuel='%2', damage='%3', gear='""[]""', id_garage='%4' WHERE plate='%1'",_plate,(fuel _vehicle), _damage,_garage];
};
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