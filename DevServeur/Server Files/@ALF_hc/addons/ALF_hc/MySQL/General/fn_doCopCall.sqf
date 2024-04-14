/*
	File: fn_doCopCall.sqf
*/
params[
	["_texte1","",[""]],
	["_texte2","",[""]]
];
if(_texte1 isEqualTo "" OR {_texte2 isEqualTo ""}) exitWith {};

[_texte1,_texte2] remoteExec ["ALF_fnc_doCopCall",(playableUnits select {_x getVariable ["CopService",false]})];
