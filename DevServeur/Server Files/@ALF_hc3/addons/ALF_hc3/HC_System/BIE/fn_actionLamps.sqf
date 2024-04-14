/*
	File: fn_actionLamps.sqf
	Author: ALF TEAM
*/
params [
	["_object",objNull,[objNull]]
];
if (isNull _object) exitWith {};

//On récupère le marker lié au transfo
private _marker = [["bie_secteur_1","bie_secteur_2","bie_secteur_3"],_object] call BIS_fnc_nearestPosition;

//On active les lumières
{
	if([_x] call ALF_fnc_hasEnergy) then {
		//[_x, true] call BIS_fnc_switchLamp;
		[_x, ["#light_1_hitpoint", 0]] remoteExec ["setHitPointDamage", 0];
		[_x, ["#light_2_hitpoint", 0]] remoteExec ["setHitPointDamage", 0];
		[_x, ["#light_3_hitpoint", 0]] remoteExec ["setHitPointDamage", 0];
		[_x, ["#light_4_hitpoint", 0]] remoteExec ["setHitPointDamage", 0];
	} else {
		//[_x, false] call BIS_fnc_switchLamp;
		[_x, ["#light_1_hitpoint", 1]] remoteExec ["setHitPointDamage", 0];
		[_x, ["#light_2_hitpoint", 1]] remoteExec ["setHitPointDamage", 0];
		[_x, ["#light_3_hitpoint", 1]] remoteExec ["setHitPointDamage", 0];
		[_x, ["#light_4_hitpoint", 1]] remoteExec ["setHitPointDamage", 0];
	};
} forEach (nearestObjects [(getMarkerPos _marker),["Lamps_base_F", "PowerLines_base_F", "PowerLines_Small_base_F"],5000]);