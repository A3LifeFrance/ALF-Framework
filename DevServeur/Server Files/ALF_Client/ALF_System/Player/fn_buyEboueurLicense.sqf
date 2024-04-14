/*
	File: fn_buyEboueurLicense.sqf
	ALF Adam
*/
if(license_eboueur) exitWith {["INFO","Tu as deja la licence Eboueur.","warning"] spawn ALF_fnc_doMsg;};

private _action = ["Veux-tu acheter la licence Eboueur pour 7500€.","PREFECTURE","OUI","NON"] call BIS_fnc_guiMessage;
if(_action) then {

	if(life_cash < 7500) exitWith {["INFO","Tu n'as pas 7500€ sur toi.","warning"] spawn ALF_fnc_doMsg;};

	life_cash = life_cash - 7500;
	[0] call SOCK_fnc_updatePartial;

	license_eboueur = true;
	[1] call SOCK_fnc_updatePartial;
	
	[getPlayerUID player] remoteExec ["HC_fnc_jobTime",HC_Life];

	["INFO","Tu as achete la licence eboueur d'une valeur de 7500€ pour une durée d'une semaine.","success"] spawn ALF_fnc_doMsg;
};