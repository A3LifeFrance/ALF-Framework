#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_sellGarage.sqf
	Author: ALF TEAM
*/
private["_vehicle","_vehicleLife","_vid","_pid","_price","_insure"];
disableSerialization;
if(lbCurSel 2802 isEqualTo -1) exitWith {hint "1"};
_vehicle = lbData[2802,(lbCurSel 2802)];
_vehicle = (call compile format["%1",_vehicle]) select 0;
_insure = lbData[2802,(lbCurSel 2802)];
_insure = (call compile format["%1",_insure]) select 3;
_vehicleLife = _vehicle;
_vid = lbValue[2802,(lbCurSel 2802)];
_pid = getPlayerUID player;

if(isNil "_vehicle") exitWith {hint "2"};
if((time - life_action_delay) < 1.5) exitWith {hint "Tu appuis trop vite.";};
if(!isClass (missionConfigFile >> CONFIG_LIFE_VEHICLES >> _vehicleLife)) then {
	_vehicleLife = "Default";
};
_price = M_CONFIG(getNumber,CONFIG_LIFE_VEHICLES,_vehicleLife,"vente");

private _action = [format["Es-tu sur de vouloir vendre ce véhicule pour %1€.",[_price] call life_fnc_numberText],"Garage","OUI","NON"] call BIS_fnc_guiMessage;
if (!_action) exitWith {};
closeDialog 0;

[_vid,_pid] remoteExecCall ["HC_fnc_vehicleDelete",HC2_Life];

if(_insure isEqualTo 1) then {
	life_axacount = life_axacount - 1;
	[15] call SOCK_fnc_updatePartial;
};

if(_insure isEqualTo 2) then {
	life_axaprocount = life_axaprocount - 1;
	[17] call SOCK_fnc_updatePartial;
};

hint format[localize "STR_Garage_SoldCar",[_price] call life_fnc_numberText];
life_cash = life_cash + _price;
[0] call SOCK_fnc_updatePartial;

[name player,getPlayerUID player,"VEHICULE",format["vient de vendre %1 pour %2€.",_vehicleLife,_price]] remoteExec ["HC_fnc_logIt",HC3_Life];

[_vehicleLife] remoteExecCall ["HC_fnc_vehicleStockAfterSell",HC2_Life];

life_action_delay = time;
