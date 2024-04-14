#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_impoundMenu.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Not actually a impound menu, may act as confusion to some but that is what I wanted.
	The purpose of this menu is it is now called a 'Garage' where vehicles are stored (persistent ones).
*/
disableSerialization;
params [
	["_vehNonFourriere",[],[[]]],
	["_vehFourriere",[],[[]]]
];

ctrlShow[2804,false];
ctrlShow[2830,false];
waitUntil {sleep 0.2; !isNull (findDisplay 2800)};

private _d = findDisplay 2800;
private _btnassu = _d displayCtrl 97480;
private _btnassupro = _d displayCtrl 97481;
private _btntransfert = _d displayCtrl 97484;
private _btnsortir = _d displayCtrl 97482;
private _btnvendre = _d displayCtrl 97483;
_btnassu ctrlShow false;
_btnassupro ctrlShow false;
_btntransfert ctrlShow false;
_btnsortir ctrlShow false;
_btnvendre ctrlShow false;

if(_vehNonFourriere isEqualTo [] && {_vehFourriere isEqualTo []}) exitWith {
	ctrlSetText[2811,localize "STR_Garage_NoVehicles"];
};

private _control = CONTROL(2800,2802);
lbClear _control;

{
	_vehicleInfo = [_x select 1] call life_fnc_fetchVehInfo;
	_control lbAdd (_vehicleInfo select 3);
	_control lbSetData [(lbSize _control)-1,(str([_x select 1,_x select 6,_x select 7,_x select 8,_x select 9,_x select 12,_x select 13]))];
	_control lbSetPicture [(lbSize _control)-1,_vehicleInfo select 2];
	_control lbSetValue [(lbSize _control)-1,_x select 0];
} forEach _vehNonFourriere;
lbSort _control;

ctrlShow[2810,false];
ctrlShow[2811,false];
ctrlShow[97480,false];

if (_vehFourriere isEqualTo []) exitWith {};

_index = _control lbAdd "";
_control lbSetData [_index,"affichage"];
_index = _control lbAdd "\\\\\\\\FOURRIERE\\\\\\\\\\";
_control lbSetData [_index,"affichage"];
_index = _control lbAdd "";
_control lbSetData [_index,"affichage"];

_vehFourriere = [_vehFourriere,[],{([_x select 1] call life_fnc_fetchVehInfo) select 3},"ASCEND"] call BIS_fnc_sortBy;

{
	_vehicleInfo = [_x select 1] call life_fnc_fetchVehInfo;
	_control lbAdd (_vehicleInfo select 3);
	_control lbSetData [(lbSize _control)-1,(str([_x select 1,_x select 6,_x select 7,_x select 8,_x select 9,_x select 11,"",0]))];
	_control lbSetPicture [(lbSize _control)-1,_vehicleInfo select 2];
	_control lbSetValue [(lbSize _control)-1,_x select 0];
} forEach _vehFourriere;
