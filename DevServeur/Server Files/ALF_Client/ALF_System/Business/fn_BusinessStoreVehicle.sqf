/*
	File: fn_BusinessstoreVehicle.sqf
	Author: Nanou
*/
private _owner = _this select 0;
private _vehicle = objNull;
_nearVehicles = (position player) nearEntities [["Car","Air","Ship"],30];
if !(count _nearVehicles isEqualTo 0) then {
	{
		private _vehData = _x getVariable ["business_veh",[]];
		if(count _vehData  > 0) exitWith {
			_vehicle = _x;
		};
	} forEach _nearVehicles;
};

if(isNull _vehicle) exitWith {["INFO","Aucun véhicule d'entreprise.","warning"] spawn ALF_fnc_doMsg;};
if(!alive _vehicle) exitWith {["INFO","Le véhicule est mort.","warning"] spawn ALF_fnc_doMsg;};

[_vehicle,player] remoteExec ["HC_fnc_vehicleStoreBusiness",HC2_Life];

hint "Connection avec le serveur..";
life_garage_store = true;
