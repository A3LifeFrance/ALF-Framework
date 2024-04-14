#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_businessGarage.sqf
*/
private _building = _this select 0;
private _var = _building getVariable ["business",[]];
if(count _var isEqualTo 0) exitWith {};
private _owner = _var select 0;
private _siretstr = _var select 2;
private _secteur = _var select 4;
private _membres = _var select 5;
private _uid = getPlayerUID player;
private _exit = false;
{
	private _memberuid = _x select 1;
	if(_memberuid isEqualTo _uid) exitWith {_exit = true;};
} forEach _membres;
if !(_exit) exitWith {};

life_garage_sp = [(_building modelToWorldVisualWorld [-8,-14,0]),getDir _building,_building];

createDialog "Life_impound_menuv2";
disableSerialization;
ctrlSetText[2802,"Recherche de véhicules.."];

[_building] spawn ALF_fnc_BusinessGarageGlitch;

[_building,_siretstr,_owner,player] remoteExec ["HC_fnc_getVehiclesBusiness",HC2_Life];
