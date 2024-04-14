/*
	File: fn_checkScore.sqf
	Author: ALF Team
*/
params [
	["_cards",[],[[]]]
];

//Check Quinte flush royal
private _combinaison = [14,13,12,11,10];
{
	_index = _combinaison find (_x select 0);
	if(_index > -1) then {
		_combinaison deleteAt _index;
	};
} forEach _cards;

if (count _combinaison isEqualTo 0) exitWith {9};

//Check Quinte flush
private _result1 = false;
{
	private _couleur = (_x select 1);
	_count = {(_x select 1) isEqualTo _couleur} count _cards;
	if (_count isEqualTo 5) exitWith {_result1 = true;};
} forEach _cards;

_combinaison = [];
{
	_combinaison pushBack (_x select 0);
} forEach _cards;
_combinaison sort true;

private _element = [];
private _result2 = false;
{
	_count = -1;
	for "_i" from _x to (_x + 4) do {
		_count = {(_x select 0) isEqualTo _i} count _cards;
		if !(_count isEqualTo 1) exitWith {};
		if (_i isEqualTo (_x + 4)) exitWith {_result2 = true;};
	};
	if (_result2) exitWith {};
} forEach _combinaison;

if (_result2 && {_result1}) exitWith {8};

//Check Carre
private ["_card","_count"];
private _found = false;
{
	_card = _x select 0;
	_count = {(_x select 0) isEqualTo _card} count _cards;
	if (_count isEqualTo 4) exitWith {_found = true;};
} forEach _cards;

if (_found) exitWith {7};

//Check Full
private _combinaison = [];
private _index = 0;

for "_i" from 0 to 16 do { _combinaison set [_i, 0]; };
{
	_combinaison set [_x select 0, ((_combinaison select (_x select 0)) + 1)];
} forEach _cards;

{
	if(_x isEqualTo 3) then { _index = _index + 1;};
	if(_x isEqualTo 2) then { _index = _index + 1;};
} forEach _combinaison;

if (_index isEqualTo 2) exitWith {6};

//Check flush
private _result = false;
{
	private _couleur = (_x select 1);
	_count = {(_x select 1) isEqualTo _couleur} count _cards;
	if (_count isEqualTo 5) exitWith {_result = true;};
} forEach _cards;

if (_result) exitWith {5};

//Check quinte
_combinaison = [];
{
	_combinaison pushBack (_x select 0);
} forEach _cards;
_combinaison sort true;

private _element = [];
private _result = false;
{
	_count = -1;
	for "_i" from _x to (_x + 4) do {
		_count = {(_x select 0) isEqualTo _i} count _cards;
		if !(_count isEqualTo 1) exitWith {};
		if (_i isEqualTo (_x + 4)) exitWith {_result = true;};
	};
	if (_result) exitWith {};
} forEach _combinaison;

if (_result) exitWith {4};

//Check Brelan
private _result = false;
for "_i" from 2 to 14 do {
	_count = {(_x select 0) isEqualTo _i} count _cards;
	if (_count isEqualTo 3) exitWith {_result = true;};
};

if (_result) exitWith {3};

//Check Double Paire
private _index = 0;
for "_i" from 2 to 14 do {
	_count = {(_x select 0) isEqualTo _i} count _cards;
	if (_count isEqualTo 2) then {_index = _index + 1;};
};

if (_index isEqualTo 2) exitWith {2};

//Check Paire
if (_index isEqualTo 1) exitWith {1};

//Check Hauteur
if (true) exitWith {0};