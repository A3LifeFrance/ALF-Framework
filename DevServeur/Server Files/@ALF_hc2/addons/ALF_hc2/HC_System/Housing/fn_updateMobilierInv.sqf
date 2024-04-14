/*
	File: fn_updateMobilierInv.sqf
	Author: ALF TEAM
*/
params [
	["_obj",objNull,[objNull]]
];
if(isNull _obj) exitWith {};

private _id = (_obj getVariable ["mobilier_data",["",-1,"",objNull,"",false]]) select 1;
if(_id isEqualTo -1) exitWith {};
private _gear = [(_obj getVariable ["gear",[]])] call HC_fnc_mresArray;

[format["UPDATE mobiliers SET gear='%2' WHERE id='%1'",_id,_gear],1] call HC_fnc_asyncCall;
