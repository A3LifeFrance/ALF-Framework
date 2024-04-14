/*
	File: fn_houseCleanup.sqf
	Author: ALF TEAM
*/
params [
	["_uid","",[""]]
];
if (_uid isEqualTo "") exitwith {};

private _houses = [format["SELECT pos FROM houses WHERE pid='%1'",_uid],2,true] call HC_fnc_asyncCall;
if(_houses isEqualTo []) exitWith {};

{
	private _house = nearestObject [(call compile format["%1",_x select 0]),"House"];
	if (count(_house getVariable ["house_owner",[]]) > 0) then {
		private _ownerID = (_house getVariable ["house_owner",[]]) select 0;
		if(_ownerID isEqualTo _uid) then {
			{
				if ((_x getVariable ["mobilier_data",["",-1,"",objNull,"",false]] select 3) isEqualTo _house) then {
					deleteVehicle _x;
				};
			} forEach ((nearestObjects [_house, [], 40]) select {isSimpleObject _x || {(typeOf _x) isEqualTo "Land_ALF_Plante_W_2"}});
			_house setVariable ["mobiliers",[]];
		};
	};
} forEach _houses;
