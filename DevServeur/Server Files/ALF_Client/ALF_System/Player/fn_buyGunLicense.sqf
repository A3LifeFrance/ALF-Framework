#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_buyHomeLicense.sqf
	ALF Nanou
*/
if(license_gun) exitWith {["INFO","Tu as deja le permis de port d'armes.","warning"] spawn ALF_fnc_doMsg;};

private _action = ["Veux-tu acheter un permis de port d'armes pour 125000€.","Port d'armes","OUI","NON"] call BIS_fnc_guiMessage;
if(_action) then {

	if(life_cash < 125000) exitWith {["INFO","Tu n'as  pas 125000€ sur toi.","warning"] spawn ALF_fnc_doMsg;};

	life_cash = life_cash - 125000;
	[0] call SOCK_fnc_updatePartial;

	license_gun = true;
	[1] call SOCK_fnc_updatePartial;

	["INFO","Tu as achete le permis de port d'armes d'une valeur de 125000€.","success"] spawn ALF_fnc_doMsg;
};