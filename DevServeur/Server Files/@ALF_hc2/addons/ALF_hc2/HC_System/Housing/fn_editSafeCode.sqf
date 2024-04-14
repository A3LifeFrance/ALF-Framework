/*
	File: fn_editSafeCode.sqf
	Author: ALF TEAM
*/
params [
	["_obj",objNull,[objNull]],
	["_number","",[""]]
];
if(isNull _obj OR {_number isEqualTo ""}) exitWith {};

private _var = _obj getVariable ["mobilier_data",["",-1,"",objNull,"",false]];
_var params [
	["_owner","",[""]],
	["_id",-1,[0]],
	["_classname","",[""]],
	["_house",objNull,[objNull]],
	["_safe","",[""]],
	["_perced",false,[false]],
	["_locked",false,[false]]
];
if(_id isEqualTo -1) exitWith {};

_var set[4,_number];
_obj setVariable ["mobilier_data",_var];

[format["UPDATE mobiliers SET code='%2' WHERE id='%1'",_id,_number],1] call HC_fnc_asyncCall;
