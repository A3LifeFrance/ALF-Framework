#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_ticketPrompt
	Author: Bryan "Tonic" Boardwine

	Description:
	Prompts the player that he is being ticketed.
*/
private["_cop","_val"];
if(!isNull (findDisplay 2600)) exitWith {}; //Already at the ticket menu, block for abuse?
_cop = _this select 0;
if(isNull _cop) exitWith {};
_val = _this select 1;

createDialog "life_ticket_pay";
disableSerialization;
waitUntil {sleep 0.3; !isNull (findDisplay 2600)};

life_ticket_paid = false;
life_ticket_val = _val;
life_ticket_cop = _cop;
CONTROL(2600,2601) ctrlSetStructuredText parseText format["<t align='center'><t size='.8px'>Amende de %1€.",_val];

[] spawn {
	disableSerialization;
	waitUntil {sleep 0.3; life_ticket_paid OR {isNull (findDisplay 2600)}};
	if(isNull (findDisplay 2600) && {!life_ticket_paid}) then {
		["INFO","Cette personne a refuse l'amende.","warning"] remoteExec ["ALF_fnc_doMsg",life_ticket_cop];
	} else {
		["INFO","Cette personne a paye l'amende.","success"] remoteExec ["ALF_fnc_doMsg",life_ticket_cop];
	};
};