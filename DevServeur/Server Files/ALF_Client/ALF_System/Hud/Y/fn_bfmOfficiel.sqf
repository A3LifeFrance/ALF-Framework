#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_bfmofficiel.sqf
	Author: ALF Team

*/
disableSerialization;
private _title = ctrlText 123487;
private _msg = ctrlText 123488;
if(_title isEqualTo "" OR {_msg isEqualTo ""}) exitWith {hint "Ton message est vide.";};

private _l1 = count (toArray(_title));
private _c1 = toArray (_title);

private _l2 = count (toArray(_msg));
private _c2 = toArray (_msg);

private _allowed = toArray("0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ.,'-\/[]€!?;:)(=+&<>*$éàùè|çêîïâä ");

if(_l1 > 30) exitWith {hint "Tu ne peux écrire que 30 caractères dans le titre."};
if(_l2 > 200) exitWith {hint "Tu ne peux écrire que 200 caractères dans l'annonce."};

private _badChar = false;
{if(!(_x in _allowed)) exitWith {_badChar = true;};} forEach _c1;
{if(!(_x in _allowed)) exitWith {_badChar = true;};} forEach _c2;

if(_badChar) exitWith {hint localize "STR_GNOTF_IncorrectChar";};

closeDialog 0;

[_title,_msg] remoteExec ["ALF_fnc_doBfmO",(playableUnits select {alive _x})];
