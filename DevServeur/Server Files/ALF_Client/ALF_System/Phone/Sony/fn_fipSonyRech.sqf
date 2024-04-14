#include "\ALF_Client\script_macros.hpp"
/*
File: fn_fipSonyRech.sqf
Author: ALF Team
*/
private["_display","_fipName","_length","_chrByte","_allowed","_badChar"];
disableSerialization;
_fipName = ctrlText 33167;
if(_fipName isEqualTo "") exitWith {hint "Le nom est vide.";};
_length = count (toArray(_fipName));
_chrByte = toArray (_fipName);
_allowed = toArray("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz ");
if(_length > 30) exitWith {hint "Tu ne peux écrire que 30 caractères max."};
_badChar = false;
{if(!(_x in _allowed)) exitWith {_badChar = true;};} forEach _chrByte;
if(_badChar) exitWith {hint "Nom incorrect.";};

[_fipName,player] remoteExec ["HC_fnc_selectFipSony",HC3_Life];
