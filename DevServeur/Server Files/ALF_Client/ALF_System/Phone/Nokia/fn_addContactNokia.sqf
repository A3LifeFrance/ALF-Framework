#include "\ALF_Client\script_macros.hpp"
/*
File: fn_addcontactNokia.sqf
Author: ALF Team
Description:
Ajoute un contact au joueur depuis le Nokia.
*/
private["_display","_contactName","_contactNumber","_contact","_name","_number","_contactsList"];
disableSerialization;
_display = findDisplay 20000;
_contactsList = _display displayCtrl 20011;
_contactName = ctrlText 20015;
_contactNumber = ctrlText 20016;

if(_contactNumber isEqualTo "") exitWith {hint "Le numéro est vide.";};
if(_contactName isEqualTo "") exitWith {hint "Le nom est vide.";};
_length = count (toArray(_contactName));
_length2 = count (toArray(_contactNumber));
_chrByte = toArray (_contactName);
_chrByte2 = toArray (_contactNumber);
_allowed = toArray("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789é_ ");
_allowed2 = toArray("0123456789");
if(_length > 20) exitWith {hint "Tu ne peux écrire que 20 caractères max."};
if(_length2 != 10) exitWith {hint "Le numéro doit etre de 10 chiffres."};
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

lbClear _contactsList;
{
	_name = _x select 0;
	_number = _x select 1;
	_contactsList lbAdd format["%1 - %2",_name,_number];
	_contactsList lbSetData [(lbSize _contactsList)-1,str(_x)];
} forEach life_contacts;

[life_contacts, getPlayerUID player] remoteExecCall ["HC_fnc_updateContactsPhone", HC3_Life];
