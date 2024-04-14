#include "\ALF_Client\script_macros.hpp"
/*
File: fn_SonyDeleteContact.sqf
Author: ALF Team
*/
disableSerialization;
private _contact = lbValue[33113,lbCurSel (33113)];
life_contacts deleteAt _contact;

if !(isNull (findDisplay 32999)) then {
	uiNamespace setVariable ['sony',3];
	[] call ALF_fnc_menuSony;
};

[life_contacts, getPlayerUID player] remoteExecCall ["HC_fnc_updateContactsPhone", HC3_Life];
