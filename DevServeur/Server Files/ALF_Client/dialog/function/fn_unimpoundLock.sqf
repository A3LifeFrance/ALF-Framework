#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_unimpound.sqf
*/
private["_vehicle","_vehicleLife","_vid","_pid","_unit","_price","_purchasePrice"];
disableSerialization;
if(EQUAL(lbCurSel 2802,-1)) exitWith {hint localize "STR_Global_NoSelection"};
_vehicle = lbData[2802,(lbCurSel 2802)];
_pid = (call compile format["%1",_vehicle]) select 4;
_vehicle = (call compile format["%1",_vehicle]) select 0;
_vehicleLife = _vehicle;
_vid = lbValue[2802,(lbCurSel 2802)];
_unit = player;
_spawntext = localize "STR_Garage_spawn_Success";
if(isNil "_vehicle") exitWith {hint localize "STR_Garage_Selection_Error"};
if(!isClass (missionConfigFile >> CONFIG_LIFE_VEHICLES >> _vehicleLife)) then {
	_vehicleLife = "Default"; //Use Default class if it doesn't exist
	diag_log format["%1: LifeCfgVehicles class doesn't exist",_vehicle];
};

_price = M_CONFIG(getNumber,CONFIG_LIFE_VEHICLES,_vehicleLife,"sortie");

if(life_cash < _price) exitWith {["INFO",format["Tu n'as pas %1€ sur toi.",[_price] call life_fnc_numberText],"warning"] spawn ALF_fnc_doMsg;};

if(life_garage_sp isEqualType []) then {
	[_vid,_pid,SEL(life_garage_sp,0),_unit,_price,SEL(life_garage_sp,1),_spawntext] remoteExec ["HC_fnc_spawnVehicleLock",HC2_Life];
} else {
	if(life_garage_sp in ["medic_spawn_1","medic_spawn_2","medic_spawn_3"]) then {
		[_vid,_pid,life_garage_sp,_unit,_price,0,_spawntext] remoteExec ["HC_fnc_spawnVehicleLock",HC2_Life];
	} else {
		[_vid,_pid,(getMarkerPos life_garage_sp),_unit,_price,markerDir life_garage_sp,_spawntext] remoteExec ["HC_fnc_spawnVehicleLock",HC2_Life];
	};
};

hint localize "STR_Garage_SpawningVeh";
life_cash = life_cash - _price;
[0] call SOCK_fnc_updatePartial;
closeDialog 0;
