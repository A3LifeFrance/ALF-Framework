/*
	File: fn_createTajSony.sqf
	Author: ALF Team
*/
private["_unit"];
private _name = _this select 0;
private _mode = _this select 1;
private _lieu = _this select 2;
private _date = _this select 3;
private _infra = _this select 4;
_unit = _this select 5;

_name = toArray _name;
_lieu = toArray _lieu;
_date = toArray _date;
_infra = toArray _infra;

private _check = format["SELECT name FROM taj WHERE name='%1' AND infra='%2' AND active='1'",_name,_infra];
private _result = [_check,2] call HC_fnc_asyncCall;
if(count _result > 0) then {
	["TAJ","Cette personne existe déjà dans la database.","warning",false] remoteExec ["ALF_fnc_doMsg",_unit];
} else {
	private _query = format["INSERT INTO taj (name, type, lieu, date, infra) VALUES ('%1','%2','%3','%4','%5')",_name,_mode,_lieu,_date,_infra];
	[_query,1] call HC_fnc_asyncCall;
	["TAJ","Cette personne a bien été ajouté dans la database.","success",false] remoteExec ["ALF_fnc_doMsg",_unit];
};
