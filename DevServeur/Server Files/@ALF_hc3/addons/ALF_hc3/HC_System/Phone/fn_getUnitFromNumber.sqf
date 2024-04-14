/*
	File: fn_getUnitFromNumber.sqf
	Author: ALF Team
	Description:

*/
params [
	["_texte","",[""]]
];
if (_texte isEqualTo "") exitWith {};

ALF_InspectTelTarget = playableUnits param [playableUnits findIf {(_x getVariable ["phoneNumber",""]) isEqualTo _texte}, objNull];
(remoteExecutedOwner) publicVariableClient "ALF_InspectTelTarget";
ALF_InspectTelTarget = "";