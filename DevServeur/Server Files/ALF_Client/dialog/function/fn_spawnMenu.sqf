/*
	File: fn_spawnMenu.sqf
	Author: Bryan "Tonic" Boardwine
	Description:
	Initializes the spawn point selection menu.
*/
private ["_nearestMarker","_nearestLits","_obj"];
disableSerialization;

if (ALF_Prison) exitWith {
	[] spawn life_fnc_respawned;
};

[] spawn life_fnc_respawned;

if !(vehicle player isEqualTo player) then {
	moveOut player;
};
_nearestMarker = [["respawn_hp_1","respawn_hp_2","respawn_hp_3"], life_civ_position] call BIS_fnc_nearestPosition;
_nearestLits = nearestObjects [(getMarkerPos _nearestMarker), ["Land_ALF_H_bed"], 250];
_obj = _nearestLits call BIS_fnc_selectRandom;
[_obj] execVM "\ALF_Mobiliers\ALF_H_Lit\sitdown.sqf";

0 cutText["","BLACK FADED"];
0 cutFadeOut 9999999;
