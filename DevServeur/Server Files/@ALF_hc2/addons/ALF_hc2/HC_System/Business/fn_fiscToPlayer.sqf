/*
	File: fn_fiscToPlayer.sqf
	Author: NiiRoZz
	This file is for Nanou's HeadlessClient.
*/
params [
  ["_siret","",[""]]
];

if (_siret isEqualTo "") exitWith {};

private _query = format["SELECT name, paie, isDeclare, mode, insert_time FROM fisc WHERE siret='%1'",_siret];
private _allFiscs = [_query,2,true] call HC_fnc_asyncCall;

private _allPaiement = _allFiscs select {(_x select 3) isEqualTo 0};
private _allReceive = _allFiscs select {(_x select 3) isEqualTo 1};

[1,_allPaiement,_allReceive] remoteExec ["ALF_fnc_dialogFisc", remoteExecutedOwner];
