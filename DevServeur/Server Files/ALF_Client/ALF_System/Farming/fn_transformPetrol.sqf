/*
	Author: ALF NiiRoZz
*/
params [
	["_ct", objNull, [objNull]]
];
if(isNull _ct) exitWith {};

if (alf_niv_minage < 7) exitWith {["ERREUR","Vous n'avez pas l'expérience requise pour cela.","danger"] spawn ALF_fnc_doMsg;};

[_ct,player] remoteExec ["HC_fnc_transformPetrol",HC3_Life];
