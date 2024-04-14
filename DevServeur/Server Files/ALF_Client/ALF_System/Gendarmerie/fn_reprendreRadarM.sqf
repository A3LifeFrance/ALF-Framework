#include "\ALF_Client\script_macros.hpp"
/*
File: fn_reprendreRadarM.sqf
Author: ALF Team
*/
private["_radar"];
_radar = _this select 0;
if !(player canAdd "ALF_Radar_m_i") exitWith {["Radar Mobile", "Tu n'as pas assez de place.", "warning"] spawn ALF_fnc_doMsg;};
deleteVehicle _radar;
["ALF_Radar_m_i",true] spawn life_fnc_handleItem;
