/*
	File: fn_deleteDog.sqf
	Author: ALF TEAM
*/
private _dog = player getVariable ["ALF_Dog", objNull];

if (isNull _dog) exitWith {
	["INFO", "Vous n'avez pas de chien.", "danger"] spawn ALF_fnc_doMsg;
};

deleteVehicle _dog;
removeAllActions player;

["INFO", "Votre chien est retourné au chenil.", "succes"] spawn ALF_fnc_doMsg;