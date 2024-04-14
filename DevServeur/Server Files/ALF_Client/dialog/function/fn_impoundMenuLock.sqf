#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_impoundMenu.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Not actually a impound menu, may act as confusion to some but that is what I wanted.
	The purpose of this menu is it is now called a 'Garage' where vehicles are stored (persistent ones).
*/
private["_vehicles","_control"];
disableSerialization;
_vehicles = param [0,[],[[]]];

ctrlShow[2803,false];
ctrlShow[2830,false];
waitUntil {sleep 0.2; !isNull (findDisplay 2800)};

if(EQUAL(count _vehicles,0)) exitWith {
	ctrlSetText[2811,localize "STR_Garage_NoVehicles"];
};

_control = CONTROL(2800,2802);
lbClear _control;

{
	_vehicleInfo = [_x select 1] call life_fnc_fetchVehInfo;
	_control lbAdd (_vehicleInfo select 3);
	_control lbSetData [(lbSize _control)-1,(str [_x select 1,_x select 6,_x select 7,_x select 8,_x select 3])];
	_control lbSetPicture [(lbSize _control)-1,_vehicleInfo select 2];
	_control lbSetValue [(lbSize _control)-1,_x select 0];
} forEach _vehicles;
lbSort _control;

ctrlShow[2810,false];
ctrlShow[2811,false];