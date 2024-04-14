/*
	File: fn_getJobCar.sqf
	Author: ALF Adam
*/
params [
	["_classname","",[""]],
	["_posSpawn",[],[[]]],
	["_unit",objNull,[objNull]]
];

if (_classname isEqualTo "" || {_posSpawn isEqualTo []} || {isNull _unit}) exitWith {};

private _jobCar = missionNamespace getVariable [format["jobCar_%1",getPlayerUID _unit],objNull];
if (!(isNull _jobCar) && {alive _jobCar}) exitWith {["GARAGE", "Vous disposez déjà d'un véhicule de service.", "warning"] remoteExec ["ALF_fnc_doMsg",_unit];};

private _nearCar = _posSpawn nearEntities [["Car","Air","Ship"],10];
if (count _nearCar > 0) exitWith {["GARAGE", "Un véhicule est trop proche pour effectuer une sortie de garage.", "warning"] remoteExec ["ALF_fnc_doMsg",_unit];};

private _dispo = false;
private _vInfo = ["SELECT id, classname, type, active, plate FROM vehicles WHERE pid='eboueur'",2,true] call HC_fnc_asyncCall;
if (isNil "_vInfo" OR {_vInfo isEqualType ""} OR {count(_vInfo) isEqualTo 0}) exitWith {};

{
	if !((_x select 3) isEqualTo 1) exitWith {_vInfo = _vInfo select _forEachIndex; _dispo = true;};
} forEach _vInfo;

if !(_dispo) exitWith {["GARAGE", "Il n'y a plus de véhicule de service disponible.", "warning"] remoteExec ["ALF_fnc_doMsg",_unit];};

private _vid = _vInfo select 0;
[format["UPDATE vehicles SET active='1' WHERE pid='eboueur' AND id='%1'",_vid],1] spawn HC_fnc_asyncCall;

private _plate = [(_vInfo select 4)] call HC_fnc_mresToArray;
if(_plate isEqualType "") then {_plate = call compile format["%1", _plate];};

private _vehicle = _classname createVehicle [0,0,1000];
_vehicle allowDamage false;

_vehicle setPos _posSpawn;
_vehicle setVectorUp (surfaceNormal _posSpawn);

_vehicle allowDamage true;

//On donne les clés
[_vehicle] remoteExecCall ["life_fnc_addVehicle2Chain",_unit];
[getPlayerUID _unit,_vehicle,1] call HC_fnc_keyManagement;

_vehicle lock 2;
_vehicle setVariable ["vehicle_info_owners",getPlayerUID _unit,true];
_vehicle setVariable ["dbInfo",["eboueur",_plate]];
_vehicle setVariable ["Flashed",false];
_vehicle disableTIEquipment true;
[_vehicle] call life_fnc_clearVehicleAmmo;
[_vehicle,true] remoteExecCall ["enableDynamicSimulation",HC3_Life];

_vehicle animateSource ["assu", 0, true];
["Garage","Votre véhicule de service est disponible.","success",false] remoteExec ["ALF_fnc_doMsg",_unit];
missionNamespace setVariable [format["jobCar_%1",getPlayerUID _unit], _vehicle];

_vehicle animateSource ["tracker", 1, true];

_vehicle setObjectTextureGlobal [1, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_plate select 0]];
_vehicle setObjectTextureGlobal [2, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_plate select 1]];
_vehicle setObjectTextureGlobal [3, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_plate select 3]];
_vehicle setObjectTextureGlobal [4, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_plate select 4]];
_vehicle setObjectTextureGlobal [5, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_plate select 5]];
_vehicle setObjectTextureGlobal [6, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_plate select 7]];
_vehicle setObjectTextureGlobal [7, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_plate select 8]];