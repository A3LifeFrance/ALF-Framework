/*
	File: fn_agrandirBusiness.sqf
	Author: Nanou
	This file is for Nanou's HeadlessClient.
*/
params [
  ["_siret","",[""]],
  ["_name","",[""]],
  ["_amount",-1,[0]]
];
if(_siret isEqualTo "" || {_name isEqualTo ""} || {_amount isEqualTo -1}) exitWith {};

[format["INSERT INTO fisc (siret, name, paie, mode, isDeclare) VALUES ('%1','%2','%3','1','1')",_siret,_name,_amount],1] call HC_fnc_asyncCall;
