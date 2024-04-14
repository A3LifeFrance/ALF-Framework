/*
	File: fn_mettreCellule.sqf
	Author : NiiRoZz
*/
params [
	["_cellule",-1,[0]],
	["_unit",objNull,[objNull]]
];

if (isNull _unit || {_cellule isEqualTo -1}) exitWith {};

if(_unit getVariable ["ALF_EnPrison",false]) then {
	//IL EST DEJA EN PRISON
	[format["UPDATE players SET jailcoffre='%2' WHERE playerid='%1'",(getPlayerUID _unit),_cellule],1] call HC_fnc_asyncCall;
	[6,[_cellule]] remoteExecCall ["ALF_fnc_menuMettrePrison",_unit];
};
