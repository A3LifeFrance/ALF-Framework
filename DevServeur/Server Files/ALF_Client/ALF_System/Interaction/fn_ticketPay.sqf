#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_ticketPay.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Pays the ticket.
*/
if(isNil "life_ticket_val" OR {isNil "life_ticket_cop"}) exitWith {};
if(life_cash < life_ticket_val) exitWith {
	if(life_livreta > life_ticket_val) then {
		life_livreta = life_livreta - life_ticket_val;
		[6] call SOCK_fnc_updatePartial;
		life_ticket_paid = true;
		["INFO","Cette personne a payer son amende depuis son livret A.","warning"] remoteExec ["ALF_fnc_doMsg",life_ticket_cop];
	} else {
		if(life_livretb > life_ticket_val) then {
			life_livretb = life_livretb - life_ticket_val;
			[7] call SOCK_fnc_updatePartial;
			life_ticket_paid = true;
			["INFO","Cette personne a payer son amende depuis son livret B.","warning"] remoteExec ["ALF_fnc_doMsg",life_ticket_cop];
		} else {
			if(life_livretc > life_ticket_val) then {
				life_livretc = life_livretc - life_ticket_val;
				[8] call SOCK_fnc_updatePartial;
				life_ticket_paid = true;
				["INFO","Cette personne a payer son amende depuis son livret C.","warning"] remoteExec ["ALF_fnc_doMsg",life_ticket_cop];
			};
		};
	};
	if(life_ticket_paid) then {
		[life_ticket_val,player,life_ticket_cop] remoteExec ["ALF_fnc_ticketPaid",life_ticket_cop];
	} else {
		life_livreta = life_livreta - life_ticket_val;
		[6] call SOCK_fnc_updatePartial;
		life_ticket_paid = true;
		["INFO","Cette personne a payer son amende depuis son livret A.","warning"] remoteExec ["ALF_fnc_doMsg",life_ticket_cop];
		[life_ticket_val,player,life_ticket_cop] remoteExec ["ALF_fnc_ticketPaid",life_ticket_cop];
	};
	closeDialog 0;
};

if(life_cash > life_ticket_val) then {
	life_cash = life_cash - life_ticket_val;
	[0] call SOCK_fnc_updatePartial;
	life_ticket_paid = true;
	["INFO","Cette personne a payer son amende en cash.","warning"] remoteExec ["ALF_fnc_doMsg",life_ticket_cop];
} else {
	["INFO","Cette personne n'a pas pu payer l'amende, elle n'a pas d'argent.","warning"] remoteExec ["ALF_fnc_doMsg",life_ticket_cop];
};

closeDialog 0;
[life_ticket_val,player,life_ticket_cop] remoteExecCall ["ALF_fnc_ticketPaid",life_ticket_cop];
