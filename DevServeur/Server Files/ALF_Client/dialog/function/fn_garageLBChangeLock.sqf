#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_garageLBChange.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Can't be bothered to answer it.. Already deleted it by accident..
*/
disableSerialization;
private["_plate","_fuel","_control","_index","_className","_dataArr","_vehicleColor","_vehicleInfo","_sellPrice","_retrievePrice","_insure","_pid"];
_control = SEL(_this,0);
_index = SEL(_this,1);

private _d = findDisplay 2800;

//Fetch some information.
_dataArr = CONTROL_DATAI(_control,_index);
_dataArr = call compile format["%1",_dataArr];

_className = _dataArr select 0;
_plate = _dataArr select 1;
_fuel = _dataArr select 2;
_insure = _dataArr select 3;
_pid = _dataArr select 4;

_fuelFinal = format["%1",floor(_fuel * 100)];

_plate1 = _plate select 0;
_plate2 = _plate select 1;
_plate3 = _plate select 2;
_plate4 = _plate select 3;
_plate5 = _plate select 4;
_plate6 = _plate select 5;
_plate7 = _plate select 6;
_plate8 = _plate select 7;
_plate9 = _plate select 8;
_plateFinal = format["%1%2%3%4%5%6%7%8%9",_plate1,_plate2,_plate3,_plate4,_plate5,_plate6,_plate7,_plate8,_plate9];

if(!isClass (missionConfigFile >> CONFIG_LIFE_VEHICLES >> _className)) then {
	_className = "Default"; //Use Default class if it doesn't exist
	diag_log format["%1: LifeCfgVehicles class doesn't exist",_className];
};

_vehicleInfo = [_className] call life_fnc_fetchVehInfo;

_retrievePrice = M_CONFIG(getNumber,CONFIG_LIFE_VEHICLES,_className,"sortie");
_sellPrice = M_CONFIG(getNumber,CONFIG_LIFE_VEHICLES,_className,"vente");

if(_sellPrice < 1) then {_sellPrice = 50;};
if(_retrievePrice < 1) then {_retrievePrice = 50;};

(CONTROL(2800,2803)) ctrlSetStructuredText parseText format["
	Véhicule: %1<br/>
	Prix de sortie: <t color='#8cff9b'>%2€</t><br/>
	Prix de vente: <t color='#8cff9b'>%3€</t><br/>
	Assurance: %12<br/><br/>
	Siège passager: <t color='#8cff9b'>%9</t><br/>
	Réservoir: <t color='#8cff9b'>%4%5</t><br/>
	Plaque: <t color='#8cff9b'>%6</t><br/>
	Vitesse Max: <t color='#8cff9b'>%7 km/h</t><br/>
	Puissance: <t color='#8cff9b'>%10 rtpm</t><br/>
	Résistance: <t color='#8cff9b'>%8</t><br/>
	Volume du coffre: <t color='#8cff9b'>%11</t><br/>
	",
	_vehicleInfo select 3,
	[_retrievePrice] call life_fnc_numberText,
	[_sellPrice] call life_fnc_numberText,
	_fuelFinal,
	"%",
	_plateFinal,
	_vehicleInfo select 7,
	_vehicleInfo select 8,
	_vehicleInfo select 9,
	_vehicleInfo select 10,
	_vehicleInfo select 12,
	if (_insure isEqualTo 1) then {"<t color='#8cff9b'>Assuré</t>"} else {"<t color='#FF0000'>Pas d'assurance</t>"}
];

ctrlShow [2803,true];
ctrlShow [2830,true];
