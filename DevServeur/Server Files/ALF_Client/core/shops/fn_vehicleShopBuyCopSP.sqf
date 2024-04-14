#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_vehicleShopBuyCopSP.sqf
	Author: ALF - Adam
*/
params [
	["_type",-1,[-1]]
];

if((time - life_action_delay) < 0.5) exitWith {["INFO", "Tu appuis trop vite.", "warning"] spawn ALF_fnc_doMsg;};
life_action_delay = time;

private _exit = false;
private _className = lbData[2302,(lbCurSel 2302)];
private _classNameLife = _className;
private _licenses = M_CONFIG(getText,CONFIG_LIFE_VEHICLES,_classNameLife,"licenses");
private _purchasePrice = M_CONFIG(getNumber,CONFIG_LIFE_VEHICLES,_classNameLife,"achat");

if !(_licenses isEqualTo "") then {
	if !(LICENSE_VALUE(_licenses)) then {_exit = true;};
};
if(_exit) exitWith {["INFO", "Tu n'as pas la licence requise.", "warning"] spawn ALF_fnc_doMsg; closeDialog 0;};
if(_purchasePrice < 0) exitWith {closeDialog 0;};

private _spawnPoints = life_veh_shop select 1;
private _spawnPoint = "";

if ((life_veh_shop select 0) in ["pompier_heli","cop_heli"]) then {
	if (((getMarkerPos _spawnPoints) nearEntities [["Air"],35]) isEqualTo []) exitWith {_spawnPoint = _spawnPoints};
} else {
	if (((getMarkerPos _spawnPoints) nearEntities [["Car","Ship","Air"],5]) isEqualTo []) exitWith {_spawnPoint = _spawnPoints};
};
if(_spawnPoint isEqualTo "") exitWith {["INFO", "Un véhicule gène le point de spawn.", "warning"] spawn ALF_fnc_doMsg; closeDialog 0;};

if(_type isEqualTo -1) then {
	private _value = missionNamespace getVariable ["CNG",0];
	if(_value < _purchasePrice) exitWith {["INFO","Il n'y a pas assez dans les caisses.","warning"] spawn ALF_fnc_doMsg; _exit = true;};

	_value = _value - _purchasePrice;
	missionNamespace setVariable ["CNG",_value,true];
	[getPlayerUID player,name player,_purchasePrice] remoteExec ["HC_fnc_retirerCNG",HC_life];
} else {
	private _value = missionNamespace getVariable ["CNP",0];
	if(_value < _purchasePrice) exitWith {["INFO","Il n'y a pas assez dans les caisses.","warning"] spawn ALF_fnc_doMsg; _exit = true;};

	_value = _value - _purchasePrice;
	missionNamespace setVariable ["CNP",_value,true];
	[getPlayerUID player,name player,_purchasePrice] remoteExec ["HC_fnc_retirerCNP",HC_life];
};
if(_exit) exitWith {};

closeDialog 0;

["INFO", format["Merci d'avoir acheté chez nous. Détail de votre commande: %1 pour %2€",getText(configFile >> "CfgVehicles" >> _className >> "displayName"),[_purchasePrice] call life_fnc_numberText], "success"] spawn ALF_fnc_doMsg;

private _vehicle = _className createVehicle [0,0,1000];
_vehicle allowDamage false;

private _type_veh = switch(true) do {
	case (_vehicle isKindOf "Car"): {"Car"};
	case (_vehicle isKindOf "Air"): {"Air"};
	case (_vehicle isKindOf "Ship"): {"Ship"};
};

deleteVehicle _vehicle;

[_type,_className,_type_veh,player] remoteExecCall ["HC_fnc_insertVehicleCopSP",HC2_Life];

true;