/*
	File : fn_createFireVehicle.sqf
	Author: ALF Team
*/
params [
	["_vehicle",objNull,[objNull]]
];

private ["_pos","_fire"];
private _allFires = [];

//Cette partie permet de generer dans la taille exacte du vehicule
private _boundingbox = [_vehicle] call HC_fnc_getBoundingBox;
_p1 = _boundingbox select 0;
_p2 = _boundingbox select 1;
_maxWidth = abs ((_p2 select 0) - (_p1 select 0));
_maxLength = abs ((_p2 select 1) - (_p1 select 1));
private _midpos = _p1 vectorAdd [_maxWidth/2,_maxLength/2,0];

//Ici on genere tous les feux
for "_i" from 1 to ([2, 6] call BIS_fnc_randomInt) do {
	_pos = [(_vehicle modelToWorld _midpos), [_maxWidth/2, _maxLength/2, getDir _vehicle, true]] call BIS_fnc_randomPosTrigger;
	_pos set [2,(getPosATL _vehicle select 2)];
	_fire = "test_EmptyObjectForFireBig" createVehicle [0,0,0];
	_fire setPosATL _pos;
	_fire setVariable ["firealf",150,true];
	_allFires pushBack _fire;
};
private _time = time;

_sound = createSoundSource ["ALFfeuForet", position _fire, [], 0];
_sound attachTo [_fire];

waitUntil {uiSleep 0.5; (({isNull _x} count _allFires) isEqualTo (count _allFires)) || ((time - _time) > 2600)};

_vehicle setVariable ["ALF_InFire",false];
if !(isNull _sound) then {
	deleteVehicle _sound;
};

if (({isNull _x} count _allFires) isEqualTo (count _allFires)) then {
	[7500] remoteExecCall ["HC_fnc_updateCNP",HC_life];
	["BRAVO","VOUS AVEZ ETEINT L'INCENDIE DE VOITURE, FELICITATION !!"] remoteExecCall ["HC_fnc_doMedCall",HC_Life];
} else {
	{
		if !(isNull _x) then {
			deleteVehicle _x;
		};
	} forEach _allFires;
};