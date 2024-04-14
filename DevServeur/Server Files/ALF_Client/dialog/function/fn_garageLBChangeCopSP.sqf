#include "\ALF_Client\script_macros.hpp"

disableSerialization;
private["_plate","_fuel","_control","_index","_className","_dataArr","_vehicleInfo"];
_control = _this select 0;
_index = _this select 1;

private _display = findDisplay 2801;
private _controlsGroup = _display displayCtrl 2804;
private _controlText = _controlsGroup controlsGroupCtrl 2803;

private _btnsortir = _display displayCtrl 97482;
private _btnvendre = _display displayCtrl 97483;

_dataArr = CONTROL_DATAI(_control,_index);
if (_dataArr isEqualTo "affichage") exitWith {
	_btnsortir ctrlShow false;
	_btnvendre ctrlShow false;
	ctrlShow [2804,false];
	ctrlShow [2830,false];
};
_dataArr = parseSimpleArray _dataArr;

_btnsortir ctrlShow true;
_btnvendre ctrlShow true;
ctrlShow [2804,true];

_className = _dataArr select 0;
_plate = _dataArr select 1;
_fuel = _dataArr select 2;
_damage = _dataArr select 3;
private _garage = _dataArr select 4;
private _type = _dataArr select 5;

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

if ((count _dataArr) isEqualTo 5) then {
	_controlText ctrlSetStructuredText parseText format["
		Véhicule: %1<br/>
		Plaque: <t color='#8cff9b'>%2</t><br/>
		Jour(s) restant(s): <t color='#8cff9b'>%3</t><br/>
		",
		_vehicleInfo select 3,
		_plateFinal,
		_dataArr select 4
	];
	_btnsortir ctrlShow false;
	_btnvendre ctrlShow false;
} else {
	_controlText ctrlSetStructuredText parseText format["
		Véhicule: %1<br/>
		Assurance: <t color='#8cff9b'>Assuré</t><br/>
		Siège passager: <t color='#8cff9b'>%2</t><br/>
		Réservoir: <t color='#8cff9b'>%3%4</t><br/>
		Plaque: <t color='#8cff9b'>%5</t><br/>
		Vitesse Max: <t color='#8cff9b'>%6 km/h</t><br/>
		Puissance: <t color='#8cff9b'>%7 rtpm</t><br/>
		Résistance: <t color='#8cff9b'>%8</t><br/>
		Volume du coffre: <t color='#8cff9b'>%9</t><br/>
		Endommager: <t %10</t><br/>
		Présence: %11<br/>
		",
		_vehicleInfo select 3,
		_vehicleInfo select 10,
		_fuelFinal,
		"%",
		_plateFinal,
		_vehicleInfo select 7,
		_vehicleInfo select 8,
		_vehicleInfo select 9,
		_vehicleInfo select 12,
		["color='#db3939'> Oui","color='#8cff9b'> Non"] select (_damage isEqualTo [] || {({_x > 0.1} count _damage) isEqualTo 0}),
		if ((_garage isEqualTo life_garage_id) || (_garage isEqualTo 0)) then {"<t color='#8cff9b'>Dans ce garage</t>"} else {"<t color='#FF0000'>A importer</t>"}
	]; 
	
	if ((_garage isEqualTo life_garage_id) || (_garage isEqualTo 0)) then {
		_btnsortir ctrlSetText "SORTIR";
		_btnsortir buttonSetAction format["[%1] spawn life_fnc_unimpoundCopSP;",_type];
	} else {
		_btnsortir ctrlSetText "Importer";
		_btnsortir buttonSetAction format["[%1] spawn ALF_fnc_importVehicleCopSP;",_type];
		_btnvendre ctrlShow false;
    };
};

private _h = ctrlTextHeight _controlText;
private _position = ctrlPosition _controlText;
_controlText ctrlSetPosition [_position select 0,_position select 1,_position select 2,_h];
_controlText ctrlCommit 0;

ctrlShow [2803,true];
ctrlShow [2830,true];