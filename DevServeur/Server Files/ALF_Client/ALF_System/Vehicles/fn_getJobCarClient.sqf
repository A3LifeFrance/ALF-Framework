/*
	File: fn_getJobCarClient.sqf
	Author: ALF Adam
*/
params [
	["_class","",[""]],
	["_pos",[],[[]]]
];

if (_class isEqualTo "" || {_pos isEqualTo []}) exitWith {};

if (_class isEqualTo "V_ALF_Camion_Poubelle" && !(missionNamespace getVariable ["license_trucking",false])) exitWith {["PERMIS C","Il vous faut le permis C pour récuper un camion.","danger"] spawn ALF_fnc_doMsg;};

[_class,_pos,player] remoteExecCall ["HC_fnc_getJobCar",HC2_Life];