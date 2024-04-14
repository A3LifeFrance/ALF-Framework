/*
	File: fn_addFipSony.sqf
	Author: ALF Team
*/
private["_unit","_name","_motif","_check","_result","_query"];
_name = _this select 0;
_motif = _this select 1;
_unit = _this select 2;

_name = toArray _name;
_motif = toArray _motif;

_check = format["SELECT name FROM fpr WHERE active='1' AND name='%1'",_name];
_result = [_check,2] call HC_fnc_asyncCall;
if(count _result > 0) then {
	["FPR","Cette personne existe déjà dans la database.","warning",false] remoteExec ["ALF_fnc_doMsg",_unit];
} else {
	_query = format["INSERT INTO fpr (name, motif) VALUES ('%1','%2')",_name,_motif];
	[_query,1] call HC_fnc_asyncCall;
	["FPR","Cette personne a bien été ajouté dans la database.","success",false] remoteExec ["ALF_fnc_doMsg",_unit];
};
