#include "\ALF_Client\script_macros.hpp"
/*
File: fn_SonyDeleteContact.sqf
Author: ALF Team
*/
disableSerialization;
private _contact = lbValue[39113,lbCurSel (39113)];
life_contacts deleteAt _contact;

if !(isNull (findDisplay 38999)) then {
	uiNamespace setVariable ['sonyp',3];
	[] call ALF_fnc_menuSonyP;
};

[life_contacts, getPlayerUID player] remoteExecCall ["HC_fnc_updateContactsPhone", HC3_Life];
