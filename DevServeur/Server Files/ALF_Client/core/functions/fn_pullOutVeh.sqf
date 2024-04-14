/*
	File: fn_pullOutVeh.sqf
	Author: Bryan "Tonic" Boardwine

	Description:

*/
if(isNull objectParent player) exitWith {};

if([player] call ALF_fnc_checkMenotter) then {
	detach player;
	life_disable_getOut = false;
	player action ["Eject", vehicle player];
	["INFO", "Tu viens d'être éjecté du véhicule.", "warning"] spawn ALF_fnc_doMsg;
	life_disable_getIn = true;
} else {
	moveOut player;
	["INFO", "Tu viens d'être éjecté du véhicule.", "warning"] spawn ALF_fnc_doMsg;
};
