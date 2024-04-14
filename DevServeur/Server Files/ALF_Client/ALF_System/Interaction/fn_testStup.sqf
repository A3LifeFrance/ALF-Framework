/*
	File: fn_testStup.sqf
	Author: ALF Adam
*/
private _u = _this select 0;
if(isNull _u) exitWith {};
private _a = ["Quelqu'un te présente un dépistage salivaire. Veux-tu t'y soumettre ?","Question","OUI","NON"] call BIS_fnc_guiMessage;
if(isNull _u) exitWith {};
if (!_a) exitWith {
	["INFO","Cette personne refuse de se soumettre au dépistage.","warning"] remoteExec ["ALF_fnc_doMsg",_u];
};

if(!('ALF_TestStup' in (magazines _u))) exitWith {
	["INFO","Il vous faut un kit salivaire pour effectuer un dépistage.","warning"] remoteExec ["ALF_fnc_doMsg",_u];
};
["ALF_TestStup",false] remoteExec ["life_fnc_handleItem",_u];

["INFO","La personne a accepté le dépistage salivaire. Patientez 20 secondes environ pour obtenir le résultat.","warning"] remoteExec ["ALF_fnc_doMsg",_u];
if(alf_drug <= 0) then {
	uiSleep 20;
	["INFO","Le dépistage salivaire est négatif.","warning"] remoteExec ["ALF_fnc_doMsg",_u];
} else {
	uiSleep 20;
	["INFO","Le dépistage salivaire est positif.","warning"] remoteExec ["ALF_fnc_doMsg",_u];
};