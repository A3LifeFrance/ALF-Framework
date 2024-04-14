/*
	File: fn_testAlcoolemie.sqf
	Author: ALF Team
*/
private _u = _this select 0;
if(isNull _u) exitWith {};
private _a = ["Quelqu'un te présente l'éthylotest. Veux-tu souffler ?","Question","OUI","NON"] call BIS_fnc_guiMessage;
if(isNull _u) exitWith {};
if (!_a) exitWith {
	["INFO","Cette personne refuse de souffler.","warning"] remoteExec ["ALF_fnc_doMsg",_u];
};

if(life_drunk isEqualTo 0) then {
	["INFO","Cette personne est sobre.","warning"] remoteExec ["ALF_fnc_doMsg",_u];
} else {
	["INFO",format["Le taux d'alcool de cette personne est de %1 g/L.",life_drunk],"warning"] remoteExec ["ALF_fnc_doMsg",_u];
};