#include "\ALF_Client\script_macros.hpp"
/*
File: fn_iPhonedeleteContact.sqf
Author: ALF Team
Description:
Supprime un contact au joueur depuis l'iPhone.
*/
private["_contact"];
disableSerialization;
_contact = _this select 0;
life_contacts deleteAt _contact;

if !(isNull (findDisplay 56400)) then {
	uiNamespace setVariable ['iphonemenu',2];
	[] call ALF_fnc_menuiPhone;
};

[life_contacts, getPlayerUID player] remoteExecCall ["HC_fnc_updateContactsPhone", HC3_Life];
