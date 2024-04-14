/*
	File: fn_doPenitCall.sqf
*/
params[
	["_texte1","",[""]],
	["_texte2","",[""]],
	["_effect","",[""]]
];
if(_texte1 isEqualTo "" OR {_texte2 isEqualTo ""} OR {_effect isEqualTo ""}) exitWith {};

[_texte1,_texte2,_effect] remoteExec ["ALF_fnc_doMsg",(playableUnits select {_x getVariable ["PenitService",false]})];
