/*
	File: fn_clearVehicleAmmo.sqf
*/
params [
	["_vehicle",objNull,[objNull]]
];
if(isNull _vehicle) exitWith {};

clearWeaponCargoGlobal _vehicle;
clearMagazineCargoGlobal _vehicle;
clearItemCargoGlobal _vehicle;
clearBackpackCargoGlobal _vehicle;
