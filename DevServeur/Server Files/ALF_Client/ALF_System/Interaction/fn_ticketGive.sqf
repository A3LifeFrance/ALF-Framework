#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_ticketGive.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Gives a ticket to the targeted player.
*/
private["_val"];
if(isNil {life_ticket_unit}) exitWith {};
if(isNull life_ticket_unit) exitWith {};

_val = ctrlText 2652;

if(!([_val] call TON_fnc_isnumber)) exitWith {};
if((parseNumber _val) > 50000) exitWith {};

[player,(parseNumber _val)] remoteExec ["ALF_fnc_ticketPrompt",life_ticket_unit];
closeDialog 0;