/*
	File: fn_spawnVehicle.sqf
	Author: ALF TEAM
*/
params [
	["_vid",-1,[0]],
	["_pid","",[""]],
	["_sp",[],[[],""]],
	["_unit",objNull,[objNull]],
	["_price",0,[0]],
	["_dir",0,[0]]
];
if((_vid isEqualTo -1) OR {_pid isEqualTo ""}) exitWith {};

private _vInfo = [format["SELECT id, classname, type, pid, alive, active, plate, gear, fuel, damage, insure, insurecount, peinture, id_garage FROM vehicles WHERE id='%1' AND pid='%2'",_vid,_pid],2] call HC_fnc_asyncCall;
if(isNil "_vInfo" OR {_vInfo isEqualType ""} OR {count(_vInfo) isEqualTo 0} OR {(_vInfo select 4) isEqualTo 0} OR {(_vInfo select 5) isEqualTo 1}) exitWith {};

private "_nearVehicles";
if(!(_sp isEqualType "")) then {
	_nearVehicles = _sp nearEntities [["Car","Air","Ship"],10];
} else {
	_nearVehicles = [];
};

if(count _nearVehicles > 0) exitWith {
	["INFO", "Un véhicule gène le point de spawn.", "warning"] remoteExec ["ALF_fnc_doMsg",_unit];
};

[format["UPDATE vehicles SET active='1' WHERE pid='%1' AND id='%2'",_pid,_vid],1] spawn HC_fnc_asyncCall;

private _gear = [_vInfo select 7] call HC_fnc_mresToArray;
private _damage = [_vInfo select 9] call HC_fnc_mresToArray;
private _plate = [(_vInfo select 6)] call HC_fnc_mresToArray;
if(_plate isEqualType "") then {_plate = call compile format["%1", _plate];};

private _havok = ["V_ALF_Havok_Yellow","V_ALF_Havok_Silver","V_ALF_Havok_Red","V_ALF_Havok_Purple","V_ALF_Havok_Pink","V_ALF_Havok_Orange","V_ALF_Havok_Green","V_ALF_Havok_Darkred","V_ALF_Havok_Darkgreen","V_ALF_Havok_Blue","V_ALF_Havok_White","V_ALF_Havok_Black"];
private _ec145 = ["V_ALF_EC145_Yellow","V_ALF_EC145_Silver","V_ALF_EC145_Red","V_ALF_EC145_Purple","V_ALF_EC145_Pink","V_ALF_EC145_Orange","V_ALF_EC145_Green","V_ALF_EC145_Darkred","V_ALF_EC145_Darkgreen","V_ALF_EC145_Blue","V_ALF_EC145_White","V_ALF_EC145_Black"];
private _ec135 = ["V_ALF_EC135_Gendarmerie"];
private _pw207 = ["V_ALF_PW207_Yellow","V_ALF_PW207_Silver","V_ALF_PW207_Red","V_ALF_PW207_Purple","V_ALF_PW207_Pink","V_ALF_PW207_Orange","V_ALF_PW207_Green","V_ALF_PW207_Darkred","V_ALF_PW207_Darkgreen","V_ALF_PW207_Blue","V_ALF_PW207_White","V_ALF_PW207_Black","V_ALF_PW207_Pompier"];

private _vehicle = (_vInfo select 1) createVehicle [0,0,1000];
_vehicle allowDamage false;

if(_sp isEqualType "") then {
	_hs = nearestObjects[getMarkerPos _sp,["Land_HeliPad"],30] select 0;
	
	switch (true) do { 
		case ((_vInfo select 1) in _havok) : {_vehicle setPosATL (_hs modelToWorld [0,-1,0.35]);}; 
		case ((_vInfo select 1) in _ec145) : {_vehicle setPosATL (_hs modelToWorld [0,-1,0.35]);};
		case ((_vInfo select 1) in _ec135) : {_vehicle setPosATL (_hs modelToWorld [0,-1.5,0.35]);};
		case ((_vInfo select 1) in _pw207) : {_vehicle setPosATL (_hs modelToWorld [0,2,0.35]);};
		default {_vehicle setPosATL (_hs modelToWorld [0,2,0.35]);};
	};
	
	_vehicle setDir (getDir _hs);
} else {
	_vehicle setPos _sp;
	_vehicle setVectorUp (surfaceNormal _sp);
	_vehicle setDir _dir;
};
_vehicle allowDamage true;

//KeyTimes
private _keys = [format["SELECT pid FROM keysTime WHERE mode='0' AND idobj='%1'",_vInfo select 0],2,true] call HC_fnc_asyncCall;

//On donne les clés
[_vehicle] remoteExecCall ["life_fnc_addVehicle2Chain",(playableUnits select {([(getPlayerUID _x),_keys] call TON_fnc_index) > -1}) + [_unit]];
[_pid,_vehicle,1] call HC_fnc_keyManagement;

_vehicle lock 2;
_vehicle setVariable ["vehicle_info_owners",_pid,true];
_vehicle setVariable ["dbInfo",[_vInfo select 3,_plate,(_vInfo select 10),(_vInfo select 11),(_vInfo select 13)]];
_vehicle setVariable ["Flashed",false];
_vehicle disableTIEquipment true;
[_vehicle] call life_fnc_clearVehicleAmmo;
[_vehicle,true] remoteExecCall ["enableDynamicSimulation",HC3_Life];

_vehicle setFuel (_vInfo select 8);

if((_vInfo select 1) in ["V_ALF_Megane_G_Gendarmerie","V_ALF_Focus_Gendarmerie","V_ALF_Berlingo_Gendarmerie","V_ALF_Subaru_Gendarmerie","V_ALF_GIGN","V_ALF_RS_01_Gendarmerie","V_ALF_Titan_Gendarmerie","V_ALF_DV15_Gendarmerie","V_ALF_Vito_Gendarmerie","V_ALF_Passat_GND"]) then {
	_vehicle setVariable ["TF_RadioType", "alf_megaphone", true];
	{_vehicle setHit[_x,1];} forEach ["lightg01_h","lightg02_h","lightg03_h","lightg04_h","lightg05_h","lightg06_h","lightg07_h","lightg08_h"];
};

if(_vehicle isKindOf "Air") then {
	_vehicle setVariable ["TF_RadioType", "alf_radioheli", true];
	private _freq = random[1000, 5000, 9999];
	_vehicle setVariable ["helicofreq", _freq, true];
};

if (count _gear > 0) then {
	private _items = _gear select 0;
	private _mags = _gear select 1;
	private _weapons = _gear select 2;
	private _backpacks = _gear select 3;
	for "_i" from 0 to ((count (_items select 0)) - 1) do {
		_vehicle addItemCargoGlobal [((_items select 0) select _i), ((_items select 1) select _i)];
	};
	for "_i" from 0 to ((count (_mags select 0)) - 1) do {
		_vehicle addMagazineCargoGlobal [((_mags select 0) select _i), ((_mags select 1) select _i)];
	};
	for "_i" from 0 to ((count (_weapons select 0)) - 1) do {
		_vehicle addWeaponCargoGlobal [((_weapons select 0) select _i), ((_weapons select 1) select _i)];
	};
	for "_i" from 0 to ((count (_backpacks select 0)) - 1) do {
		_vehicle addBackpackCargoGlobal [((_backpacks select 0) select _i), ((_backpacks select 1) select _i)];
	};
};

if (count _damage > 0) then {
	private _parts = getAllHitPointsDamage _vehicle;

	{
		_vehicle setHitPointDamage [format["%1",((_parts select 0) select _forEachIndex)],_x];
	} forEach _damage;
};

if((_vInfo select 10) > 0) then {
  ["Garage","Votre véhicule est disponible et assuré.","success",false] remoteExec ["ALF_fnc_doMsg",_unit];
  _vehicle animateSource ["assu", 0, true];
} else {
  ["Garage","Votre véhicule est disponible et non assuré, attention vous n'êtes pas en règle.","warning",false] remoteExec ["ALF_fnc_doMsg",_unit];
  _vehicle animateSource ["assu", 1, true];
};

private _peinture = [_vInfo select 12] call HC_fnc_mresToArray;
if(_peinture isEqualType "") then {_peinture = call compile format["%1", _peinture];};

if !(_peinture isEqualTo []) then {
	_vehicle setObjectTextureGlobal [0,(_peinture select 0)];
	_vehicle setObjectMaterialGlobal [0,(_peinture select 1)];
};

_vehicle animateSource ["tracker", 1, true];

_vehicle setObjectTextureGlobal [1, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_plate select 0]];
_vehicle setObjectTextureGlobal [2, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_plate select 1]];
_vehicle setObjectTextureGlobal [3, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_plate select 3]];
_vehicle setObjectTextureGlobal [4, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_plate select 4]];
_vehicle setObjectTextureGlobal [5, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_plate select 5]];
_vehicle setObjectTextureGlobal [6, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_plate select 7]];
_vehicle setObjectTextureGlobal [7, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_plate select 8]];
