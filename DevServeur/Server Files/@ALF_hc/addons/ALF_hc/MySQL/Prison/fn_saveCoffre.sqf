#include "\ALF_hc\hc_macros.hpp"
/*
	SaveCoffre prison
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

//On vérifie le nom du coffre
for "_i" from 1 to 23 do {
	if (_coffre isEqualTo (call compile format ["alf_coffre_prison_%1",_i])) exitWith {
		//On update le stuff coffre en BDD
		[format["UPDATE prison SET gear = '%1' WHERE id=%2",_cargo,_i],1] call HC_fnc_asyncCall;
	};
};
