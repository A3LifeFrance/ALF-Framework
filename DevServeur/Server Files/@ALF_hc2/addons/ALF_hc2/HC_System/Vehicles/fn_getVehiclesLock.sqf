/*
	File: fn_getVehiclesLock.sqf
*/
params [
	["_unit",objNull,[objNull]]
];
if(isNull _unit) exitWith {};

private _queryResult = ["SELECT id, classname, type, pid, alive, active, plate, fuel, insure FROM vehicles WHERE alive='1' AND active='0' AND lockveh='1'",2,true] call HC_fnc_asyncCall;

if(_queryResult isEqualType "") exitWith {
	[[]] remoteExec ["life_fnc_impoundMenuLock",_unit];
};

//plate
private "_plate";
{
	_plate = [(_x select 6)] call HC_fnc_mresToArray;
	if(_plate isEqualType "") then {_plate = call compile format["%1",_plate];};
	_x set[6,_plate];
} forEach _queryResult;

[_queryResult] remoteExec ["life_fnc_impoundMenuLock",_unit];
