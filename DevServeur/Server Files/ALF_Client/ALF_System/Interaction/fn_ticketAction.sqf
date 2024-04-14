/*
	File: fn_ticketAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the ticketing process.
*/
params [
	["_unit",objNull,[objNull]]
];
disableSerialization;
if(!(createDialog "life_ticket_give")) exitWith {};
if(isNull _unit OR {!isPlayer _unit}) exitWith {};
ctrlSetText[2651,"Amende"];
life_ticket_unit = _unit;
