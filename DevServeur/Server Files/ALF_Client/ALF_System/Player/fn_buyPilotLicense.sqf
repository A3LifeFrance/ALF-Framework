#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_buypilotLicense.sqf
	ALF Nanou
*/
if(license_pilot) exitWith {["INFO","Tu as deja le permis de pilotage.","warning"] spawn ALF_fnc_doMsg;};

private _action = ["Veux-tu acheter un permis de pilotage pour 85000€.","Port d'armes","OUI","NON"] call BIS_fnc_guiMessage;
if(_action) then {

	if(life_cash < 85000) exitWith {["INFO","Tu n'as  pas 85000€ sur toi.","warning"] spawn ALF_fnc_doMsg;};

	life_cash = life_cash - 85000;
	[0] call SOCK_fnc_updatePartial;

	license_pilot = true;
	[1] call SOCK_fnc_updatePartial;

	["INFO","Tu as achete le permis de pilotage d'une valeur de 85000€.","success"] spawn ALF_fnc_doMsg;
};