/*
	File: fn_actionPoints.sqf
	Author: ALF Team
*/
params [
	["_unit",objNull,[objNull]]
];
disableSerialization;
if !(createDialog "Life_point_give") exitWith {};
if (isNull _unit OR {!isPlayer _unit}) exitWith {};
ctrlSetText[2751,"Points"];
life_pInact_curObject = _unit;

private _btn = (findDisplay 2750) displayCtrl 2753;
_btn buttonSetAction "[life_pInact_curObject] call ALF_fnc_enleverPoints;";
