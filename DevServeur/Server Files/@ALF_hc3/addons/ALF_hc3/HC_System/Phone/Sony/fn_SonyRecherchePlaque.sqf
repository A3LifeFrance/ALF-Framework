/*
	File: fn_SonyRecherchePlaque.sqf
	Author: ALF Team

	This file is for Nanou's HeadlessClient.

	Description:
*/
private["_plaque","_unit","_plaquefinal","_query","_queryResult","_classname","_pid","_insure","_query2","_queryResult2","_nameplayer","_plaquetexte"];
_plaque = _this select 0;
_unit = _this select 1;
if(_plaque isEqualTo "" OR isNull _unit) exitWith {};

_plaquefinal = format["""[`%1`,`%2`,`-`,`%3`,`%4`,`%5`,`-`,`%6`,`%7`]""",_plaque select 0,_plaque select 1,_plaque select 2,_plaque select 3,_plaque select 4,_plaque select 5,_plaque select 6];

_query = format["SELECT classname, pid , insure FROM vehicles WHERE plate='%1'",_plaquefinal];
_queryResult = [_query,2] call HC_fnc_asyncCall;
if((count _queryresult) isEqualTo 0) exitWith {["Gendarmerie","Aucun véhicule n'est attribué à cette plaque.","warning",false] remoteExec ["ALF_fnc_doMsg",_unit];};

_classname = _queryResult select 0;
_pid = _queryResult select 1;
_insure = _queryResult select 2;

_query2 = format["SELECT name FROM players WHERE playerid='%1'",_pid];
_queryResult2 = [_query2,2] call HC_fnc_asyncCall;
if((count _queryresult) isEqualTo 0) exitWith {};

_nameplayer = _queryResult2 select 0;
_plaquetexte = format["%1%2-%3%4%5-%6%7",_plaque select 0,_plaque select 1,_plaque select 2,_plaque select 3,_plaque select 4,_plaque select 5,_plaque select 6];

[_plaquetexte,_classname,_nameplayer,_insure] remoteExec ["ALF_fnc_SonyResultPlaque",_unit];
