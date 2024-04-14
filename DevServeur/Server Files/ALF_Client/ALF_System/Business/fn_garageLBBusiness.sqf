#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_garageLBBusiness.sqf
	Author: Nanou
*/
disableSerialization;
private _control = _this select 0;
private _index = _this select 1;

private _dataArr = CONTROL_DATAI(_control,_index);
_dataArr = call compile format["%1",_dataArr];

private _className = _dataArr select 0;
private _plate = _dataArr select 1;
private _fuel = _dataArr select 2;
private _insure = _dataArr select 3;

private _building = life_veh_shop;
private _var = _building getVariable ["business",[]];
private _owner = _var select 0;

private _fuelFinal = format["%1",floor(_fuel * 100)];

private _plate1 = _plate select 0;
private _plate2 = _plate select 1;
private _plate3 = _plate select 2;
private _plate4 = _plate select 3;
private _plate5 = _plate select 4;
private _plate6 = _plate select 5;
private _plate7 = _plate select 6;
private _plate8 = _plate select 7;
private _plate9 = _plate select 8;
private _plateFinal = format["%1%2%3%4%5%6%7%8%9",_plate1,_plate2,_plate3,_plate4,_plate5,_plate6,_plate7,_plate8,_plate9];

if(!isClass (missionConfigFile >> CONFIG_LIFE_VEHICLES >> _className)) then {
	_className = "Default";
};

private _vehicleInfo = [_className] call life_fnc_fetchVehInfo;

private _retrievePrice = M_CONFIG(getNumber,CONFIG_LIFE_VEHICLES,_className,"sortie");
private _sellPrice = M_CONFIG(getNumber,CONFIG_LIFE_VEHICLES,_className,"vente");

if(_sellPrice < 1) then {_sellPrice = 50;};
if(_retrievePrice < 1) then {_retrievePrice = 50;};
private _uid = getPlayerUID player;
if(_insure isEqualTo 0 && {_uid isEqualTo _owner}) then { ctrlShow [97480,true]; } else { ctrlShow [97480,false]; };
if(_uid isEqualTo _owner) then { ctrlShow [97479,true]; } else { ctrlShow [97479,false]; };
private _d = findDisplay 2800;
private _btnassu = _d displayCtrl 97480;

if (_uid isEqualTo _owner && {_insure isEqualTo 1 || _insure isEqualTo 3}) then {
	_btnassu ctrlShow true;
	_btnassu ctrlSetStructuredText parseText "RESILIATION";
	_btnassu buttonSetAction "[1] spawn ALF_fnc_insureBusiness;";
} else {
	if (_uid isEqualTo _owner) then {
		_btnassu ctrlShow true;
		_btnassu ctrlSetStructuredText parseText "ASSURER";
		_btnassu buttonSetAction "[0] spawn ALF_fnc_insureBusiness;";
	} else {
		_btnassu ctrlShow false;
	};
};

(CONTROL(2800,2803)) ctrlSetStructuredText parseText format["
	Véhicule: %1<br/>
	Prix de sortie: <t color='#8cff9b'>%2€</t><br/>
	Prix de vente: <t color='#8cff9b'>%3€</t><br/>
	Assurance: %12<br/>
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
	if(_insure >= 1) then {"<t color='#8cff9b'>Assuré</t>"} else {"<t color='#FF0000'>Pas d'assurance</t>"}
];

ctrlShow [2803,true];
ctrlShow [2830,true];
