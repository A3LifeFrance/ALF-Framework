#include "\ALF_Client\script_macros.hpp"

params [
	["_mode",-1,[-1]]
];

disableSerialization;

if((lbCurSel 2802) isEqualTo -1) exitWith {hint localize "STR_Global_NoSelection"};
_vehicle = lbData[2802,(lbCurSel 2802)];
_vehicle = (call compile format["%1",_vehicle]) select 0;
_vehicleLife = _vehicle;
_vid = lbValue[2802,(lbCurSel 2802)];
_unit = player;

if(isNil "_vehicle") exitWith {hint localize "STR_Garage_Selection_Error"};
if(!isClass (missionConfigFile >> CONFIG_LIFE_VEHICLES >> _vehicleLife)) then {
	_vehicleLife = "Default";
	diag_log format["%1: LifeCfgVehicles class doesn't exist",_vehicle];
};

private _price = M_CONFIG(getNumber,CONFIG_LIFE_VEHICLES,_vehicleLife,"sortie");
private _purchasePrice = M_CONFIG(getNumber,CONFIG_LIFE_VEHICLES,_vehicleLife,"achat");
if (_purchasePrice > 50000) then {
	_price = round(_purchasePrice * 0.0001);
};

if(_mode isEqualTo -1) then {
	private _value = missionNamespace getVariable ["CNG",0];
	if(_value < _price) exitWith {["INFO","Il n'y a pas assez dans les caisses.","warning"] spawn ALF_fnc_doMsg;};

	_value = _value - _price;
	missionNamespace setVariable ["CNG",_value,true];
	[getPlayerUID player,name player,_price] remoteExec ["HC_fnc_retirerCNG",HC_life];
} else {
	private _value = missionNamespace getVariable ["CNP",0];
	if(_value < _price) exitWith {["INFO","Il n'y a pas assez dans les caisses.","warning"] spawn ALF_fnc_doMsg;};

	_value = _value - _price;
	missionNamespace setVariable ["CNP",_value,true];
	[getPlayerUID player,name player,_price] remoteExec ["HC_fnc_retirerCNP",HC_life];
};

if(life_garage_sp isEqualType []) then {
	[_vid,_mode,life_garage_sp select 0,_unit,life_garage_sp select 1] remoteExec ["HC_fnc_spawnVehicleCopSP",HC2_Life];
} else {
	if(life_garage_sp in ["med_heli_1","cop_heli_1","cop_heli_2","cop_heli_3"]) then {
		[_vid,_mode,life_garage_sp,_unit,0] remoteExec ["HC_fnc_spawnVehicleCopSP",HC2_Life];
	} else {
		[_vid,_mode,(getMarkerPos life_garage_sp),_unit,markerDir life_garage_sp] remoteExec ["HC_fnc_spawnVehicleCopSP",HC2_Life];
	};
};

closeDialog 0;