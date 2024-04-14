/*
	File: fn_addHouse.sqf
	Author: Bryan "Tonic" Boardwine

	This file is for Nanou's HeadlessClient.

	Description:
	Blah
*/
params [
	["_uid","",[""]],
	["_house",objNull,[objNull]],
	["_name","",[""]]
];
if(isNull _house || {_uid isEqualTo ""}) exitWith {};

private _housePos = getPosATL _house;

private _query = format["INSERT INTO houses (pid, pos, mailbox, classname) VALUES('%1', '%2','""[]""', '%3')",_uid,_housePos,typeOf(_house)];
[_query,1] call HC_fnc_asyncCall;

uiSleep 0.3;

_query = format["SELECT id FROM houses WHERE pos='%1' AND pid='%2'",_housePos,_uid];
_queryResult = [_query,2] call HC_fnc_asyncCall;

_house setVariable ["house_id",(_queryResult select 0)];
_house setVariable ["house_owner",[_uid,_name]];
_house setVariable ["mobiliers",[]];
