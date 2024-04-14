/*
	File: fn_putInFourriere.sqf
*/
private _car = _this select 0;
private _u = _this select 1;

private _var = _car getVariable["dbInfo",[]];
if(count _var isEqualTo 0) exitWith {};

private _plate = _var select 1;
_plate = [_plate] call HC_fnc_mresArray;
private _damage = [(getAllHitPointsDamage _car) select 2] call HC_fnc_mresArray;
private _fuel = (fuel _car);

{
	detach _x;
	deleteVehicle _x;
} forEach (attachedObjects _car);

deleteVehicle _car;

[format["UPDATE vehicles SET active='0', fuel='%2', damage='%3', gear='""[]""', lockveh='1', locktime='15' WHERE plate='%1'",_plate,_fuel,_damage],1] call HC_fnc_asyncCall;
["INFO","Le véhicule vient d'être mis en fourrière.","success"] remoteExec ["ALF_fnc_doMsg",_u];
