#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_sellGarageBusiness.sqf
	Author: ALF TEAM
*/
private["_vehicle","_vehicleLife","_vid","_pid","_sellPrice","_multiplier","_price","_purchasePrice"];
disableSerialization;
if(EQUAL(lbCurSel 2802,-1)) exitWith {hint localize "STR_Global_NoSelection"};
_vehicle = lbData[2802,(lbCurSel 2802)];
_vehicle = (call compile format["%1",_vehicle]) select 0;
_vehicleLife = _vehicle;
_vid = lbValue[2802,(lbCurSel 2802)];
_pid = getPlayerUID player;

if(isNil "_vehicle") exitWith {hint localize "STR_Garage_Selection_Error"};
if((time - life_action_delay) < 1.5) exitWith {hint "Tu appuis trop vite.";};
if(!isClass (missionConfigFile >> CONFIG_LIFE_VEHICLES >> _vehicleLife)) then {
	_vehicleLife = "Default";
};
_price = M_CONFIG(getNumber,CONFIG_LIFE_VEHICLES,_vehicleLife,"vente");

private _action = [format["Veux-tu vendre ce véhicule pour %1€.",[_price] call life_fnc_numberText],"Entreprise","OUI","NON"] call BIS_fnc_guiMessage;
if !(_action) exitWith {};
closeDialog 0;

[_vid,_pid] remoteExecCall ["HC_fnc_vehicleDelete",HC2_Life];

private _building = life_garage_sp select 2;
private _var = _building getVariable ["business",[]];
private _capitalstr = _var select 3;
private _siretstr = _var select 2;

_capitalstr = _capitalstr + _price;
_var set[3,_capitalstr];
_building setVariable ["business",_var,true];
[_siretstr,_capitalstr] remoteExec ["HC_fnc_capitalBusiness",HC2_life];

life_action_delay = time;
