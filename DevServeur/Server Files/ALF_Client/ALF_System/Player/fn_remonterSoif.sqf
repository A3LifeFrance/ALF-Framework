#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_remonterSoif.sqf
	Author: ALF NiiRoZz
*/
params [
	["_value",-1,[0]],
	["_seconde",-1,[0]]
];

if (_value isEqualTo -1 || {_seconde isEqualTo -1}) exitWith {};

for "_i" from 1 to _seconde step 1 do {
	if ((life_thirst + (_value / _seconde)) >= 100) exitWith {
		life_thirst = 100;
	};
	life_thirst = life_thirst + (_value / _seconde);
	uiSleep 1;
};
life_thirst = floor life_thirst;
