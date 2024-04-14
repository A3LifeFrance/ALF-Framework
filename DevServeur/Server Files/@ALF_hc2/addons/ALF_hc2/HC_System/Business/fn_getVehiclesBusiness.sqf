/*
	File: fn_getVehiclesBusiness.sqf
	Author: Nanou
*/
params[
	["_building",objNull,[objNull]],
	["_type","",[""]],
	["_pid","",[""]],
	["_unit",objNull,[objNull]]
];
if(isNull _building OR {_type isEqualTo ""} OR {_pid isEqualTo ""} OR {isNull _unit}) exitWith {};

private _queryResult = [format["SELECT id, classname, alive, active, plate, fuel, insure FROM vehicles WHERE type='%1' AND pid='%2' AND alive='1' AND active='0' AND lockveh='0'",_type,_pid],2,true] call HC_fnc_asyncCall;

if(_queryResult isEqualType "") exitWith {
	[[],_building] remoteExec ["ALF_fnc_impoundMenuBusiness",_unit];
};

private "_plate";
{
	_plate = [(_x select 4)] call HC_fnc_mresToArray;
	if(_plate isEqualType "") then {_plate = call compile format["%1", _plate];};
	_x set[4,_plate];
} forEach _queryResult;

[_queryResult,_building] remoteExec ["ALF_fnc_impoundMenuBusiness",_unit];
