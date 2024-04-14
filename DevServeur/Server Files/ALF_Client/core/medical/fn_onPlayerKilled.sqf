#include "\ALF_Client\script_macros.hpp"
/*
	File: fn_onPlayerKilled.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	When the player dies collect various information about that player
	and pull up the death dialog / camera functionality.
*/
params [
	["_unit",objNull,[objNull]],
	["_killer",objNull,[objNull]]
];
disableSerialization;

"mort" cutText ["","BLACK FADED"];
"mort" cutFadeOut 99999999;

alf_death_effect = ppEffectCreate ["DynamicBlur", 500];
alf_death_effect ppEffectEnable true;
alf_death_effect ppEffectAdjust [8];
alf_death_effect ppEffectCommit 5;

life_killer = _killer;
ALF_Killed = true;
if (alf_gendarmerie_command) then {
	[false, player] remoteExecCall ["HC_fnc_switchCommand", HC_Life];
};

if (isPlayer life_killer && !(_unit != life_killer)) then {
	if((vehicle _unit) != _unit) then {
		[name _unit,getPlayerUID _unit,"MORT",format["Il s est suicidé a bord de %1.",typeOf(vehicle _unit)]] remoteExec ["HC_fnc_logIt",HC3_Life];
	} else {
		[name _unit,getPlayerUID _unit,"MORT","Il s est suicidé."] remoteExec ["HC_fnc_logIt",HC3_Life];
	};
};

if((vehicle _unit) != _unit) then {
	UnAssignVehicle _unit;
	_unit action ["getOut", vehicle _unit];
	_unit setPosATL [(getPosATL _unit select 0) + 3, (getPosATL _unit select 1) + 1, 0];
};

if ([] call mav_gps_fnc_isNavigationRunning) then {
	[] call mav_gps_fnc_stopNavigationScripted;
};

//Il est mort et on envoit à la DB
life_is_alive = false;
[18] call SOCK_fnc_updatePartial;

//On garde sa position pour le respawned
life_civ_position = getPosATL _unit;

//On garde son stuff pour le respawned
life_save_gear = getUnitLoadout _unit;

_containers = nearestObjects[getPosATL _unit,["WeaponHolderSimulated"],5];
{deleteVehicle _x;} forEach _containers;

alf_ms_active = false;
alf_ms_bpm = 80;
alf_ms_mmHg = 120;
alf_ms_resp = 15;
alf_ms_spo2 = 97;
alf_ms_pain = 0;
alf_ms_bouteille = false;
_unit setVariable ["bouteilleo2",alf_ms_bouteille,HC3_life];
