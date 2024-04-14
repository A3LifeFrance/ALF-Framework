#include "\ALF_hc\hc_macros.hpp"
/*
	File: fn_createVehiculeLeboncoin.sqf
*/
private _vehid = _this select 0;
private _obj = _this select 1;
private _txt1 = _this select 2;
private _txt2 = _this select 3;
private _txt3 = _this select 4;
private _num = _this select 5;
private _myNumber = _this select 6;
private _uid = _this select 7;
private _unit = _this select 8;

private _l = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"];
private _n = ["0","1","2","3","4","5","6","7","8","9"];
private _pl1 = format ["%1", _l call bis_fnc_selectrandom];
private _pl2 = format ["%1", _n call bis_fnc_selectrandom];
private _pl3 = format ["%1", _n call bis_fnc_selectrandom];
private _pl4 = format ["%1", _n call bis_fnc_selectrandom];
private _pl5 = format ["%1", _l call bis_fnc_selectrandom];
private _pf = format["%1%2%3%4%5",_pl1,_pl2,_pl3,_pl4,_pl5];

private _qp = format["SELECT numid FROM leboncoin WHERE numid='%1'",_pf];
private _pr = [_qp,2] call HC_fnc_asyncCall;
if !((count _pr) isEqualTo 0) exitWith {
	[_vehid,_obj,_txt1,_txt2,_txt3,_num,_myNumber,_uid,_unit] call HC_fnc_createVehiculeLeboncoin;
};

_txt1 = toArray _txt1;
_txt2 = toArray _txt2;
_txt3 = toArray _txt3;
_obj = toArray _obj;

_query = format["INSERT INTO leboncoin (seller, titre, description, prix, nom, numero, obj, numid) VALUES ('%1', '%2', '%3', '%4', '%5', '%6', '%7', '%8')",_uid,_txt1,_txt2,_num,_txt3,_myNumber,_obj,_pf];
[_query,1] call HC_fnc_asyncCall;

_query = format["UPDATE vehicles SET insure='0', pid='%2' WHERE id='%1'",_vehid,_pf];
[_query,1] call HC_fnc_asyncCall;

_query = format["DELETE FROM keysTime WHERE mode='0' AND idobj='%1'",_vehid];
[_query,1] call HC_fnc_asyncCall;

["Leboncoin","Vous avez publié une annonce sur Leboncoin.","success"] remoteExec ["ALF_fnc_doMsg",_unit];
