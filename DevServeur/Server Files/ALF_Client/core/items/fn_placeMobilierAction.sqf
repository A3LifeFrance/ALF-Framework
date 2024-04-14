/*
	File : fn_placeMobilierAction.sqf
	Author: ALF Team
	Description:
	Place mobilier Action
*/
if(!life_mobilier_active) exitWith {};
if(life_mobilier_activeObj isEqualTo objNull) exitWith {};

private _mobilier = life_mobilier_activeObj;
_mobilier setPosWorld (getPosWorld _mobilier);
life_mobilier_activePos = getPosWorld _mobilier;
life_mobilier_activeDir = getDir _mobilier;

[_mobilier,false] call life_fnc_placeMobilier;
life_mobilier_active = false;
life_mobilier_activeObj = objNull;
