/*
	File: fn_inventoryClosed.sqf
*/
private _obj = param [1,objNull,[objNull]];
if(isNull _obj) exitWith {};

if((typeOf _obj) isEqualTo "GroundWeaponHolder") exitWith {
	if(count (magazineCargo _obj) isEqualTo 0 && {count (itemCargo _obj) isEqualTo 0} && {count (weaponCargo _obj) isEqualTo 0} && {count (backpackCargo _obj) isEqualTo 0}) then {
		deleteVehicle _obj;
	};
};

/*
if((typeOf _obj) isEqualTo "ALF_Citerne") exitWith {
};
*/