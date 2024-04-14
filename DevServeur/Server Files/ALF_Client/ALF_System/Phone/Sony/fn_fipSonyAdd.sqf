#include "\ALF_Client\script_macros.hpp"
/*
File: fn_fipSonyAdd.sqf
Author: ALF Team
*/
private["_display","_fipName","_fipMotif","_length","_length2","_chrByte","_chrByte2","_allowed","_allowed2","_badChar"];
disableSerialization;
_fipName = ctrlText 33171;
_fipMotif = ctrlText 33172;
if(_fipName isEqualTo "") exitWith {hint "Le nom est vide.";};
if(_fipMotif isEqualTo "") exitWith {hint "Le motif est vide.";};
_length = count (toArray(_fipName));
_length2 = count (toArray(_fipMotif));
_chrByte = toArray (_fipName);
_chrByte2 = toArray (_fipMotif);
_allowed = toArray("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz ");
_allowed2 = toArray("0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ.,'-/[]éà€!?;:êè)(=+&<>*$ ");
if(_length > 30) exitWith {hint "Tu ne peux écrire que 30 caractères max."};
if(_length2 > 300) exitWith {hint "Tu ne peux écrire que 300 caractères max."};
_badChar = false;
{if(!(_x in _allowed)) exitWith {_badChar = true;};} forEach _chrByte;
{if(!(_x in _allowed2)) exitWith {_badChar = true;};} forEach _chrByte2;
if(_badChar) exitWith {hint "Nom incorrect.";};

[_fipName,_fipMotif,player] remoteExecCall ["HC_fnc_addFipSony",HC3_Life];

closeDialog 0;
