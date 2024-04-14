/*
	File: fn_spawnVehicleBusiness.sqf
	Author: ALF TEAM
*/
private _vid = _this select 0;
private _sp = _this select 1;
private _dir = _this select 2;
private _unit = _this select 3;
private _siretstr = _this select 4;
private _membres = _this select 5;
private _name = name _unit;
private _uid = getPlayerUID _unit;

private _query = format["SELECT classname, pid, alive, active, plate, gear, fuel, damage, insure, peinture FROM vehicles WHERE id='%1'",_vid];
private _queryResult = [_query,2] call HC_fnc_asyncCall;
if(_queryResult isEqualType "") exitWith {};

private _vInfo = _queryResult;
if(isNil "_vInfo") exitWith {};
if(count _vInfo isEqualTo 0) exitWith {};

private _nearVehicles = _sp nearEntities [["Car","Air","Ship"],10];
if(count _nearVehicles > 0) exitWith {
	["ERREUR","Un véhicule bloque le garage.","danger"] remoteExec ["ALF_fnc_doMsg",_unit];
};

_query = format["UPDATE vehicles SET active='1' WHERE id='%1'",_vid];
[_query,1] spawn HC_fnc_asyncCall;

private _gear = [_vInfo select 5] call HC_fnc_mresToArray;
private _damage = [_vInfo select 7] call HC_fnc_mresToArray;
private _new = [(_vInfo select 4)] call HC_fnc_mresToArray;
if(_new isEqualType "") then {_new = call compile format["%1", _new];};
private _plate = _new;
private _insure = _vInfo select 8;
private _pid = _vInfo select 1;

private _vehicle = createVehicle [(_vInfo select 0),[0,0,1000],[],0,"NONE"];
_vehicle allowDamage false;

private _havok = ["V_ALF_Havok_Yellow","V_ALF_Havok_Silver","V_ALF_Havok_Red","V_ALF_Havok_Purple","V_ALF_Havok_Pink","V_ALF_Havok_Orange","V_ALF_Havok_Green","V_ALF_Havok_Darkred","V_ALF_Havok_Darkgreen","V_ALF_Havok_Blue","V_ALF_Havok_White","V_ALF_Havok_Black"];
private _ec145 = ["V_ALF_EC145_Yellow","V_ALF_EC145_Silver","V_ALF_EC145_Red","V_ALF_EC145_Purple","V_ALF_EC145_Pink","V_ALF_EC145_Orange","V_ALF_EC145_Green","V_ALF_EC145_Darkred","V_ALF_EC145_Darkgreen","V_ALF_EC145_Blue","V_ALF_EC145_White","V_ALF_EC145_Black"];
private _ec135 = ["V_ALF_EC135_Gendarmerie"];
private _pw207 = ["V_ALF_PW207_Yellow","V_ALF_PW207_Silver","V_ALF_PW207_Red","V_ALF_PW207_Purple","V_ALF_PW207_Pink","V_ALF_PW207_Orange","V_ALF_PW207_Green","V_ALF_PW207_Darkred","V_ALF_PW207_Darkgreen","V_ALF_PW207_Blue","V_ALF_PW207_White","V_ALF_PW207_Black","V_ALF_PW207_Pompier"];

if ((_vInfo select 0) in _havok || (_vInfo select 0) in _ec145 || (_vInfo select 0) in _ec135 || (_vInfo select 0) in _pw207) then {
	private _hs = nearestObjects[_sp,["Land_HeliPad"],150] select 0;

	if (isNull _hs) exitWith {["INFO","Problème de spawn helico.", "warning"] remoteExec ["ALF_fnc_doMsg",_unit];};
	
	switch (true) do { 
		case ((_vInfo select 0) in _havok) : {_vehicle setPosATL (_hs modelToWorld [0,-1,0.35]);}; 
		case ((_vInfo select 0) in _ec145) : {_vehicle setPosATL (_hs modelToWorld [0,-1,0.35]);};
		case ((_vInfo select 0) in _ec135) : {_vehicle setPosATL (_hs modelToWorld [0,-1.5,0.35]);};
		case ((_vInfo select 0) in _pw207) : {_vehicle setPosATL (_hs modelToWorld [0,2,0.35]);};
		default {_vehicle setPosATL (_hs modelToWorld [0,2,0.35]);};
	};
	
	_vehicle setDir (getDir _hs);
} else {
	_sp = ASLToATL _sp;
	_vehicle setPosATL [_sp select 0, _sp select 1, 0];
	_vehicle setVectorUp (surfaceNormal _sp);
	_vehicle setDir _dir;
};

_vehicle allowDamage true;

private _um = [];
{
	_um pushBack (_x select 1);
} forEach _membres;

[_vehicle] remoteExecCall ["life_fnc_addVehicle2Chain",(playableUnits select {((getPlayerUID _x) in _um)})];

private _arr = missionNamespace getVariable [format["%1_KEYSB",_siretstr],[]];
_arr pushBack _vehicle;
_arr = _arr - [objNull];
missionNamespace setVariable[format["%1_KEYSB",_siretstr],_arr,true];

_vehicle lock 2;
_vehicle setVariable ["vehicle_info_owners",_uid,true];
_vehicle setVariable ["dbInfo",[_pid,_plate,_insure,0,0]];
_vehicle setVariable ["Flashed",false];
_vehicle disableTIEquipment true;
[_vehicle] call life_fnc_clearVehicleAmmo;

_vehicle setFuel (_vInfo select 6);

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

	for "_i" from 0 to ((count _damage) - 1) do {
		_vehicle setHitPointDamage [format["%1",((_parts select 0) select _i)],(_damage select _i)];
	};
};

if(_insure > 0) then {
  ["Garage","Votre véhicule est disponible et assuré.","success"] remoteExec ["ALF_fnc_doMsg",_unit];
  _vehicle animateSource ["assu", 0, true];
} else {
  ["Garage","Votre véhicule est disponible et non assuré, attention vous n'êtes pas en règle.","warning"] remoteExec ["ALF_fnc_doMsg",_unit];
  _vehicle animateSource ["assu", 1, true];
};
_vehicle animateSource ["tracker", 1, true];
_vehicle setVariable ["business_veh",[_siretstr],true];

private _peinture = [_vInfo select 9] call HC_fnc_mresToArray;
if(_peinture isEqualType "") then {_peinture = call compile format["%1", _peinture];};

if !(_peinture isEqualTo []) then {
	_vehicle setObjectTextureGlobal [0,(_peinture select 0)];
	_vehicle setObjectMaterialGlobal [0,(_peinture select 1)];
};

_vehicle setObjectTextureGlobal [1, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_plate select 0]];
_vehicle setObjectTextureGlobal [2, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_plate select 1]];
_vehicle setObjectTextureGlobal [3, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_plate select 3]];
_vehicle setObjectTextureGlobal [4, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_plate select 4]];
_vehicle setObjectTextureGlobal [5, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_plate select 5]];
_vehicle setObjectTextureGlobal [6, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_plate select 7]];
_vehicle setObjectTextureGlobal [7, format ["\ALF_Vehicules\ALF_data\plaque\%1.paa",_plate select 8]];
