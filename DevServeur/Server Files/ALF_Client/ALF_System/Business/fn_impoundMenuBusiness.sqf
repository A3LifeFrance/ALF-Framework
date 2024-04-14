#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_impoundMenuBusiness.sqf
	Author: Nanou
*/
private["_vehicles","_building","_control"];
disableSerialization;
_vehicles = _this select 0;
_building = _this select 1;
life_veh_shop = _building;

ctrlShow[2803,false];
ctrlShow[2830,false];
waitUntil {sleep 0.2; !isNull (findDisplay 2800)};

if(count _vehicles isEqualTo 0) exitWith {
	ctrlSetText[2811,localize "STR_Garage_NoVehicles"];
};

_vehicles = [_vehicles,[],{([_x select 1] call life_fnc_fetchVehInfo) select 3},"ASCEND"] call BIS_fnc_sortBy;

_control = CONTROL(2800,2802);
lbClear _control;

{
	_vehicleInfo = [_x select 1] call life_fnc_fetchVehInfo;
	_control lbAdd (_vehicleInfo select 3);
	_tmp = [_x select 1,_x select 4,_x select 5,_x select 6];
	_tmp = str(_tmp);
	_control lbSetData [(lbSize _control)-1,_tmp];
	_control lbSetPicture [(lbSize _control)-1,_vehicleInfo select 2];
	_control lbSetValue [(lbSize _control)-1,_x select 0];
} forEach _vehicles;

ctrlShow[2810,false];
ctrlShow[2811,false];
