/*
	File: fn_verifParmes.sqf
	Author: ALF Team
*/
private _u = _this select 0;
if(isNull _u) exitWith {};

if(license_gun) then {
	["INFO","Cette personne est titulaire du permis de port d'armes.","success"] remoteExec ["ALF_fnc_doMsg",_u];
} else {
	["INFO","Cette personne n'a pas le permis de port d'armes.","warning"] remoteExec ["ALF_fnc_doMsg",_u];
};
