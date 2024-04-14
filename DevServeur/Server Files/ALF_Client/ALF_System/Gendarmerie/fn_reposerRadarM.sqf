#include "\ALF_Client\script_macros.hpp"
/*
File: reposerRadarM.sqf
Author: ALF Team
*/
private["_radar"];
_radar = _this select 0;
if(life_copLevel isEqualTo 0 OR {[player] call ALF_fnc_checkMenotter} OR {[player] call ALF_fnc_checkSurrender}) exitWith {};
if !("ALF_Rangefinder" in (magazines player)) exitWith {["INFO","Il faut mettre le télémetre dans son sac..","warning"] spawn ALF_fnc_doMsg;};
_radar animate ["clic",0];
_radar setVariable ["RadarM",[0,0,[]],true];
["ALF_Rangefinder",false] spawn life_fnc_handleItem;
