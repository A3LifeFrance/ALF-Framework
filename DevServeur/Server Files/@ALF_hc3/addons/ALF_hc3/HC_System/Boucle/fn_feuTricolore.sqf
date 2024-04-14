/*
	File: fn_feuTricolore.sqf
	Author: Nanou
*/
ALF_fnc_FeuA = {
	params [
		["_trafficlight",objNull,[objNull]]
	];

	if (!(typeOf _trafficlight isEqualTo "Land_ALF_trico_1") || {isNull _trafficlight}) exitwith {};

	uiSleep 3;

	for "_i" from 0 to 1 step 0 do {
		if (_trafficlight getVariable ["ALF_FeuCasse",false]) then {
			for "_j" from 1 to 13 step 1 do {
				_trafficlight animateSource ["feu_rouge_source", 0, true];
				_trafficlight animateSource ["feu_orange_source", 1, true];
				_trafficlight animateSource ["feu_vert_source", 0, true];
				uiSleep 2;
				_trafficlight animateSource ["feu_rouge_source", 0, true];
				_trafficlight animateSource ["feu_orange_source", 0, true];
				_trafficlight animateSource ["feu_vert_source", 0, true];
				uiSleep 1;
			};
		} else {
			_trafficlight animateSource ["feu_vert_source", 1, true];
			_trafficlight animateSource ["feu_orange_source", 0, true];
			_trafficlight animateSource ["feu_rouge_source", 0, true];
			uiSleep 15;
			_trafficlight animateSource ["feu_rouge_source", 0, true];
			_trafficlight animateSource ["feu_vert_source", 0, true];
			_trafficlight animateSource ["feu_orange_source", 1, true];
			uiSleep 4;
			_trafficlight animateSource ["feu_rouge_source", 1, true];
			_trafficlight animateSource ["feu_orange_source", 0, true];
			_trafficlight animateSource ["feu_vert_source", 0, true];
			uiSleep 20;
		};
	};
};

ALF_fnc_FeuB = {
	params [
		["_trafficlight",objNull,[objNull]]
	];

	if (!(typeOf _trafficlight isEqualTo "Land_ALF_trico_2") || {isNull _trafficlight}) exitwith {};

	uiSleep 3;

	for "_i" from 0 to 1 step 0 do {
		if (_trafficlight getVariable ["ALF_FeuCasse",false]) then {
			for "_j" from 1 to 13 step 1 do {
				_trafficlight animateSource ["feu_rouge_source", 0, true];
				_trafficlight animateSource ["feu_orange_source", 1, true];
				_trafficlight animateSource ["feu_vert_source", 0, true];
				uiSleep 2;
				_trafficlight animateSource ["feu_rouge_source", 0, true];
				_trafficlight animateSource ["feu_orange_source", 0, true];
				_trafficlight animateSource ["feu_vert_source", 0, true];
				uiSleep 1;
			};
		} else {
			_trafficlight animateSource ["feu_rouge_source", 1, true];
			_trafficlight animateSource ["feu_orange_source", 0, true];
			_trafficlight animateSource ["feu_vert_source", 0, true];
			uiSleep 20;
			_trafficlight animateSource ["feu_vert_source", 1, true];
			_trafficlight animateSource ["feu_rouge_source", 0, true];
			_trafficlight animateSource ["feu_orange_source", 0, true];
			uiSleep 15;
			_trafficlight animateSource ["feu_orange_source", 1, true];
			_trafficlight animateSource ["feu_vert_source", 0, true];
			_trafficlight animateSource ["feu_rouge_source", 0, true];
			uiSleep 4;
		};
	};
};
private _terrainobj = nearestTerrainObjects [[6434.03,7579.4,0], [], 10000, false];
private _objectsA = _terrainobj select {typeOf _x isEqualTo "Land_ALF_trico_1"};
private _objectsB = _terrainobj select {typeOf _x isEqualTo "Land_ALF_trico_2"};

{
	[_x] spawn ALF_fnc_FeuA;
} forEach _objectsA;

{
	[_x] spawn ALF_fnc_FeuB;
} forEach _objectsB;
