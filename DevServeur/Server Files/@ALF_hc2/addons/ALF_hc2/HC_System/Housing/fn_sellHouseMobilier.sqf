/*
	File : fn_sellHousemobilier.sqf
	Author: ALF TEAM

	This file is for Nanou's HeadlessClient.
*/
params [
	["_house",objNull,[objNull]]
];
if(isNull _house) exitWith {};

private _mbs = _house getVariable["mobiliers",[]];
if(count(_mbs) > 0) then {
	{
		private _mobid = (_x getVariable ["mobilier_data",["",-1,"",objNull,"",false]]) select 1;
		if !(_mobid isEqualTo -1) then {
			[format["DELETE FROM mobiliers WHERE id='%1'",_mobid],1] call HC_fnc_asyncCall;
			deleteVehicle _x;
		};
	} forEach _mbs;
};
_house setVariable ["mobiliers",nil];
