/*
	File: fn_getUnitFromNumberSR.sqf
	Author: ALF Team
*/
params [
	["_number","",[""]]
];
if (_number isEqualTo "") exitWith {};

private _query = format["SELECT expediteur, destinataire, position, insert_time FROM tel_appel WHERE destinataire='%1' OR expediteur='%1'",_number];
private _queryResult = [_query,2,true] call HC_fnc_asyncCall;

if (count(_queryResult) isEqualTo 0) then {
	_queryResult = [[]];
} else {
	{
		_x set[2, call compile format["%1", _x select 2]];
	} forEach _queryResult;
};

private _target = playableUnits param [playableUnits findIf {(_x getVariable ["phoneNumber",""]) isEqualTo _number}, objNull];

[2, _queryResult, _number, _target] remoteExecCall ["ALF_fnc_menuInspectTel", remoteExecutedOwner];