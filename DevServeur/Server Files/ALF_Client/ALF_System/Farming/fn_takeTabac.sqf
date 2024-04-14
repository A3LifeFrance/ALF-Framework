#include "\ALF_Client\script_macros.hpp"
/*
  File: fn_takeTabac.sqf
  ALF Nanou
*/
params [
  ["_obj",objNull,[objNull]]
];

if !(player canAdd "ALF_Tabac") exitWith {["Tabac", "Tu n'as pas assez de place.", "warning", false] spawn ALF_fnc_doMsg;};
deleteVehicle _obj;
["ALF_Tabac",true] spawn life_fnc_handleItem;

[0,5] spawn ALF_fnc_addXP;
