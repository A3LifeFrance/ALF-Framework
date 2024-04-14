#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_unimpound.sqf
	Author: Bryan "Tonic" Boardwine
*/

private["_vehicleLife","_vid","_pid","_price","_purchasePrice"];

disableSerialization;

if(EQUAL(lbCurSel 2802,-1)) exitWith {hint localize "STR_Global_NoSelection"};

private _vehicle = lbData[2802,(lbCurSel 2802)];

_vehicle = (call compile format["%1",_vehicle]) select 0;
_vehicleLife = _vehicle;
_vid = lbValue[2802,(lbCurSel 2802)];
_pid = getPlayerUID player;
_spawntext = localize "STR_Garage_spawn_Success";

if(isNil "_vehicle") exitWith {hint localize "STR_Garage_Selection_Error"};
if(!isClass (missionConfigFile >> CONFIG_LIFE_VEHICLES >> _vehicleLife)) then {
	_vehicleLife = "Default";
	diag_log format["%1: LifeCfgVehicles class doesn't exist",_vehicle];
};

_price = M_CONFIG(getNumber,CONFIG_LIFE_VEHICLES,_vehicleLife,"sortie");
_purchasePrice = M_CONFIG(getNumber,CONFIG_LIFE_VEHICLES,_vehicleLife,"achat");
if (_purchasePrice > 50000) then {
	_price = round(_purchasePrice * 0.0001);
};

if(_price > life_cash) exitWith {["Garage", format["Vous n'avez pas %1 € sur vous.",_price], "warning", false] spawn ALF_fnc_doMsg;};
life_cash = life_cash - _price;

if(life_garage_sp isEqualType []) then {
	[_vid,_pid,SEL(life_garage_sp,0),player,_price,SEL(life_garage_sp,1),_spawntext] remoteExec ["HC_fnc_spawnVehicle",HC2_Life];
} else {
	if(life_garage_sp in ["med_heli_1","cop_heli_1","cop_heli_2","cop_heli_3"]) then {
		[_vid,_pid,life_garage_sp,player,_price,0,_spawntext] remoteExec ["HC_fnc_spawnVehicle",HC2_Life];
	} else {
		[_vid,_pid,(getMarkerPos life_garage_sp),player,_price,markerDir life_garage_sp,_spawntext] remoteExec ["HC_fnc_spawnVehicle",HC2_Life];
	};
};

[0] call SOCK_fnc_updatePartial;
closeDialog 0;