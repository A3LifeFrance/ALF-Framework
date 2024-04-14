#include "\ALF_Client\script_macros.hpp"
/*
File: prendreRadarM.sqf
Author: ALF Team
*/
private["_radar"];
_radar = _this select 0;
if(life_copLevel isEqualTo 0 OR {[player] call ALF_fnc_checkMenotter} OR {[player] call ALF_fnc_checkSurrender}) exitWith {};
if !(player canAdd "ALF_Rangefinder") exitWith {["Radar Mobile", "Tu n'as pas la place.", "warning"] spawn ALF_fnc_doMsg;};
_radar animate ["clic",1];
_radar setVariable ["RadarM",[0,0,[]],true];
["ALF_Rangefinder",true] spawn life_fnc_handleItem;
