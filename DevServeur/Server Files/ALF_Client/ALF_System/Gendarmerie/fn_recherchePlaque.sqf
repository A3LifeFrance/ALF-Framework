#include "\ALF_Client\script_macros.hpp"
/*
File: fn_recherchePlaque.sqf
Author: ALF Team
Description:

*/

private["_display"];
disableSerialization;
_display = findDisplay 30560;
_PEdit1 = ctrlText 30590;
_PEdit2 = ctrlText 30591;
_PEdit3 = ctrlText 30592;
_PEdit4 = ctrlText 30593;
_PEdit5 = ctrlText 30594;
_PEdit6 = ctrlText 30595;
_PEdit7 = ctrlText 30596;

if(_PEdit1 isEqualTo "") exitWith {hint "Le champ est vide.";};
if(_PEdit2 isEqualTo "") exitWith {hint "Le champ est vide.";};
if(_PEdit3 isEqualTo "") exitWith {hint "Le champ est vide.";};
if(_PEdit4 isEqualTo "") exitWith {hint "Le champ est vide.";};
if(_PEdit5 isEqualTo "") exitWith {hint "Le champ est vide.";};
if(_PEdit6 isEqualTo "") exitWith {hint "Le champ est vide.";};
if(_PEdit7 isEqualTo "") exitWith {hint "Le champ est vide.";};

_length1 = count (toArray(_PEdit1));
_length2 = count (toArray(_PEdit2));
_length3 = count (toArray(_PEdit3));
_length4 = count (toArray(_PEdit4));
_length5 = count (toArray(_PEdit5));
_length6 = count (toArray(_PEdit6));
_length7 = count (toArray(_PEdit7));

_chrByte1 = toArray (_PEdit1);
_chrByte2 = toArray (_PEdit2);
_chrByte3 = toArray (_PEdit3);
_chrByte4 = toArray (_PEdit4);
_chrByte5 = toArray (_PEdit5);
_chrByte6 = toArray (_PEdit6);
_chrByte7 = toArray (_PEdit7);

_allowed1 = toArray("ABCDEFGHIJKLMNOPQRSTUVWXYZ");
_allowed2 = toArray("0123456789");

if(_length1 > 1) exitWith {hint "Tu ne peux ecrire que 1 caractère."};
if(_length2 > 1) exitWith {hint "Tu ne peux ecrire que 1 caractère."};
if(_length3 > 1) exitWith {hint "Tu ne peux ecrire que 1 caractère."};
if(_length4 > 1) exitWith {hint "Tu ne peux ecrire que 1 caractère."};
if(_length5 > 1) exitWith {hint "Tu ne peux ecrire que 1 caractère."};
if(_length6 > 1) exitWith {hint "Tu ne peux ecrire que 1 caractère."};
if(_length7 > 1) exitWith {hint "Tu ne peux ecrire que 1 caractère."};

_badChar = false;
{if(!(_x in _allowed1)) exitWith {_badChar = true;};} forEach _chrByte1;
{if(!(_x in _allowed1)) exitWith {_badChar = true;};} forEach _chrByte2;
{if(!(_x in _allowed2)) exitWith {_badChar = true;};} forEach _chrByte3;
{if(!(_x in _allowed2)) exitWith {_badChar = true;};} forEach _chrByte4;
{if(!(_x in _allowed2)) exitWith {_badChar = true;};} forEach _chrByte5;
{if(!(_x in _allowed1)) exitWith {_badChar = true;};} forEach _chrByte6;
{if(!(_x in _allowed1)) exitWith {_badChar = true;};} forEach _chrByte7;
if(_badChar) exitWith {hint "La plaque est incorrect.";};

_plaque = [_PEdit1,_PEdit2,_PEdit3,_PEdit4,_PEdit5,_PEdit6,_PEdit7];

[_plaque,player] remoteExec ["HC_fnc_recherchePlaque",HC2_Life];
