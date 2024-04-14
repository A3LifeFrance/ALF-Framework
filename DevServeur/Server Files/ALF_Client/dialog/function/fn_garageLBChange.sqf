#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_garageLBChange.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Can't be bothered to answer it.. Already deleted it by accident..
*/
disableSerialization;
private["_plate","_fuel","_control","_index","_className","_dataArr","_vehicleColor","_vehicleInfo","_sellPrice","_retrievePrice","_insure","_insurecount"];
_control = SEL(_this,0);
_index = SEL(_this,1);

private _display = findDisplay 2800;
private _controlsGroup = _display displayCtrl 2804;
private _controlText = _controlsGroup controlsGroupCtrl 2803;

private _btnassu = _display displayCtrl 97480;
private _btnassupro = _display displayCtrl 97481;
private _btntransfert = _display displayCtrl 97484;
private _btnsortir = _display displayCtrl 97482;
private _btnvendre = _display displayCtrl 97483;

//Fetch some information.
_dataArr = CONTROL_DATAI(_control,_index);
if (_dataArr isEqualTo "affichage") exitWith {
	_btnassu ctrlShow false;
	_btnassupro ctrlShow false;
	_btntransfert ctrlShow false;
	_btnsortir ctrlShow false;
	_btnvendre ctrlShow false;
	ctrlShow [2804,false];
	ctrlShow [2830,false];
};
_dataArr = parseSimpleArray _dataArr;

_btnassu ctrlShow true;
_btnassupro ctrlShow true;
_btnsortir ctrlShow true;
_btnvendre ctrlShow true;
ctrlShow [2804,true];

_className = _dataArr select 0;
_plate = _dataArr select 1;
_fuel = _dataArr select 2;
_insure = _dataArr select 3;
_insurecount = _dataArr select 4;
_damage = _dataArr select 5;
private _garage = _dataArr select 6;

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
private _purchasePrice = M_CONFIG(getNumber,CONFIG_LIFE_VEHICLES,_className,"achat");
_sellPrice = M_CONFIG(getNumber,CONFIG_LIFE_VEHICLES,_className,"vente");
if (_purchasePrice > 50000) then {
	_retrievePrice = round(_purchasePrice * 0.0001);
};

if(_sellPrice < 1) then {_sellPrice = 50;};
if(_retrievePrice < 1) then {_retrievePrice = 5;};

if((life_axa isEqualTo 0) || (_garage in [-1,-2])) then {
	_btnassu ctrlShow false;
	_btnassupro ctrlShow false;
} else {
	if(life_axa isEqualTo 1 && {life_axacount >= 2}) then {
		_btnassu ctrlShow false;
	} else {
		if(life_axa isEqualTo 2 && {life_axacount >= 5}) then {
			_btnassu ctrlShow false;
		} else {
			if(life_axa isEqualTo 3 && {life_axacount >= 10}) then {
				_btnassu ctrlShow false;
			} else {
				if(life_axa isEqualTo 4 && {life_axacount >= 20}) then {
					_btnassu ctrlShow false;
				} else {
					_btnassu ctrlShow true;
				};
			};
		};
	};
	if((_insure isEqualTo 1) && !(_garage in [-1,-2])) then {
		_btnassu ctrlShow true;
		_btnassupro ctrlShow false;
		_btnassu ctrlSetStructuredText parseText "RESILIATION";
		_btnassu buttonSetAction "[0] spawn ALF_fnc_insureSystem;";
	} else {
		if ((_insure isEqualTo 2) && !(_garage in [-1,-2])) then {
			_btnassu ctrlShow false;
			_btnassupro ctrlSetStructuredText parseText "RESILIATION PRO";
			_btnassupro buttonSetAction "[2] spawn ALF_fnc_insureSystem;";
		} else {
			_btnassu ctrlSetStructuredText parseText "ASSURER";
			_btnassu buttonSetAction "[1] spawn ALF_fnc_insureSystem;";
			_btnassupro ctrlSetStructuredText parseText "ASSURER PRO";
			_btnassupro buttonSetAction "[3] spawn ALF_fnc_insureSystem;";
			if (life_axaprocount >= 3) then {
				_btnassupro ctrlShow false;
			};
			if (life_axaprocount <= 15 && {b_1}) then {
				_btnassupro ctrlShow true;
			};
			if (life_axaprocount <= 8 && {life_copLevel >= 1 || life_medicLevel >= 1 || life_penit >= 1}) then {
				_btnassupro ctrlShow true;
			};
		};
	};
};

if (life_penit <= 0 && {!b_1}) then {
	_btnassupro ctrlShow false;
};

if (!((player getVariable ["isEmployed",""]) isEqualTo "") && !(_garage in [-1,-2])) then {
	_btntransfert ctrlShow true;
	_btntransfert buttonSetAction "[] spawn ALF_fnc_businessTransfertVeh;";
};

private _textassurance = switch (_insure) do {
  case 0: {
    "<t color='#FF0000'>Pas d'assurance</t>"
  };
	case 1: {
    "<t color='#8cff9b'>Assuré</t>"
  };
	case 2: {
    "<t color='#8cff9b'>Assuré Pro</t>"
  };
};

if ((count _dataArr) isEqualTo 8) then {
	_controlText ctrlSetStructuredText parseText format["
		Véhicule: %1<br/>
		Plaque: <t color='#8cff9b'>%2</t><br/>
		Jour(s) restant(s): <t color='#8cff9b'>%3</t><br/>
		",
		_vehicleInfo select 3,
		_plateFinal,
		_dataArr select 5
	];
	_btnassu ctrlShow false;
	_btnassupro ctrlShow false;
	_btnsortir ctrlShow false;
	_btnvendre ctrlShow false;
} else {
	_controlText ctrlSetStructuredText parseText format["
		Véhicule: %1<br/>
		Prix de sortie: <t color='#8cff9b'>%2€</t><br/>
		Prix de vente: <t color='#8cff9b'>%3€</t><br/>
		Assurance: %12<br/>
		Sinistre: %13<br/><br/>
		Siège passager: <t color='#8cff9b'>%9</t><br/>
		Réservoir: <t color='#8cff9b'>%4%5</t><br/>
		Plaque: <t color='#8cff9b'>%6</t><br/>
		Vitesse Max: <t color='#8cff9b'>%7 km/h</t><br/>
		Puissance: <t color='#8cff9b'>%10 rtpm</t><br/>
		Résistance: <t color='#8cff9b'>%8</t><br/>
		Volume du coffre: <t color='#8cff9b'>%11</t><br/>
		Endommager: <t %14</t><br/>
		Présence: %15<br/>
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
		_textassurance,
		_insurecount,
		["color='#db3939'> Oui","color='#8cff9b'> Non"] select (_damage isEqualTo [] || {({_x > 0.1} count _damage) isEqualTo 0}),
		if ((_garage isEqualTo life_garage_id) || (_garage isEqualTo 0)) then {"<t color='#8cff9b'>Dans ce garage</t>"} else {"<t color='#FF0000'>A importer</t>"}
	]; 
	
	if ((_garage isEqualTo life_garage_id) || (_garage isEqualTo 0)) then {
		_btnsortir ctrlSetText "SORTIR";
		_btnsortir buttonSetAction "[] spawn life_fnc_unimpound;";
	} else {
		_btnsortir ctrlSetText "Importer";
		_btnsortir buttonSetAction "[] spawn ALF_fnc_importVehicle;";
        _btnassu ctrlShow false;
		_btnassupro ctrlShow false;
		_btnvendre ctrlShow false;
    };
};

private _h = ctrlTextHeight _controlText;
private _position = ctrlPosition _controlText;
_controlText ctrlSetPosition [_position select 0,_position select 1,_position select 2,_h];
_controlText ctrlCommit 0;

ctrlShow [2803,true];
ctrlShow [2830,true];
