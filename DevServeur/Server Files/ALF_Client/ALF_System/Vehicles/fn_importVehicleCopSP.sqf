#include "\ALF_Client\script_macros.hpp"
params [
	["_type",-1,[-1]]
];

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

private _price = M_CONFIG(getNumber,CONFIG_LIFE_VEHICLES,_vehicleLife,"achat") * 0.01;

private _action = [format["Êtes-vous sûr de vouloir importer votre véhicule pour <t color='#74DF00'>%1 €</t>.",_price],"Validation","Importer","Annuler"] call BIS_fnc_guiMessage;
private _exit = false;
if (_action) then {
	if(_type isEqualTo -1) then {
		private _value = missionNamespace getVariable ["CNG",0];
		if(_value < _price) exitWith {["INFO","Il n'y a pas assez dans les caisses.","warning"] spawn ALF_fnc_doMsg; _exit = true;};

		_value = _value - _price;
		missionNamespace setVariable ["CNG",_value,true];
		[getPlayerUID player,name player,_price] remoteExec ["HC_fnc_retirerCNG",HC_life];
	} else {
		private _value = missionNamespace getVariable ["CNP",0];
		if(_value < _price) exitWith {["INFO","Il n'y a pas assez dans les caisses.","warning"] spawn ALF_fnc_doMsg; _exit = true;};

		_value = _value - _price;
		missionNamespace setVariable ["CNP",_value,true];
		[getPlayerUID player,name player,_price] remoteExec ["HC_fnc_retirerCNP",HC_life];
	};
	if (_exit) exitWith {};

    [_vid,player,life_garage_id,_type] remoteExec ["HC_fnc_importVehicleHCCopSP",HC2_Life];
    closeDialog 0;
};