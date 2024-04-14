#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_buyHomeLicense.sqf
	ALF Nanou
*/
if(license_boat) exitWith {["INFO","Tu as deja le permis bateau.","warning"] spawn ALF_fnc_doMsg;};

private _action = ["Veux-tu acheter un permis de bateau pour 25000€.","Permis Bateau","OUI","NON"] call BIS_fnc_guiMessage;
if(_action) then {

	if(life_cash < 25000) exitWith {["INFO","Tu n'as  pas 25000€ sur toi.","warning"] spawn ALF_fnc_doMsg;};

	life_cash = life_cash - 25000;
	[0] call SOCK_fnc_updatePartial;

	license_boat = true;
	[1] call SOCK_fnc_updatePartial;

	["INFO","Tu as achete le permis bateau d'une valeur de 25000€.","success"] spawn ALF_fnc_doMsg;
};