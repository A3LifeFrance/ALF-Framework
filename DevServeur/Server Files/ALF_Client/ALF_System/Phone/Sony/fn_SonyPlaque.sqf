#include "\ALF_Client\script_macros.hpp"
/*
File: fn_recherchePlaque.sqf
Author: ALF Team
Description:

*/

private["_display"];
disableSerialization;
private _display = findDisplay 32999;
private _PEdit1 = ctrlText 33156;
private _PEdit2 = ctrlText 33157;
private _PEdit3 = ctrlText 33158;
private _PEdit4 = ctrlText 33159;
private _PEdit5 = ctrlText 33160;
private _PEdit6 = ctrlText 33161;
private _PEdit7 = ctrlText 33162;

if(_PEdit1 isEqualTo "") exitWith {hint "Le champ est vide.";};
if(_PEdit2 isEqualTo "") exitWith {hint "Le champ est vide.";};
if(_PEdit3 isEqualTo "") exitWith {hint "Le champ est vide.";};
if(_PEdit4 isEqualTo "") exitWith {hint "Le champ est vide.";};
if(_PEdit5 isEqualTo "") exitWith {hint "Le champ est vide.";};
if(_PEdit6 isEqualTo "") exitWith {hint "Le champ est vide.";};
if(_PEdit7 isEqualTo "") exitWith {hint "Le champ est vide.";};

private _length1 = count (toArray(_PEdit1));
private _length2 = count (toArray(_PEdit2));
private _length3 = count (toArray(_PEdit3));
private _length4 = count (toArray(_PEdit4));
private _length5 = count (toArray(_PEdit5));
private _length6 = count (toArray(_PEdit6));
private _length7 = count (toArray(_PEdit7));

private _chrByte1 = toArray (_PEdit1);
private _chrByte2 = toArray (_PEdit2);
private _chrByte3 = toArray (_PEdit3);
private _chrByte4 = toArray (_PEdit4);
private _chrByte5 = toArray (_PEdit5);
private _chrByte6 = toArray (_PEdit6);
private _chrByte7 = toArray (_PEdit7);

private _allowed1 = toArray("ABCDEFGHIJKLMNOPQRSTUVWXYZ");
private _allowed2 = toArray("0123456789");

if(_length1 > 1) exitWith {hint "Tu ne peux ecrire que 1 caractère."};
if(_length2 > 1) exitWith {hint "Tu ne peux ecrire que 1 caractère."};
if(_length3 > 1) exitWith {hint "Tu ne peux ecrire que 1 caractère."};
if(_length4 > 1) exitWith {hint "Tu ne peux ecrire que 1 caractère."};
if(_length5 > 1) exitWith {hint "Tu ne peux ecrire que 1 caractère."};
if(_length6 > 1) exitWith {hint "Tu ne peux ecrire que 1 caractère."};
if(_length7 > 1) exitWith {hint "Tu ne peux ecrire que 1 caractère."};

private _badChar = false;
{if(!(_x in _allowed1)) exitWith {_badChar = true;};} forEach _chrByte1;
{if(!(_x in _allowed1)) exitWith {_badChar = true;};} forEach _chrByte2;
{if(!(_x in _allowed2)) exitWith {_badChar = true;};} forEach _chrByte3;
{if(!(_x in _allowed2)) exitWith {_badChar = true;};} forEach _chrByte4;
{if(!(_x in _allowed2)) exitWith {_badChar = true;};} forEach _chrByte5;
{if(!(_x in _allowed1)) exitWith {_badChar = true;};} forEach _chrByte6;
{if(!(_x in _allowed1)) exitWith {_badChar = true;};} forEach _chrByte7;
if(_badChar) exitWith {hint "La plaque est incorrect.";};

private _plaque = [_PEdit1,_PEdit2,_PEdit3,_PEdit4,_PEdit5,_PEdit6,_PEdit7];

[_plaque,player] remoteExec ["HC_fnc_SonyRecherchePlaque",HC3_Life];
