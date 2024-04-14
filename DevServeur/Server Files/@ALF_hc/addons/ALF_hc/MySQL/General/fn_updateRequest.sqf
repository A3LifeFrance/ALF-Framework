/*
	File: fn_updateRequest.sqf
	Author: ALF TEAM
*/
params [
	["_uid","",[""]],
	["_cash",0,[0]],
	["_licenses",[],[[]]],
	["_gear",[],[[]]],
	["_stats",[100,100,0,0],[[]]],
	["_alive",false,[false]],
	["_position",[],[[]]],
	["_medical",[],[[]]]
];

//Get to those error checks.
if(_uid isEqualTo "") exitWith {};

//Parse and setup some data.
_gear = [_gear] call HC_fnc_mresArray;
_stats = [_stats] call HC_fnc_mresArray;
_cash = [_cash] call HC_fnc_numberSafe;
_position = [_position] call HC_fnc_mresArray;
_medical = [_medical] call HC_fnc_mresArray;

//Does something license related but I can't remember I only know it's important?
for "_i" from 0 to count(_licenses)-1 do {
	_bool = [(_licenses select _i) select 1] call HC_fnc_bool;
	_licenses set[_i,[(_licenses select _i) select 0,_bool]];
};
_licenses = [_licenses] call HC_fnc_mresArray;

private _query = format["UPDATE players SET cash='%1', licenses='%2', gear='%3', stats='%4', alive='%5', position='%6', medical='%7' WHERE playerid='%8'",
_cash,
_licenses,
_gear,
_stats,
[_alive] call HC_fnc_bool,
_position,
_medical,
_uid];

[_query,1] call HC_fnc_asyncCall;
