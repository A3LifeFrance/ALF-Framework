/*
	File : fn_setDirMobilier.sqf
	Author: ALF Team
*/
if(!life_mobilier_active) exitWith {};
if(life_mobilier_activeObj isEqualTo objNull) exitWith {};
private _mobilier = life_mobilier_activeObj;

private _dir = getDir _mobilier;
_dir = _dir + 3;
if(_dir > 360) then {_dir = 0;};
_mobilier setDir _dir;
