#include "\ALF_Client\script_macros.hpp"
disableSerialization;

if ((lbCurSel 2802) isEqualTo -1) exitWith {hint localize "STR_Global_NoSelection";};

private _vehicle = lbData[2802,(lbCurSel 2802)];
_vehicle = (call compile format["%1",_vehicle]) select 0;
private _vehicleLife = _vehicle;
private _vid = lbValue[2802,(lbCurSel 2802)];

if(isNil "_vehicle") exitWith {hint localize "STR_Garage_Selection_Error"};
if(!isClass (missionConfigFile >> CONFIG_LIFE_VEHICLES >> _vehicleLife)) then {
	_vehicleLife = "Default"; //Use Default class if it doesn't exist
	diag_log format["%1: LifeCfgVehicles class doesn't exist",_vehicle];
};

private _purchasePrice = M_CONFIG(getNumber,CONFIG_LIFE_VEHICLES,_vehicleLife,"achat");
private _price = _purchasePrice * 0.01;

private _action = [format["Êtes-vous sûr de vouloir importer votre véhicule pour <t color='#74DF00'>%1 €</t>.",_price],"Validation","Importer","Annuler"] call BIS_fnc_guiMessage;
private _exit = false;
if (_action) then {
	if(_price > life_cash) then {
		private _handle = [_price,false] call ALF_fnc_handleCB;
		if(_handle) exitWith {_exit = true;};
	} else {
		life_cash = life_cash - _price;
	};
	if (_exit) exitWith {};
	
    [_vid,player,life_garage_id] remoteExec ["HC_fnc_importVehicleHC",HC2_Life];
    closeDialog 0;
};