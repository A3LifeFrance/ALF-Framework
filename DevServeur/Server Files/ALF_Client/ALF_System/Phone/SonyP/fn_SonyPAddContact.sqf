#include "\ALF_Client\script_macros.hpp"
/*
File: fn_SonyddContact.sqf
Author: ALF Team
*/
private["_display","_contactName","_contactNumber","_contact"];
disableSerialization;
_display = findDisplay 38999;
_contactName = ctrlText 39128;
_contactNumber = ctrlText 39129;

if(_contactName isEqualTo "") exitWith {hint "Le nom est vide.";};
if(_contactNumber isEqualTo "") exitWith {hint "Le numéro est vide.";};
_length = count (toArray(_contactName));
_length2 = count (toArray(_contactNumber));
_chrByte = toArray (_contactName);
_chrByte2 = toArray (_contactNumber);
_allowed = toArray("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789é_ ");
_allowed2 = toArray("0123456789");
if(_length > 20) exitWith {hint "Tu ne peux écrire que 20 caractères max."};
if(_length2 != 10) exitWith {hint "Tu ne peux écrire que 10 chiffres max."};
_badChar = false;
{if(!(_x in _allowed)) exitWith {_badChar = true;};} forEach _chrByte;
{if(!(_x in _allowed2)) exitWith {_badChar = true;};} forEach _chrByte2;
if(_badChar) exitWith {hint localize "STR_GNOTF_IncorrectChar";};

if(_contactNumber isEqualTo ALF_Phone_Number) exitWith {hint "Tu ne peux pas t'ajouter.";};
_exit = false;

if(count life_contacts > 0) then {
	{
		if ((_x select 1) isEqualTo _contactNumber) exitWith {_exit = true;};
	} forEach life_contacts;
};
if(_exit) exitWith {hint "Tu as déjà un contact pour ce numéro.";};

_contact = [_contactName,_contactNumber];
life_contacts pushBack _contact;

if !(isNull (findDisplay 38999)) then {
	uiNamespace setVariable ['sonyp',3];
	[] call ALF_fnc_menuSonyP;
};

[life_contacts, getPlayerUID player] remoteExecCall ["HC_fnc_updateContactsPhone", HC3_Life];
