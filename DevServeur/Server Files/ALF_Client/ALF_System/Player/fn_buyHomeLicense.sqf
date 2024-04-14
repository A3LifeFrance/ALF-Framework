#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_buyHomeLicense.sqf
	ALF Nanou
*/
if(license_home) exitWith {["INFO","Tu as deja le droit de propriete.","warning"] spawn ALF_fnc_doMsg;};

private _action = ["Veux-tu acheter un droit de propriete pour 2500€.","Droit de propriete","OUI","NON"] call BIS_fnc_guiMessage;
if(_action) then {

	if(life_cash < 2500) exitWith {["INFO","Tu n'as  pas 2500€ sur toi.","warning"] spawn ALF_fnc_doMsg;};

	life_cash = life_cash - 2500;
	[0] call SOCK_fnc_updatePartial;

	license_home = true;
	[1] call SOCK_fnc_updatePartial;

	["INFO","Tu as achete le droit de propriete d'une valeur de 2500€.","success"] spawn ALF_fnc_doMsg;
};