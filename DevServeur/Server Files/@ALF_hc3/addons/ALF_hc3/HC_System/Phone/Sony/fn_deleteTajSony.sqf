/*
	File: fn_deleteTajSony.sqf
	Author: ALF Team
*/
private["_lieu","_infra","_date","_query","_unit"];
_lieu = _this select 0;
_infra = _this select 1;
_date = _this select 2;
_unit = _this select 3;

_lieu = toArray _lieu;
_infra = toArray _infra;
_date = toArray _date;

_query = format["UPDATE taj SET active='0' WHERE lieu='%1' AND date='%2' AND infra='%3' AND active='1'",_lieu,_date,_infra];
[_query,1] call HC_fnc_asyncCall;

["TAJ","Cette personne a bien été supprimé de la database.","success",false] remoteExec ["ALF_fnc_doMsg",_unit];
