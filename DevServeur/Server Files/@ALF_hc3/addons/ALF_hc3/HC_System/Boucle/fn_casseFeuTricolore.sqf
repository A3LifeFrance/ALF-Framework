/*
	File: fn_casseFeuTricolore.sqf
	Author: ALF NiiRoZz
*/
private _terrainobj = nearestTerrainObjects [[6434.03,7579.4,0], [], 10000, false];
private _feux = _terrainobj select {typeOf _x in ["Land_ALF_trico_1","Land_ALF_trico_2"]};

private ["_rand","_objet","_objects"];
for "_i" from 0 to 1 step 0 do {
	_rand = 100;
	
	if (_rand <= 70) then {
		_objet = selectRandom _feux;
		_objects = nearestObjects [_objet, ["Land_ALF_trico_1","Land_ALF_trico_2"], 55, true];

		{
			_x setVariable ["ALF_FeuCasse",true];
		} forEach _objects;
	};

	uiSleep 1800;
};