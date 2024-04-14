/*
	File : fn_MobilierInBuilding.sqf
	Author: NiiRoZz
	Description:
	Indicates whether a mobilier is in a building.
	Parameter(s):
	0: OBJECT - Unit
	Returns:
	BOOL - true if mobilier is in a building, else false
	Example
	//--- Find if a unit is in building
	[mobilier,house] call life_fnc_MobilierInBuilding
*/
params [
    ["_unit",objNull,[objNull]],
	["_house1",objNull,[objNull]]
];

if (isNull _unit || {isNull _house1}) exitWith {false};

lineIntersectsSurfaces [
	getPosWorld _unit, 
	getPosWorld _unit vectorAdd [0, 0, 50], 
	_unit, player, true, 1, "GEOM", "NONE"
] select 0 params ["","","","_houseroof"];

lineIntersectsSurfaces [
	getPosWorld _unit, 
	getPosWorld _unit vectorAdd [0, 0, -50], 
	_unit, player, true, 1, "GEOM", "NONE"
] select 0 params ["","","","_housefloor"];

(_housefloor isEqualTo _house1 && {_houseroof isEqualTo _house1})