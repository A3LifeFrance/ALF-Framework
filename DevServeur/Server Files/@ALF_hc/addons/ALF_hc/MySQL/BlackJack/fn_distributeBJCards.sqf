/*
	File: fn_distributeBJCards.sqf
	Author: ALF Team
*/
params [
	["_player",objNull,[objNull]],
	["_cards",[],[[]]]
];

if (isNull _player) exitWith {_cards};
private _hand = _player getVariable ["ALF_BJ_Hand",[]];

private _card = _cards deleteAt floor(random (((count _cards) - 1)));
_hand pushBack _card;

_player setVariable ["ALF_BJ_Hand",_hand];
[3,_hand] remoteExecCall ["ALF_fnc_playBJ",_player];

_cards