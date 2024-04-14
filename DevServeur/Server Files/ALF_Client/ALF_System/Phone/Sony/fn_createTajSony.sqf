#include "\ALF_Client\script_macros.hpp"
/*
File: fn_fipSonyAdd.sqf
Author: ALF Team
*/
private["_fipName","_delit","_crime","_fipMotif","_lieu","_date","_infraction","_mode","_cbdelit","_cbcrime"];
disableSerialization;

_fipName = ctrlText 33179;
_cbdelit = (findDisplay 32999) displayCtrl 33180;
_cbcrime = (findDisplay 32999) displayCtrl 33181;
_delit = cbChecked _cbdelit;
_crime = cbChecked _cbcrime;
_lieu = ctrlText 33182;
_date = ctrlText 33183;
_infraction = ctrlText 33184;
if(_fipName isEqualTo "" OR _lieu isEqualTo "" OR _date isEqualTo "" OR _infraction isEqualTo "") exitWith {hint "Il y a un champ vide.";};

private _length = count (toArray(_fipName));
private _length2 = count (toArray(_lieu));
private _length3 = count (toArray(_date));
private _length4 = count (toArray(_infraction));

private _chrByte = toArray (_fipName);
private _chrByte2 = toArray (_lieu);
private _chrByte3 = toArray (_date);
private _chrByte4 = toArray (_infraction);

private _allowed = toArray("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz ");
private _allowed2 = toArray("0123456789/H ");
private _allowed3 = toArray("0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ.,'-/[]éà€!?;:êè)(=+&<>*$ ");
if(_length > 30) exitWith {hint "Tu ne peux écrire que 30 caractères max."};
if(_length2 > 40) exitWith {hint "Tu ne peux écrire que 40 caractères max."};
if(_length3 > 20) exitWith {hint "Tu ne peux écrire que 20 caractères max."};
if(_length5 > 300) exitWith {hint "Tu ne peux écrire que 300 caractères max."};

private _badChar = false;
{if(!(_x in _allowed)) exitWith {_badChar = true;};} forEach _chrByte;
{if(!(_x in _allowed)) exitWith {_badChar = true;};} forEach _chrByte2;
{if(!(_x in _allowed2)) exitWith {_badChar = true;};} forEach _chrByte3;
{if(!(_x in _allowed3)) exitWith {_badChar = true;};} forEach _chrByte4;
if(_badChar) exitWith {hint "Incorrect.";};

if(_delit AND _crime) exitWith {hint "Il faut cocher une des deux cases.";};
if(!_delit AND !_crime) exitWith {hint "Il faut cocher une des deux cases.";};

_mode = 0;
if(_crime) then {_mode = 1;};

[_fipName,_mode,_lieu,_date,_infraction,player] remoteExecCall ["HC_fnc_createTajSony",HC3_Life];

closeDialog 0;
