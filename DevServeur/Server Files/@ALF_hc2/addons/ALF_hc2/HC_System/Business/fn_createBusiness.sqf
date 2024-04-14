/*
	File: fn_createBusiness.sqf
	Author: Nanou
	This file is for Nanou's HeadlessClient.
*/
private ["_uid","_pos","_name","_ctrl","_num","_unit"];
_uid = _this select 0;
_pos = _this select 1;
_name = _this select 2;
_ctrl = _this select 3;
_num = _this select 4;
_unit = _this select 5;
if(isNil "_uid" OR {isNil "_pos"} OR {isNil "_name"} OR {isNil "_ctrl"} OR {isNil "_num"}) exitWith {};

private _siret = [100000,999999] call BIS_fnc_randomInt;
_siret = [_siret] call HC_fnc_numberSafe;
private _siretf = format["732%1",_siret];

private _count = ([format["SELECT COUNT(*) FROM business WHERE siret='%1'",_siretf],2] call HC_fnc_asyncCall) select 0;
while {_count > 0} do {
	_siret = [100000,999999] call BIS_fnc_randomInt;
	_siret = [_siret] call HC_fnc_numberSafe;
	_siretf = format["732%1",_siret];

	_count = ([format["SELECT COUNT(*) FROM business WHERE siret='%1'",_siretf],2] call HC_fnc_asyncCall) select 0;
};

private _posArray = [_pos] call HC_fnc_mresArray;
private _count = ([format["SELECT COUNT(*) FROM business WHERE pos='%1'",_pos],2] call HC_fnc_asyncCall) select 0;
if(_count > 0) exitWith {["Entreprise", "Un dossier pour ce bâtiment a deja ete depose.", "warning"] remoteExec ["ALF_fnc_doMsg",_unit];};

private _membres = [[["Moi",_uid,4]]] call HC_fnc_mresArray;

_name = [_name] call HC_fnc_mresArray;
_num = [_num] call HC_fnc_numberSafe;

[format["INSERT INTO business (owner, pos, name, siret, capital, secteur, membres, level, active) VALUES ('%1','%2','%3','%4','%5','%6','%7','0','0')",_uid,_posArray,_name,_siretf,_num,_ctrl,_membres],1] call HC_fnc_asyncCall;
["Entreprise", "Le dossier a bien ete envoye.", "success"] remoteExec ["ALF_fnc_doMsg",_unit];
