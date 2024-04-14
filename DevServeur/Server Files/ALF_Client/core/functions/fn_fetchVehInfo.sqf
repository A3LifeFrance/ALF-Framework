#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_fetchVehInfo.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Used in returning information about a vehicle from Config >> CONFIG_VEHICLES

	Return:
	0: classname
	1: scope
	2: picture
	3: displayname
	4: vehicleclass
	5: faction
	6: Base / Superclass
	7: Max Speed
	8: Armor Rating
	09: Passenger Seats
	10: Max Horse power
	11: Fuel Capacity
	12: Coffre
*/
params [
	["_class","",[""]]
];
if (_class isEqualTo "") exitWith {[]}; //Bad class passed.
if !(isClass (configFile >> CONFIG_VEHICLES >> _class)) exitWith {[]}; //Class doesn't exist in CfgVehicles

//Predefine some stuff.
private _scope = -1;
private _picture = "";
private _displayName = "";
private _vehicleClass = "";
private _faction = "";
private _speed = 0;
private _armor = 0;
private _seats = 0;
private _hp = 0;
private _fuel = 0;

//Fetch
_scope = FETCH_CONFIG2(getNumber,CONFIG_VEHICLES,_class,"scope");
_picture = FETCH_CONFIG2(getText,CONFIG_VEHICLES,_class,"picture");
_displayName = FETCH_CONFIG2(getText,CONFIG_VEHICLES,_class,"displayName");
_vehicleClass = FETCH_CONFIG2(getText,CONFIG_VEHICLES,_class,"vehicleClass");
_faction = FETCH_CONFIG2(getText,CONFIG_VEHICLES,_class,"faction");
_superClass = BASE_CONFIG(CONFIG_VEHICLES,_class);
_speed = FETCH_CONFIG2(getNumber,CONFIG_VEHICLES,_class,"maxSpeed");
_armor = FETCH_CONFIG2(getNumber,CONFIG_VEHICLES,_class,"armor");
_seats = FETCH_CONFIG2(getNumber,CONFIG_VEHICLES,_class,"transportSoldier");
_hp = FETCH_CONFIG2(getNumber,CONFIG_VEHICLES,_class,"enginePower");
_fuel = FETCH_CONFIG2(getNumber,CONFIG_VEHICLES,_class,"fuelCapacity");
_coffre = FETCH_CONFIG2(getNumber,CONFIG_VEHICLES,_class,"maximumLoad");

//Return
[_class,_scope,_picture,_displayName,_vehicleClass,_faction,_superClass,_speed,_armor,_seats,_hp,_fuel,_coffre]
