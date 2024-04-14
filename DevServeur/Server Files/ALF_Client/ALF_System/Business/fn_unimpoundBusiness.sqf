#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_unimpoundBusiness.sqf
	Author: Nanou
*/
private["_vehicle","_vehicleLife","_vid","_pid","_unit","_price"];
disableSerialization;
if(lbCurSel 2802 isEqualTo -1) exitWith {hint localize "STR_Global_NoSelection"};
_vehicle = lbData[2802,(lbCurSel 2802)];
_vehicle = (call compile format["%1",_vehicle]) select 0;
_vehicleLife = _vehicle;
_vid = lbValue[2802,(lbCurSel 2802)];
_unit = player;
if(isNil "_vehicle") exitWith {hint localize "STR_Garage_Selection_Error"};
if(!isClass (missionConfigFile >> CONFIG_LIFE_VEHICLES >> _vehicleLife)) then {
	_vehicleLife = "Default";
};
_price = M_CONFIG(getNumber,CONFIG_LIFE_VEHICLES,_vehicleLife,"sortie");

private _business = life_garage_sp select 2;
private _var = _business getVariable ["business",[]];
private _capitalstr = _var select 3;
private _siretstr = _var select 2;
private _pid = _var select 0;
private _membres = _var select 5;

if(_capitalstr < _price) exitWith {hint format[(localize "STR_Garage_CashError"),[_price] call life_fnc_numberText];};
[_vid,life_garage_sp select 0,life_garage_sp select 1,_unit,_siretstr,_membres] remoteExec ["HC_fnc_spawnVehicleBusiness",HC2_Life];
hint localize "STR_Garage_SpawningVeh";
private _newvalue = _capitalstr - _price;
_var set[3,_newvalue];
_business setVariable ["business",_var,true];
[_siretstr,_newvalue] remoteExec ["HC_fnc_capitalBusiness",HC2_life];

closeDialog 0;
