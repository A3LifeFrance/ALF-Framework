/*
	File: fn_distributeCards.sqf
	Author: ALF Team
*/
params [
	["_player",objNull,[objNull]],
	["_cards",[],[[]]]
];

if (isNull _player) exitWith {_cards};
private _hand = _player getVariable ["ALF_Poker_Hand",[]];

private _card = _cards deleteAt floor(random (((count _cards) - 1)));
_hand pushBack _card;

_player setVariable ["ALF_Poker_Hand",_hand];
[1,_hand] remoteExecCall ["ALF_fnc_playPoker",_player];

_cards