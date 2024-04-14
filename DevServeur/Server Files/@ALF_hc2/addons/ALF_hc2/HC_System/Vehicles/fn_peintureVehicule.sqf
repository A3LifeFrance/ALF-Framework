/*
	File : fn_peintureVehicule.sqf
	Author: ALF Team
*/
params [
	["_veh",objNull,[objNull]],
	["_texture","",[""]],
	["_material","",[""]]
];

if (isNull _veh || {_texture isEqualTo ""} || {_material isEqualTo ""}) exitWith {};

private _dbInfo = _veh getVariable["dbInfo",[]];
if (_dbInfo isEqualTo []) exitWith {};

private _plate = [(_dbInfo select 1)] call HC_fnc_mresArray;
_texture = (_texture splitString "\") joinString "\\";
_material = (_material splitString "\") joinString "\\";

private _peinture = [[_texture,_material]] call HC_fnc_mresArray;

[format["UPDATE vehicles SET peinture='%2' WHERE plate='%1'",_plate,_peinture],1] call HC_fnc_asyncCall;