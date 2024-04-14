#include "\ALF_Client\script_macros.hpp"
/*
File: fn_menuVehicle.sqf
Author: ALF Team
Description:

*/
private _veh = _this select 0;
life_vInact_curTarget = _veh;
private _isVehicle = if(_veh isKindOf "Car" OR {_veh isKindOf "Ship"} OR {_veh isKindOf "Air"}) then {true} else {false};
if(!_isVehicle) exitWith {};

private _load = false;
if(!dialog) then {
	createDialog "vmenu_dialog";
	_load = true;
};
disableSerialization;

_display = findDisplay 30200;
_a1 = _display displayCtrl 30421;
_a2 = _display displayCtrl 30422;
_a3 = _display displayCtrl 30423;
_a4 = _display displayCtrl 30424;
_a5 = _display displayCtrl 30425;

if (life_adminlevel > 2) then {
	_a3 buttonSetAction "life_vInact_curTarget setDamage 0;";
	_a4 buttonSetAction "[life_vInact_curTarget] spawn life_fnc_pulloutAction;";
	_a5 buttonSetAction "life_vehicles pushBack life_vInact_curTarget;";
} else {
	_a3 ctrlShow false;
	_a4 ctrlShow false;
	_a5 ctrlShow false;
};

if (life_adminlevel > 1) then {
	_a1 buttonSetAction "[life_vInact_curTarget] spawn ALF_fnc_copStoreVehicle; closeDialog 0;";
	_a2 buttonSetAction "hint format[""UID Propriétaire : %1"",life_vInact_curTarget getVariable [""vehicle_info_owners"",""Aucune""]];";
} else {
	_a1 ctrlShow false;
	_a2 ctrlShow false;
	_a3 ctrlShow false;
	_a4 ctrlShow false;
	_a5 ctrlShow false;
};

if (!life_gendarme_service && !life_pompier_service) then {[_veh] spawn ALF_fnc_showCivBtn;};
if (life_gendarme_service) then {[_veh] spawn ALF_fnc_showCopBtn;};
if (life_pompier_service) then {[_veh] spawn ALF_fnc_showMedBtn;};
if (getText(missionConfigFile >> "LifeCfgVehicles" >> (typeOf _veh) >> "type") isEqualTo "TRUCK") then {
	[_veh] spawn ALF_fnc_showTruckStats;
	[_veh] spawn ALF_fnc_showTruckBtn;
} else {
	if (getText(missionConfigFile >> "LifeCfgVehicles" >> (typeOf _veh) >> "type") isEqualTo "MOTO") then {
		[_veh] spawn ALF_fnc_showMotoStats;
		[_veh] spawn ALF_fnc_showMotoBtn;
	} else {
		if (getText(missionConfigFile >> "LifeCfgVehicles" >> (typeOf _veh) >> "type") isEqualTo "BOAT") then {
			[_veh] spawn ALF_fnc_showBoatStats;
			[_veh] spawn ALF_fnc_showBoatBtn;
		} else {
			if (getText(missionConfigFile >> "LifeCfgVehicles" >> (typeOf _veh) >> "type") isEqualTo "HELI") then {
				[_veh] spawn ALF_fnc_showHeliStats;
				[_veh] spawn ALF_fnc_showHeliBtn;
			} else {
				[_veh] spawn ALF_fnc_showCarStats;
				[_veh] spawn ALF_fnc_showCarBtn;
			};
		};
	};
};

if(_load) then {
	for "_i" from 0 to 1 step 0 do {
		if(isNull (findDisplay 30200)) exitWith {};
		if(player distance _veh > 30) exitWith {closeDialog 0;};
		if(isNull _veh) exitWith {closeDialog 0;};
		uiSleep 1;
	};
};
