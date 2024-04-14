/*
	File: fn_recherchePlaque.sqf
	Author: ALF Team
*/
params [
	["_plaque","",[""]],
	["_unit",objNull,[objNull]]
];
if(_plaque isEqualTo "" OR {isNull _unit}) exitWith {};

private _plaquefinal = format["""[`%1`,`%2`,`-`,`%3`,`%4`,`%5`,`-`,`%6`,`%7`]""",_plaque select 0,_plaque select 1,_plaque select 2,_plaque select 3,_plaque select 4,_plaque select 5,_plaque select 6];

private _queryResult = [format["SELECT classname, pid, insure FROM vehicles WHERE plate='%1'",_plaquefinal],2] call HC_fnc_asyncCall;
if((count _queryresult) isEqualTo 0) exitWith {["Gendarmerie","Aucun véhicule n'est attribué à cette plaque.","warning",false] remoteExec ["ALF_fnc_doMsg",_unit];};

private _classname = _queryResult select 0;
private _pid = _queryResult select 1;
private _insure = _queryResult select 2;

private _nameplayer = "";
if (_pid isEqualTo "Gendarmerie" || {_pid isEqualTo "Pompier"}) then {
	_nameplayer = _pid;
} else {
	private _queryResult2 = [format["SELECT name FROM players WHERE playerid='%1'",_pid],2] call HC_fnc_asyncCall;
	if((count _queryResult2) isEqualTo 0) exitWith {};

	_nameplayer = _queryResult2 select 0;
};
private _plaquetexte = format["%1%2-%3%4%5-%6%7",_plaque select 0,_plaque select 1,_plaque select 2,_plaque select 3,_plaque select 4,_plaque select 5,_plaque select 6];

[_plaquetexte,_classname,_nameplayer,_insure] remoteExec ["ALF_fnc_resultPlaque",_unit];
