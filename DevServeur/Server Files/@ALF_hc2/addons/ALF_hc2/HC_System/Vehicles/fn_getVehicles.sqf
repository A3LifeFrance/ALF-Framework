/*
	File: fn_getVehicles.sqf
	Author: ALF TEAM
*/
params [
	["_pid","",[""]],
	["_type","",[""]],
	["_unit",objNull,[objNull]]
];

//Error checks
if(_pid isEqualTo "" OR {_type isEqualTo ""} OR {isNull _unit}) exitWith {
	if !(isNull _unit) then {
		[[]] remoteExec ["life_fnc_impoundMenu",_unit];
	};
};

private _query = format["SELECT id, classname, type, pid, alive, active, plate, fuel, insure, insurecount, lockveh, locktime, damage, id_garage FROM vehicles WHERE pid='%1' AND alive='1' AND active='0' AND type='%2'",_pid,_type];
private _queryResult = [_query,2,true] call HC_fnc_asyncCall;

if(_queryResult isEqualType "") exitWith {
	[[]] remoteExec ["life_fnc_impoundMenu",_unit];
};

//plate + damage
private ["_plate","_damage"];
{
	_plate = [_x select 6] call HC_fnc_mresToArray;
	if(_plate isEqualType "") then {_plate = call compile format["%1", _plate];};

	_damage = [_x select 12] call HC_fnc_mresToArray;
	if(_damage isEqualType "") then {_damage = call compile format["%1", _plate];};

	_x set[6,_plate];
	_x set[12,_damage];
} forEach _queryResult;

private _nonfourriere = _queryResult select {(_x select 10) isEqualTo 0};
private _fourriere = _queryResult select {(_x select 10) isEqualTo 1};

[_nonfourriere,_fourriere] remoteExec ["life_fnc_impoundMenu",_unit];
