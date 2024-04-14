#include "\ALF_hc\hc_macros.hpp"
/*
	SaveBanqueSang
*/
private _coffre = _this select 0;
if(isNull _coffre) exitWith {};

//On récupère le stuff dans le coffre
private _vehItems = getItemCargo _coffre;
private _vehMags = getMagazineCargo _coffre;
private _vehWeapons = getWeaponCargo _coffre;
private _vehBackpacks = getBackpackCargo _coffre;
private _cargo = [_vehItems,_vehMags,_vehWeapons,_vehBackpacks];
_cargo = [_cargo] call HC_fnc_mresArray;

[format["UPDATE banquesang SET gear = '%1' WHERE id=1",_cargo],1] call HC_fnc_asyncCall;