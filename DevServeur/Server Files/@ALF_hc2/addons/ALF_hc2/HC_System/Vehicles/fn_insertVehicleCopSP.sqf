/*
	File: fn_insertVehicleCopSP.sqf
	Author: ALF - Adam
*/
params [
	["_type",-1,[-1]],
	["_classname","",[""]],
	["_type_veh","",[""]],
	["_unit",objNull,[objNull]]
];

if(_className isEqualTo "") exitWith {};

private _letters = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"];
private _numbers = ["0","1","2","3","4","5","6","7","8","9"];
private _ps1 = format ["%1", "-"];
private _ps2 = format ["%1", "-"];
private _pl1 = format ["%1", selectRandom _letters];
private _pl2 = format ["%1", selectRandom _letters];
private _pl3 = format ["%1", selectRandom _letters];
private _pl4 = format ["%1", selectRandom _letters];
private _pn1 = format ["%1", selectRandom _numbers];
private _pn2 = format ["%1", selectRandom _numbers];
private _pn3 = format ["%1", selectRandom _numbers];
private _pfinal = [_pl1, _pl2, _ps1, _pn1, _pn2, _pn3, _ps2, _pl3, _pl4];
private _plaquefinal = format["""[`%1`,`%2`,`%3`,`%4`,`%5`,`%6`,`%7`,`%8`,`%9`]""",_pl1,_pl2,_ps1,_pn1,_pn2,_pn3,_ps2,_pl3,_pl4];
private _queryplate = format["SELECT plate FROM vehicles_cop WHERE plate='%1'",_plaquefinal];
private _plateresult = [_queryplate,2] call HC_fnc_asyncCall;

if((count _plateresult) isEqualTo 0) then {
	private _querydispo = format["SELECT dispo FROM shop WHERE classname='%1'",_className];
	private _disporesult = [_querydispo,2] call HC_fnc_asyncCall;
	if (_disporesult isEqualTo []) exitWith {};
	private _dispo = _disporesult select 0;
	private _newdispo = _dispo - 1;
	if(_newdispo < 0) exitWith {
		["INFO","Erreur dans le système, le véhicule n'était plus disponible.","danger"] remoteExec ["ALF_fnc_doMsg",_unit];
	};
	private _query = format["UPDATE shop SET dispo='%1' WHERE classname='%2'",_newdispo,_className];
	[_query,1] call HC_fnc_asyncCall;
	
	if (_type isEqualTo -1) then {
		_query = format["INSERT INTO vehicles_cop (classname, type, alive, active, plate, gear, position, damage, id_garage) VALUES ('%1', '%2', '1', '0', '%3', '""[]""', '""[]""', '""[]""', '0')",_className,_type_veh,_plaquefinal];
	} else {
		_query = format["INSERT INTO vehicles_med (classname, type, alive, active, plate, gear, position, damage, id_garage) VALUES ('%1', '%2', '1', '0', '%3', '""[]""', '""[]""', '""[]""', '0')",_className,_type_veh,_plaquefinal];
	};
	[_query,1] call HC_fnc_asyncCall;
} else {
	[_type,_className,_type_veh,_unit] call HC_fnc_insertVehicleCopSp;
};
