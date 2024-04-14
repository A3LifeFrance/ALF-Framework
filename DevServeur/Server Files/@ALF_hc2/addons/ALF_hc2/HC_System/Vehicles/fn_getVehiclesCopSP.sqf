/*
	File: fn_getVehiclesCopSP.sqf
	Author: ALF TEAM
*/
params [
	["_type",-1,[-1]],
	["_type_veh","",[""]],
	["_unit",objNull,[objNull]]
];

if(_type_veh isEqualTo "" OR {isNull _unit}) exitWith {
	if !(isNull _unit) then {
		[[]] remoteExec ["life_fnc_impoundMenuCopSP",_unit];
	};
};

private _query = "";
if(_type isEqualTo -1) then {
	_query = format["SELECT id, classname, type, alive, active, plate, fuel, lockveh, locktime, damage, id_garage FROM vehicles_cop WHERE alive='1' AND active='0' AND type='%1'",_type_veh];
} else {
	_query = format["SELECT id, classname, type, alive, active, plate, fuel, lockveh, locktime, damage, id_garage FROM vehicles_med WHERE alive='1' AND active='0' AND type='%1'",_type_veh];
};
private _queryResult = [_query,2,true] call HC_fnc_asyncCall;

if(_queryResult isEqualType "") exitWith {
	[[]] remoteExec ["life_fnc_impoundMenuCopSP",_unit];
};

//plate + damage
private ["_plate","_damage"];
{
	_plate = [_x select 5] call HC_fnc_mresToArray;
	if(_plate isEqualType "") then {_plate = call compile format["%1", _plate];};

	_damage = [_x select 9] call HC_fnc_mresToArray;
	if(_damage isEqualType "") then {_damage = call compile format["%1", _plate];};

	_x set[5,_plate];
	_x set[9,_damage];
} forEach _queryResult;

private _nonfourriere = _queryResult select {(_x select 7) isEqualTo 0};
private _fourriere = _queryResult select {(_x select 7) isEqualTo 1};

[_nonfourriere,_fourriere,_type] remoteExec ["life_fnc_impoundMenuCopSP",_unit];
