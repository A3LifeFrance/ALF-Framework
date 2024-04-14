/*
	File: fn_clientDisconnect.sqf
	Author: Bryan "Tonic" Boardwine

	unit: Object - unit formerly occupied by player
	id: Number - same as _id in onPlayerDisconnected
	uid: String - same as _uid in onPlayerDisconnected
	name: String - same as _name in onPlayerDisconnected
*/
//ON VERIFIE SI LES HCs SONT DANS LA PLACE.
if(isNil "hc_1" OR {isNil "hc_2"} OR {isNil "hc_3"}) exitWith {};

params[
	["_unit",objNull,[objNull]],
	["_id",0,[0]],
	["_uid","",[""]],
	["_name","",[""]]
];

//ERROR SPOTED?!
if(isNull _unit OR {_uid isEqualTo (getPlayerUID hc_1)} OR {_uid isEqualTo (getPlayerUID hc_2)} OR {_uid isEqualTo (getPlayerUID hc_3)}) exitWith {};

//Save player info
if (_unit distance (getMarkerPos "respawn_civilian") > 500) then {
	private _pos = getPosATL _unit;
	private _gear = getUnitLoadout _unit;
	private _item = ((_gear select 9) select 2);
	if (_item call TFAR_fnc_isRadio) then {
		private _array = (_gear select 9);
		_array set [2,((_item splitString "_") select 0) + "_" + ((_item splitString "_") select 1)];
		_gear set [9,_array];
	};
	[_uid,_pos,_gear] remoteExecCall ["HC_fnc_savePlayerDisconnect",HC_Life];
};

private _cleanup = nearestObjects[_unit,["WeaponHolderSimulated"],5];
{deleteVehicle _x;} forEach _cleanup;
deleteVehicle _unit;

private _array2 = missionNamespace getVariable ["ALF_AllBracelets",[]];
_array2 = _array2 - [objNull];

if !((count _array2) isEqualTo (count (missionNamespace getVariable ["ALF_AllBracelets",[]]))) then {
	missionNamespace setVariable ["ALF_AllBracelets",_array2,true];
};

[_uid] remoteExecCall ["HC_fnc_houseCleanup",HC2_Life];
[] remoteExecCall ["HC_fnc_disconnectService",HC3_Life];
