#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_silentGearSave.sqf
	Author: ALF Nanou
*/
private ["_unit","_container","_veh"];
_unit = _this select 0;
_container = _this select 1;
if(isNull _unit OR {isNull _container}) exitWith {};

if(_container in [alf_coffre_prison_1,alf_coffre_prison_2,alf_coffre_prison_3,alf_coffre_prison_4,alf_coffre_prison_5,alf_coffre_prison_6,alf_coffre_prison_7,alf_coffre_prison_8,alf_coffre_prison_9,alf_coffre_prison_10,alf_coffre_prison_11,alf_coffre_prison_12,alf_coffre_prison_13,alf_coffre_prison_14,alf_coffre_prison_15,alf_coffre_prison_16,alf_coffre_prison_17,alf_coffre_prison_18,alf_coffre_prison_19,alf_coffre_prison_20,alf_coffre_prison_21,alf_coffre_prison_22,alf_coffre_prison_23]) exitWith {
	[_container] spawn {
		_container = _this select 0;
		life_query_time = time;
		if !(alf_gearsave) then {
			alf_gearsave = true;
			waitUntil {sleep 0.3; (time - life_query_time) >= 2};
			[2] spawn SOCK_fnc_updatePartial;
			alf_gearsave = false;
			if !(isNull _container) then {
				[_container] remoteExec ["HC_fnc_saveCoffre",HC_Life];
			};
		};
	};
};

if(_container isEqualTo alf_banque_sang) exitWith {
	[_container] spawn {
		_container = _this select 0;
		life_query_time = time;
		if !(alf_gearsave) then {
			alf_gearsave = true;
			waitUntil {sleep 0.3; (time - life_query_time) >= 2};
			[2] spawn SOCK_fnc_updatePartial;
			alf_gearsave = false;
			if !(isNull _container) then {
				[_container] remoteExec ["HC_fnc_saveBanqueSang",HC_Life];
			};
		};
	};
};

[_container] spawn {
	_veh = _this select 0;
	life_query_time = time;
	if !(alf_gearsave) then {
		alf_gearsave = true;
		waitUntil {sleep 0.3; (time - life_query_time) >= 2};
		[2] spawn SOCK_fnc_updatePartial;
		alf_gearsave = false;
		if !(isNull _veh) then {
			if(_veh isKindOf "Car" OR {_veh isKindOf "Air"} OR {_veh isKindOf "Ship"}) then {
				[_veh,1] remoteExec ["HC_fnc_vehicleUpdate",HC2_Life];
			};
		};
	};
};
