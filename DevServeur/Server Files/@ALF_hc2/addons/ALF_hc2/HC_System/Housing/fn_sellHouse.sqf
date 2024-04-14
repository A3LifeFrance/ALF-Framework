/*
	File: fn_sellHouse.sqf
	Author: ALF TEAM

	This file is for Nanou's HeadlessClient.
*/
params [
	["_house",objNull,[objNull]]
];
if(isNull _house) exitWith {};

private _houseID = _house getVariable["house_id",-1];
if(_houseID isEqualTo -1) exitWith {};

[format["DELETE FROM houses WHERE id='%1'",_houseID],1] call HC_fnc_asyncCall;

[format["DELETE FROM keysTime WHERE mode='1' AND idobj='%1'",_houseID],1] call HC_fnc_asyncCall;

[_house] remoteExec ["ALF_fnc_deleteKeysTime",playableUnits];

_house setVariable ["house_id",nil];
_house setVariable ["house_owner",nil];
_house setVariable ["ALF_PorteFermer",nil,true];
