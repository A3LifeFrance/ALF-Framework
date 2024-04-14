#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_dispoVehicle.sqf
	Author: ALF Team
*/
disableSerialization;
params[
	["_className","",[""]],
	["_dispo",0,[0]]
];
if(_className isEqualTo "") exitWith {};

private _display = findDisplay 2300;
private _btnbye = _display displayCtrl 2309;
private _classNameLife = _className;
private _achat = M_CONFIG(getNumber,CONFIG_LIFE_VEHICLES,_classNameLife,"achat");
private _vehicleInfo = [_className] call life_fnc_fetchVehInfo;
private _maxspeed = _vehicleInfo select 7;
private _horsepower = _vehicleInfo select 10;
private _passengerseats = _vehicleInfo select 9;
private _fuel = _vehicleInfo select 11;
private _armor = _vehicleInfo select 8;
private _coffre = _vehicleInfo select 12;

ctrlShow [2330,true];
(CONTROL(2300,2303)) ctrlSetStructuredText parseText format[
	(localize "STR_Shop_Veh_UI_Ownership")+ " <t color='#8cff9b'>%1€</t><br/>Type de plaque: <t color='#8cff9b'>Française</t><br/>" +
	(localize "STR_Shop_Veh_UI_MaxSpeed")+ " %2 km/h<br/>" +
	(localize "STR_Shop_Veh_UI_HPower")+ " %3<br/>" +
	(localize "STR_Shop_Veh_UI_PSeats")+ " %4<br/>" +
	(localize "STR_Shop_Veh_UI_Fuel")+ " %5<br/>" +
	(localize "STR_Shop_Veh_UI_Armor")+ " %6<br/>Volume du coffre: %7<br/><br/>Disponibilité: %8",
	[_achat] call life_fnc_numberText,
	_maxspeed,
	_horsepower,
	_passengerseats,
	_fuel,
	_armor,
	_coffre,
	if(_dispo isEqualTo 0) then {"<t color='#FF0000'>Stock épuisé</t>"} else {format["<t color='#8cff9b'>%1 restant(s)</t>",_dispo]}
];

if(!isClass (missionConfigFile >> CONFIG_LIFE_VEHICLES >> _classNameLife)) then {
	_classNameLife = "Default";
};

if(_dispo > 0) then {_btnbye ctrlEnable true;} else {_btnbye ctrlEnable false;};
