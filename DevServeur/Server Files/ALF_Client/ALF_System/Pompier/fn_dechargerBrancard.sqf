/*
	dechargerBrancard
	nanou
*/
params [
	["_v",objNull,[objNull]]
];
if(isNull _v) exitWith {};

private _b = objNull;
{
	if (typeOf _x isEqualTo "ALF_Brancard_P") exitWith {
		_b = _x;
	};
} forEach (attachedObjects _v);
if(isNull _b) exitWith {};

_b attachTo [player, [0,1.5,1.2]];
_b allowDamage false;
player addAction["Détaché",{{_x allowDamage false; detach _x; _x setPosATL [(getPosATL _x select 0),(getPosATL _x select 1),0];} forEach attachedObjects player; removeAllActions player;},"",0,false,false,"","speed player < 2 && {speed player > -1}"];
