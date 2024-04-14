/*
	File : fn_deleteDBmobilier.sqf
	Author: ALF Team

	This file is for Nanou's HeadlessClient.

	Description:
	Delete mobilier and remove mobilier in Database
*/
params [
	["_mobilier",objNull,[objNull]],
	["_house",objNull,[objNull]]
];
if(isNull _mobilier) exitWith {};

private _mobilierID = (_mobilier getVariable ["mobilier_data",["",-1,"",objNull,"",false]]) select 1;

if(_mobilierID isEqualTo -1) exitWith {deleteVehicle _mobilier;};

private _query = format["DELETE FROM mobiliers WHERE id='%1'",_mobilierID];
[_query,1] call HC_fnc_asyncCall;

_mobiliers = _house getVariable ["mobiliers",[]];
{
	if (_x isEqualTo _mobilier) then {
		_mobiliers deleteAt _forEachIndex;
	};
} forEach _mobiliers;
_house setVariable ["mobiliers",_mobiliers];

deleteVehicle _mobilier;
