#include "\ALF_Client\script_macros.hpp"
/*
File: fn_rechercheTajSony.sqf
Author: ALF Team
*/
private["_name","_length","_chrByte","_allowed","_badChar"];
disableSerialization;
_name = ctrlText 33187;
if(_name isEqualTo "") exitWith {hint "Le nom est vide.";};
_length = count (toArray(_fipName));
_chrByte = toArray (_fipName);
_allowed = toArray("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz ");
if(_length > 30) exitWith {hint "Tu ne peux écrire que 30 caractères max."};
_badChar = false;
{if(!(_x in _allowed)) exitWith {_badChar = true;};} forEach _chrByte;
if(_badChar) exitWith {hint "Nom incorrect.";};

[_name,player] remoteExec ["HC_fnc_selectTajSony",HC3_Life];
