/*
	File: updateForfait
	Author: ALF Team
*/
params[
	["_time",-1,[0]]
];
if(_time isEqualTo -1) exitWith {};

ALF_Forfait = _time;

if !(isNull (findDisplay 15000)) then {
	[] call ALF_fnc_menuForfait;
};
